# Project: Climate factors governing extreme tree growth

#### Data, code, and documentation in this repository accompanies the manucript: "Identifying the climate conditions associated with extreme growth states in trees across the western United States" by Kiona Ogle, Jarrett J Barber, Brandon Strange, Rohan Boone, Alicia Formanack, and Drew Peltier.

#### Managed by the Ecological Synthesis Lab at Northern Arizona University.

#### Description of files and directories

 - species specific tree ring and climate data tables are located in the /data directory
 - `rf_run.R` runs the random forests
 - `partial_fx.R` generates plottable partial effects data for partial dependence plots
 - `model_IDs.csv` is a table containing information about each of the six final random forest models, including an unique ID that is referred to at various points in these files.

Scripts are plug-and-play. Be sure to specify necessary variables such as species and output directory prior to running. Lines in the code where variables must be specified are indicated in the commented sections with all-caps and asterisks.

### Random Forest model information

|Model|Species|Model Type    |Growth category|Across- or within-site percentile|Climate Resolution|Includes temporally varying climate?|Includes site-level mean climate?|Includes site ID|Includes lag-width|Includes Year|
|-----|-------|--------------|---------------|---------------------------------|------------------|------------------------------------|---------------------------------|----------------|------------------|-------------|
|RF1c |All    |Regression    |RWI            |N/A                              |Seasonal          |No                                  |Yes                              |Yes             |Yes               |Yes          |
|RF2d |All    |Regression    |RWI            |N/A                              |Seasonal          |No                                  |Yes                              |No              |No                |No           |
|RF3c |All    |Classification|Low-growth     |Across                           |Seasonal          |No                                  |Yes                              |Yes             |Yes               |Yes          |
|RF3d |All    |Classification|Low-growth     |Across                           |Seasonal          |No                                  |Yes                              |No              |No                |No           |
|RF5c |All    |Classification|High-growth    |Across                           |Seasonal          |No                                  |Yes                              |Yes             |Yes               |Yes          |
|RF5d |All    |Classification|High-growth    |Across                           |Seasonal          |No                                  |Yes                              |No              |No                |No           |
