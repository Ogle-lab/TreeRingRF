# Project: Climate factors governing extreme tree growth

#### Data, code, and documentation in this repository accompanies the manucript: "Identifying the climate conditions associated with extreme growth states in trees across the western United States" by Kiona Ogle, Jarrett J Barber, Brandon Strange, Rohan Boone, Alicia Formanack, and Drew Peltier.

#### Managed by the Ecological Synthesis Lab at Northern Arizona University.

#### Description of files and directories

 - species specific tree ring and climate data tables are located in the /data directory
 - `rf_run.R` runs the random forests
 - `partial_fx.R` generates plottable partial effects data for partial dependence plots
 - `model_IDs.csv` is a table containing information about each of the six final random forest models, including an unique ID that is referred to at various points in these files.

Scripts are plug-and-play. Be sure to specify necessary variables such as species and output directory prior to running. Lines in the code where variables must be specified are indicated in the commented sections with all-caps and asterisks.

### Random Forest model details

Summary of random forest (RF) models that are implemented by `rf_run.R` 

|Model ID|RF model type|Full or climate-only model|Focal growth variable|Includes site ID|Includes lag-width|Includes Year|
|--------|-------------|--------------------------|---------------------|----------------|------------------|-------------|
|RF1c    |Regression   |Full                      |RWI                  |Yes             |Yes               |Yes          |
|RF2d    |Regression   |Climate-only              |RWI                  |No              |No                |No           |
|RF3c    |Classification|Full                      |Low-growth           |Yes             |Yes               |Yes          |
|RF3d    |Classification|Climate-only              |Low-growth           |No              |No                |No           |
|RF5c    |Classification|Full                      |High-growth          |Yes             |Yes               |Yes          |
|RF5d    |Classification|Climate-only              |High-growth          |No              |No                |No           |
