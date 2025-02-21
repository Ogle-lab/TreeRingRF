# Run random forest

################################################################################
# This script will run a series of random forest analyses using ring width data
# from the International Tree Ring Data Bank and climate data from PRISM.
# We have tree ring data for seven species. Each one should be run separately
# by specifying the species down below with one of seven four-letter codes:
# Abies lasiocarpa (ABLA), Picea englemanii (PCEN), Pinus edulis (PIED), 
# Pinus ponderosa (PIPO), Populus tremuloides (POTR), Pseudotsuga menziesii (PSME)
# Quercus douglasii (QUDG)
#
# Author: Rohan Boone
################################################################################

# SETUP

# We use the R package randomForestSRC (Ishwaran & Kogular, 2025)
# https://cran.r-project.org/package=randomForestSRC.
# install.packages("randomForestSRC")
library(randomForestSRC)

# specify species
species <- "QUDG"
# read in species-specific data table
dat<- read.csv(paste0("Data/", species, "_table_grouped_climate.csv"))[,-1]

dat$rwgrp<- factor(dat$rwgrp) # turn categorical response variable into factor
dat$site<- factor(dat$site) # turn site variable into factor

# variable names to subset later for different random forests
vnames<- names(dat)

################################################################################

# RF1c: Regression random forest, full model

# select a subset of variables from the data table based on the current RF
# in this case we do not need the categorical growth data
vnames1c<- vnames[-c(1,2)]

set.seed(5551212+90210) # set seed
# run random forest, regress ring width index (std) on all variables
mod1c<- rfsrc(std ~., data=dat[,vnames1c], na.action="na.omit", 
              importance = "permute", block.size=1)

# save the rfsrc object
save(mod1c, file = paste0(species, "_rfs/rf1c.R"))

# remove from environment
rm(mod1c)

################################################################################

# RF2d: Regression random forest, climate-only model

# select only the response variable (std) and climate variables
vnames2d <- vnames[-c(1:3,5:6)]

set.seed(5551212+90210) # set seed
# run random forest, regress rwi on climate variables
mod2d<- rfsrc(std ~., data=dat[,vnames2d], na.action="na.omit",
              importance = "permute", block.size=1)

# save the rfsrc object
save(mod2d, file = paste0(species, "_rfs/rf2d.R"))

# remove from environment
rm(mod2d)

################################################################################

# SETUP
# We need to create binary response variables for the growth categories (low,
# medium/nominal, high)

# check current levels of response variables
levels(dat$rwgrp)

# change the levels to binary: low vs. med/high or high vs. low/med
rwhi<-dat$rwgrp
levels(rwhi)<- c("lm","lm", "hi")
rwlo<-dat$rwgrp
levels(rwlo)<- c("lo","mh", "mh")

# aggregate to a binary response dataset 'bindat'
bindat<-cbind.data.frame(rwlo=rwlo,rwhi=rwhi, dat)

bindat <- bindat[,-6] # remove RWI
# double-check the levels against original
table(bindat[,c("rwlo","rwhi","rwgrp")])
sum(table(bindat[,c("rwlo","rwhi","rwgrp")]))
dim(bindat)

# subset variables for low-growth and high-growth random forests
head(names(bindat), n=12)
vnameslo<- names(bindat)[-c(2:6)]
head(vnameslo)
vnameshi<- names(bindat)[-c(1,3:6)]
head(vnameslo)

# remove unnecessary objects from the environment
rm(rwhi,rwlo)

################################################################################

# RF3c: Categorical random forest, low-growth vs. not low-growth, full model

set.seed(24601+5150) # set seed
# run random forest, predict rwlo using all other variables
# we use the imbalanced.rfsrc function to account for imbalance in the response
# i.e. only 5% of the response variables are categorized as "low-growth"
mod3c <- imbalanced.rfsrc(rwlo ~., data=bindat[vnameslo], na.action="na.omit",
                          method = "rfq", importance = "permute", block.size=1,
                          perf.type = "misclass")

# save the rfsrc object
save(mod3c, file = paste0(species, "_rfs/rf3c.R"))

# remove from the environment
rm(mod3c)

################################################################################

# RF3d: Categorical random forest, low vs. not low, climate-only model

# remove non-climate predictors
vnameslod <- vnameslo[-c(2:4)]

set.seed(24601+5150) # set seed
# run random forest, predict low-growth using only climate vairables
mod3d<- imbalanced.rfsrc(rwlo ~., data=bindat[vnameslod], na.action="na.omit",
                         method = "rfq", importance = "permute", block.size=1,
                         perf.type = "misclass")

# save the rfsrc object
save(mod3d, file = paste0(species, "_rfs/rf3d.R"))

# remove from the environment
rm(mod3d)

################################################################################

# RF5c: Categorical random forest: high-growth vs. not high-growth, full model

set.seed(24601+5150) # set seed
# run random forest, predict high-growth using all other variables
mod5c<- imbalanced.rfsrc(rwhi  ~., data=bindat[vnameshi], na.action="na.omit",
                         method = "rfq", importance = "permute", block.size=1,
                         perf.type = "misclass")

# save the rfsrc object
save(mod5c, file = paste0(species, "_rfs/rf5c.R"))

# remove drom the environment
rm(mod5c)

################################################################################

# RF5d: Categorical random forest: high vs. not high, climate only

# remove non-climate predictors
vnameshid <- vnameshi[-c(2:4)]

set.seed(24601+5150) # set seed
# run random forest, predict high growth using climate variables
mod5d<- imbalanced.rfsrc(rwhi  ~., data=bindat[vnameshid], na.action="na.omit",
                         method = "rfq", importance = "permute", block.size=1,
                         perf.type = "misclass")

# save the rfsrc object
save(mod5d, file = paste0(species, "_rfs/rf5d.R"))

# remove from the environment
rm(mod5d)

