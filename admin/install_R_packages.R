# for spatial packages, see http://cran.r-project.org/web/views/Spatial.html
# for interactive examples, see http://shiny.rstudio.com/gallery/

pkgs = c(
  'classInt',
  'devtools',
  'foreign',
  'gdistance','geonames','geosphere','ggplo2','ggmap','ggvis','geoR',
  'landsat','leafletR',
  'maps','mapdata','mapproj','maptools','marmap',
  'ncdf',
  'PBSmapping',
  'raster','rasterVis','RColorBrewer','rgeos','rgdal','RgoogleMaps','rworldmap','rworldxtra','rMaps','rCharts',
  'shapefiles','sp','spacetime','spatial.tools','spatstat')
repos        = 'http://cran.rstudio.com'
lib          = .libPaths()[1]
dependencies = c('Depends', 'Imports', 'LinkingTo')
install.packages(pkgs, lib, repos, dependencies=dependencies)

pkgs_github  = c('rstudio/rmarkdown','ramnathv/rCharts','ropensci/rMaps','ropensci/taxize','ropensci/rgbif')
for (p in pkgs_github) devtools::install_github(p)