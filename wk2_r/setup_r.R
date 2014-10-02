# paths to set in R environmnent startup
home        = 'H:/'
r_libs_user = 'H:/R/win-library/3.1'

# create directory for user installed packages
dir.create(r_libs_user, recursive = TRUE)

# setup home directory and path to user installed packages
cat(sprintf(
  "
HOME=%s
R_LIBS_USER=%s
", home, r_libs_user), 
  file = file.path(path.expand('~'), '.Renviron'))

# test with these commands:
#Sys.getenv('HOME'); Sys.getenv('R_LIBS_USER')