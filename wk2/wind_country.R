# http://cran.r-project.org/web/packages/raster/vignettes/Raster.pdf

# import libraries
library(ncdf)
library(raster)
library(RColorBrewer)
library(rgdal)
library(dplyr)

# variables (try auto-tab completion of paths in RStudio editor)
wd        = 'H:/esm296-4f'
u_nc      = 'H:/esm296-4f/labs/lab2/raw/uwnd.sig995.2013.nc'
v_nc      = 'H:/esm296-4f/labs/lab2/raw/vwnd.sig995.2013.nc'
out_dir   = 'H:/esm296-4f/labs/lab2/out'
img_dir   = 'H:/esm296-4f/github/lab2/img'
s_avg_tif = 'H:/esm296-4f/github/lab2/img/s_avg.tif'
cntry_shp = 'H:/esm296-4f/labs/lab2/raw/ne_10m_admin_0_countries.shp'

# # on bbest's mac
# wd        = '/Users/bbest/Documents/esm296-4f_docs/lab2'
# u_nc      = '/Users/bbest/Documents/esm296-4f_docs/lab2/raw/uwnd.sig995.2013.nc'
# v_nc      = '/Users/bbest/Documents/esm296-4f_docs/lab2/raw/vwnd.sig995.2013.nc'
# out_dir   = '/Users/bbest/Documents/esm296-4f_docs/lab2/out'
# img_dir   = '/Users/bbest/Documents/esm296-4f_docs/lab2/img'
# s_avg_tif = '/Users/bbest/Documents/esm296-4f_docs/lab2/out/s_avg.tif'
# cntry_shp = '/Users/bbest/Documents/esm296-4f_docs/lab2/raw/ne_10m_admin_0_countries.shp'

# creat img dir if not existing
dir.create(img_dir, showWarnings=F)

# open netcdf files to ncdf objects
u_ncdf = open.ncdf(u_nc)
v_ncdf = open.ncdf(v_nc)

# get dimensions
lat  = get.var.ncdf(u_ncdf, 'lat')
lon  = get.var.ncdf(u_ncdf, 'lon')
time = get.var.ncdf(u_ncdf, 'time')

# get data from ncdf objects
u = get.var.ncdf(u_ncdf, 'uwnd')
v = get.var.ncdf(v_ncdf, 'vwnd')

# loop through julian days, incrementing every 30 days
cat('\nlooping\n')
for (j in seq(1, 365, 30)){ # j = 1
  
  # set output vars
  s_tif = sprintf('%s/s_%03d.tif', out_dir, j)
  s_png = sprintf('%s/s_%03d.png', img_dir, j)
  cat(sprintf('  %s\n', basename(s_tif)))
  
  # extract slice of data for julian day
  u_j = u[,,j]
  v_j = v[,,j]
  
  # calculate total wind speed from vectors u and v
  s_j = sqrt(u_j^2 + v_j^2)
  
  # convert to raster with coordinate system of longitude / latitude
  s_j_r = raster(t(s_j), xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat))
  
  # resample to 10x finer resolution
  s_j10_r = resample(
    s_j_r,
    raster(
      xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat),
      nrow=nrow(s_j_r)*10, 
      ncol=ncol(s_j_r)*10),
    method='bilinear')
  
  # save to tif  
  writeRaster(s_j10_r, s_tif, overwrite=T)  
  
  # plot raster
  png(s_png, width=1200, height=800)
  plot(s_j10_r, col=brewer.pal(10, 'RdYlBu'), main=sprintf('Wind Speed for Day %d', j))
  dev.off()  
}

# calculate mean across rasters
cat('\ncalculating mean wind speed\n')
s_tifs = sprintf('%s/s_%03d.tif', out_dir, seq(1, 365, 30))
s_mean = mean(stack(sapply(s_tifs, function(tif) raster(tif))))

# rotate raster from 0:360 to -180:180
extent(s_mean) <- extent(0, 360, -90, 90)
s_mean_r = rotate(s_mean)
writeRaster(s_mean_r, s_avg_tif, overwrite=T)

# get zonal stats
cat('extracting mean/max values per country\n')
cntry_p   = readOGR(cntry_shp, tools::file_path_sans_ext(basename(cntry_shp)))
cntry_p@data['zone'] = as.integer(1:nrow(cntry_p@data))
cntry_r = rasterize(cntry_p, s_mean_r, 'zone')
z_mean = zonal(s_mean_r, cntry_r, mean, na.rm=T)
z_max  = zonal(s_mean_r, cntry_r, max, na.rm=T)

# join to country polygons
cat('joining data to shapefile\n')
cntry_p@data = cntry_p@data %>%
  left_join(
    data.frame(z_max) %>%
      mutate(zone = as.integer(zone)) %>%
      select(zone, s_max=value),
    by='zone') %>%
  left_join(
    data.frame(z_mean) %>%
      mutate(zone = as.integer(zone)) %>%
      select(zone, s_mean=value),
    by='zone')

# plot
for (v in c('s_max','s_mean')){
  png(sprintf('%s/%s.png', out_dir, v), width=1200, height=800)
  plot(cntry_p[v], col=brewer.pal(10, 'RdYlBu'))
  title(v)
  dev.off()
}

# write to csv
cntry_p@data %>%
  select(NAME, s_max, s_mean) %>%
  arrange(desc(s_max)) %>%
  write.csv(sprintf('%s/country_wind.csv', out_dir, v))