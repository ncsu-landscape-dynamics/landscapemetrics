## Read in libraries
library(raster)
library(landscapemetrics)
library(landscapetools)
library(NLMR)  #Used to create neutral landscape mmodels. Manual: https://cran.r-project.org/web/packages/NLMR/NLMR.pdf
library(igraph) #Used by NLMR

## Create 1,000 100x100 random binary (0 or 1) rasters
# create 100x100 grid of 100 m resolution pixels

#Landscape variables used by nlm_randomcluster in NLMR package
ncol <- 25 #number of columns 
nrow <- 25#number of rows
resolution <- 100 #number of meters per cell
p <- 0.5 #NLMR package: p controls for proportion of elements randomly selected to form clusters	
proportion_true <- 0.2 #to be used in the variable ai in NLMR package: ai controls for the number and abundance of land cover classes 
proportion_false <- 1-proportion_true

# create random cluster landscape using NLMR package
landscape <- nlm_randomcluster(nrow = nrow, ncol = ncol, resolution = resolution, p = p, ai  = c(proportion_false, proportion_true), rescale = TRUE)
#Preview landscape (optional: comment out line if not needed)
show_landscape(landscape)

#Write landscape to file
filepath <- paste("H:/Team Drives/APHIS  Projects/Papers/landscapemetrics/data/landscape_",0003,".tif", sep = "")
writeRaster(landscape, filepath, overwrite = TRUE)


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