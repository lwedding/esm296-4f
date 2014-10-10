# uv-nc_to_country_monthly.py
# 2014-10-10 bbest@nceas.ucsb.edu
# description: extract wind speed from u and v netcdf files and summarize by country

# import modules
import arcpy, datetime, os
from arcpy.sa import *

# input variables
nc_u         = r"H:\esm296-4f\labs\lab2\raw\uwnd.sig995.2013.nc"
nc_v         = r"H:\esm296-4f\labs\lab2\raw\vwnd.sig995.2013.nc"
fc_cntry_in  = r"H:\esm296-4f\labs\lab2\raw\ne_10m_admin_0_countries.shp"
fc_cntry_out = r"H:\esm296-4f\labs\lab2\lab2.gdb\countries"
fld_cntry    = "NAME"
dir_out      = r"H:\esm296-4f\labs\lab2\out"
yr           = 2013

# setup arcpy environment
arcpy.CheckOutExtension("spatial")
arcpy.env.overwriteOutput = True

#-----
# loop over months, extracting resampled wind speed from netcdf files
arcpy.AddMessage("Iterating over months")
for mo in range(1, 13):

    # get the julian day for the 15th of every month, and set output path of speed tif based on dir_out
    j = (datetime.date(yr, mo, 15) - datetime.date(yr, 1, 1) + datetime.timedelta(1)).days    
    tif_s = "%s/s_%d-%02d.tif" % (dir_out, yr, mo)
    arcpy.AddMessage("  %d-%02d" % (mo, tif_s))

    # extract horizontal (u) and vertical (v) wind speeds from netcdf files
    arcpy.MakeNetCDFRasterLayer_md(nc_u, "uwnd", "lon", "lat", "u", "", "time 1", "BY_INDEX")
    arcpy.MakeNetCDFRasterLayer_md(nc_v, "vwnd", "lon", "lat", "v", "", "time 1", "BY_INDEX")

    # calculate total wind speed using Pythagorean theorem
    s = SquareRoot(Square("u") + Square("v"))

    # resample to finer resolution
    arcpy.Resample_management(s, tif_s, "0.25 0.25", "BILINEAR")

#-----
# extract summary of wind speeds by country across months
arcpy.AddMessage("Summarizing over months and countries.")

# setup variables
tifs_in     = ["%s/s_%d-%02d.tif" % (dir_out, yr, mo) for mo in range(1, 13)]
tif_s_avg   =  "%s/s_%s_avg.tif"  % (dir_out, yr)
tbl_s_cntry =  "%s/cntry_s_%s"    % (os.path.dirname(fc_cntry_out), yr)

# copy input country feature class so not joining data to raw input
arcpy.CopyFeatures_management(fc_cntry_in, fc_cntry_out)

# collapse cell values across months to a single annual mean
s_avg = CellStatistics(tifs_in, "MEAN", "DATA")
s_avg.save(tif_s_avg)

# get the country min/max/mean across all annual mean cells within each country
ZonalStatisticsAsTable(fc_cntry_out, fld_cntry, s_avg, tbl_s_cntry, "DATA", "MIN_MAX_MEAN")

# join back to copied output countries feature class
arcpy.JoinField_management(fc_cntry_out, fld_cntry, tbl_s_cntry, fld_cntry, "Min;Max;Mean")

arcpy.AddMessage("Finished")
