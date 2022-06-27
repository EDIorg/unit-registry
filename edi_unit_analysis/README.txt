EDI UNIT ANALYSIS README

24 June 2022

Kyle Zollo-Venecek

This folder contains the WIP EDI unit analysis. 

COMPONENTS:

ALL DATA FILES WERE CREATED IN APRIL 2022 AND INCLUDE EDI PACKAGES CREATED UNTIL THAT POINT (edi.1118.1 being the last)

downloadUnits.ipynb - Jupyter notebook that downloads EML, extracts standard and custom units, saves unit counts to JSON file. Currently configured to run for EDI scope, but easily expanded to all scopes. Very reusable.

analyzeUnits.ipynb - Jupyter notebook that imports unit counts from json files created with downloadUnits.ipynb and runs simple analyses. Incomplete, could be expanded or rebuilt from scratch.

standardUnitsCount.json - A JSON file containing a simple key-value table containing the number of times a standardUnit occurs across all EML metadata (latest versions only) in the EDI scope. Keys are the text at the xpath 'dataTable/attributeList/attribute/measurementScale/ratio/unit/standardUnit' in the EML file. Values are the total occurrences of that standardUnit (across the entire EDI scope) 

standardUnitsDatasetCount.json - A JSON file containing a simple key-value table containing the number of datasets containing a unique standardUnit across all EML metadata (latest versions only) in the EDI scope. Keys are the text at the xpath 'dataTable/attributeList/attribute/measurementScale/ratio/unit/standardUnit' in the EML file. Values are the number of datasets (across the entire EDI scope) in which that standardUnit occurs.

customUnitsCount.json - A JSON file containing a simple key-value table containing the number of times a unique customUnit occurs across all EML metadata (latest versions only) in the EDI scope. Keys are the text at the xpath 'dataTable/attributeList/attribute/measurementScale/ratio/unit/customUnit' in the EML file. Values are the total occurrences of that customUnit (across the entire EDI scope) 

customUnitsDatasetCount.json - A JSON file containing a simple key-value table containing the number of datasets containing a unique customUnit across all EML metadata (latest versions only) in the EDI scope. Keys are the text at the xpath 'dataTable/attributeList/attribute/measurementScale/ratio/unit/customUnit' in the EML file. Values are the number of datasets (across the entire EDI scope) in which that standardUnit occurs.

unitCount.json - A JSON file containing a key-value table where the structure is {<packageid>: {"standardCount": <numberStandardUnitsInPackage>, "customCount": <numberCustomUnitsInPackage>, "ezEML": <wasPackageCreatedInezEMLBoolean>}}

unitDictionary.csv - The EML unit dictionary in a flat CSV format

custom_units.csv - The complete list of all custom units found in EML metadata within the EDI scope. The column "Unit Count" contains the count of all datasets where the unit appears. The column "exactMatch" contains a 1 if the unit appears exactly as-is in the unitDictionary.csv file.

custom_units.csv - The complete list of all custom units found in EML metadata within the EDI scope. The column "Unit Count" contains the count of all datasets where the unit appears. The column "exactMatch" contains a 1 if the unit appears exactly as-is in the unitDictionary.csv file (0 if not). The "spellingError" column contains a 1 if the unit appears to be in the unitDictionary.csv file, but contains a spelling error here (0 if not). The "logicError" column contains a 1 if a standardUnit should have been used instead (i.e. unitless vs. dimensionless, decimal degrees vs. degree; 0 if not).