## README

### Description of data tables

This folder contains tables of chronology-level ring-width index (RWI) data with accompanying lagged seasonal climate calculated from PRISM climate data.
In addition to the ring width indices (RWIs), the categorical growth class variables are included, representing low-, nominal-, and high-growth. As decribed in the manuscript, these growth classes are defined based on the RWI quantiles determined across all sites for each species.
Each table (csv file) contains data for a single species, indicated by the four-letter species code in the filename.
Each row represents one year's growth data at the site/chronology level.

### Variables

 - rwgrp: categorical growth response. Levels are: 1 (low-growth, bottom 5%), 2 (nominal growth), 3 (high-growth, top 95%). Quantiles are calculated across all sites for a given species.
 - rwgrpBySite: same as above, but quantiles are calculated within-site. We do not use these in analyses presented in the manuscript.
 - Year: calendar year corresponding to the year of ring formation.
 - std: ring width index (RWI), used for regression random forests.
 - site: site ID designated by the ITRDB.
 - lagwidth: previous year's annual growth index (i.e., lagged RWI), used in models that include a lag-RWI effect.
 - siteMAP: site-level mean annual precipitation (mm). Averaged over all years present in the climate data.
 - siteMAT: site-level mean annual temperature (degrees C). Averaged overall years present in climate data.
 - Lagged, seasonal climate data: seasonal (cold- and warm-season) precipitation, mean temperature, and maximum vapor pressure deficit (vpd) calculated from PRISM climate data, including lagged data up to four years prior to the year of ring formation.

### Climate variable names

Climate variables are given names based on the following: variableLAGseason
 
 - "Variable" is one of ppt, tmean, or vpdMax, corresponding to precipitation, mean temperature, or maximum vpd, respectively.
 - "LAG" is a number (0-4) indicating the number of years prior to the year of ring formation; 0 represents the year of ring formation, 1 is one year prior to ring formation, etc. 
 - "season" (cold or warm) identifies the season, where the cold season is October through March and the warm season is April through September.

Examples:

 - ppt0cold: cold-season precipitation in the year of ring formation; so, ppt0cold in 1990 is the total (cumulative) precipitation received from October 1989-March 1990.
 - tmean1warm: warm-season mean temperature in the year prior to ring formation; so, tmean1warm associated with 1990 is the mean of the 6 monthly mean temperatures from April to September of the previous year (1989).
 - vpdMax4warm: warm-season maximum vpd four years prior to ring formation; so, vpdMax4warm associated with 1990 is the mean of the 6 monthly maximum vpd values from April to September of 1986. 

