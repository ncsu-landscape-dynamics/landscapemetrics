## Read in libraries
library(raster)
library(landscapemetrics)

## Create 1,000 100x100 random binary (0 or 1) rasters
# create 100x100 grid of 100 m resolution pixels
ncol <- 100
nrow <- 100
number <- nrow *ncol
xmax <- nrow * 100
ymax <- ncol * 100
# create random landscape
landscape <- matrix(round(runif(number, 0, 1)), nrow = nrow, ncol = ncol)
landscape <- raster(landscape, xmn = 0, ymn = 0, xmx = xmax, ymx = ymax)
writeRaster(landscape, "H:/Team Drives/APHIS  Projects/Papers/landscapemetrics/data/landscape_0001.tif")


## Run metrics on all 1,000 landscapes
# Edge contrast metrics based on Cushman et al 2008 (not really applicable to a binary classification as the area is infected or uninfected)

# Patch shape complexity metrics based on Cushman et al 2008
lsm_c_shape_mn()
lsm_c_frac_mn()

# Agregation metrics based on Cushman et al 2008
lsm_c_clumpy()
lsm_c_pladj()
lsm_c_cohesion()
lsm_c_ai()

# nearest neighbor distance metrics based on Cushman et al 2008
lsm_c_enn_mn()

# Patch dispersion metrics based on Cushman et al 2008
lsm_c_enn_cv()

# Large patch dominance metrics based on Cushman et al 2008
lsm_c_lpi()
lsm_c_core_mn()
lsm_c_dcore_mn()
lsm_c_area_mn()

# Neighborhood similarity metrics based on Cushman et al 2008 (non in landscape metrics but has same issue as edge contrast for binary infected or uninfected)

# Patch size variability metrics based on Cushman et al 2008
lsm_c_area_cv()
lsm_c_core_cv()
lsm_c_dcore_cv()

# Edge Patch Density metrics based on Cushman et al 2008
lsm_c_ed()
lsm_c_lsi()
lsm_c_pd()

## Compare correlation of all metrics

## Bin landscape metrics into correlate groups and plot correlation for each group

## Create combinations of binned 