# Dataset_UFO
## Source of Data
- The UFO sightings data was sourced from the National UFO Reporting Center (NUFORC). It is a comprehensive dataset that includes reported UFO sightings from various locations.
- Link to the Data: [National UFO Reporting Center](https://nuforc.org)

## Current Status of the Data
- The dataset is currently complete, having undergone thorough cleaning and integration processes. It's ready for analysis.

## Data Dictionary
| Column  Name |  Data Type  |	Description                                                                                                                         |
|--------------|-------------|--------------------------------------------------------------------------------------------------------------------------------------|
| details      |   String	 |The URL linking to the detailed report of the UFO sighting.                                                                           |
| date	       |   String	 |The month and year of the UFO sighting in MM/YYYY format.                                                                             |
| city	       |   String	 |The city where the UFO sighting was reported.                                                                                         |
| state	       |   String    |The state or region where the UFO sighting was reported. For sightings in the USA, this is the two-letter state code.                 |
| country      |   String    |The country where the UFO sighting was reported, represented in its abbreviated form (e.g., "USA" for the United States of America).  |
| shape	       |   String	 |The reported shape of the UFO, such as "Light", "Disk", "Triangle", etc. 'NA' indicates that the shape was not reported or unknown.   |
| summary	   |   String	 |A brief summary or description of the UFO sighting.                                                                                   |
| report_date  |   String	 |The date when the UFO sighting was reported, in MM/DD/YYYY format.                                                                    |
| posted_date  |   String	 |The date when the UFO sighting report was posted online, in MM/DD/YYYY format.                                                        |
| month_count  |   Integer   |The count of UFO sightings reported for the corresponding month and year.                                                             |

## To-Do List , Future Enhancements
- Perform exploratory data analysis.
- Develop predictive models for sighting frequencies.
- Validate data against additional sources.

## Changelog
- Lot of changes have been made during the data cleaning and preprocessing step. Different CSV files with different attribute numbers and values have been merged together. 

## Notes 
- Make sure to refer to the README file for understanding the project. It will be helpful and try to understand the Rscript to see how data integrates. 

## BAIS:3050 Professional Preparation
- Data ethics is followed while handling data.
 