## README

### Description of data tables

This folder contains tables of chronology-level ring-width data with accompanying lagged seasonal climate calculated from PRISM climate data.
In addition to the ring width indicies, there are categorical growth response variables generated using quantiles.
Each table contains data for a single species. You can see the four-letter species code in the filenames.
Each row represents one year's growth data at the site/chronology level.

### Variables

 - rwgrp: categorical growth response. Levels are 1 (low-growth, bottom 5%), 2 (nominal growth), 3 (high-growth, top 95%). Quantiles are calculated across all sites for a given species
 - rwgrpBySite: same as above, but quantiles are calculated within-site. We do not use these in any analyses shown here.
 - Year: calendar year corresponding to the year of ring formation.
 - std: ring width index, used for regression random forests
 - site: site ID designated by the ITRDB
 - lagwidth: previous year's annual growth index, used in models that include AR1 autocorrelation effect.
 - siteMAP: site-level mean annual precipitation. Averaged over all years present in the climate data.
 - siteMAT: site-level mean annual temperature. Averaged overall years present in climate data.
 - Lagged, seasonal climate data: seasonal (cold/warm season) precipitation, mean temperature, and maximum vpd calculated from PRISM climate, including lagged data up to four years prior to calendar year (year of ring formation)

### Climate variable names

Climate variables are given names based on the following: variableLAGseason
 
 - Variable is one of ppt, tmean, or vpdMax, corresponding to precipitation, mean temperature, and maximum vpd, respectively.
 - LAG a number (0-4) indicating the number of years prior to the calendar year (year of ring formation). 0 is the year of ring formation, 1 is one year prior to ring formation, etc. 
 - season (cold or warm) is the time of year when the climate data were observed, where the cold season is October through March and the warm season is April through September.

Examples:

 - ppt0cold: cold-season precipitation in the year of ring formation
 - tmean1warm: warm-season mean temperature in the year prior to ring formation
 - vpdMax4warm: warm-season maximum vpd four years prior to ring formation.

