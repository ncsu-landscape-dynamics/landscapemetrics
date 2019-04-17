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

## Compare correlation of all metrics

## Bin landscape metrics into correlate groups and plot correlation for each group

## Create combinations of binned 