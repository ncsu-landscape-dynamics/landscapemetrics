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

## Compare correlation of all metrics

## Bin landscape metrics into correlate groups and plot correlation for each group

## Create combinations of binned 