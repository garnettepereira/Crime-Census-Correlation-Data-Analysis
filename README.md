# Crime-Education-Correlation-Data-Analysis
Project which analyzes the correlation between crime and the education rate in the US for different years

Datasets used:

Crime Dataset:
The Crime Dataset consists of different variables like number of violent crimes and different types of violent crimes for each state from year 2008 -2012. Source of the dataset:  http://www.ucrdatatool.gov/Search/Crime/State/StatebyState.cfm 

Census Dataset:
The US Census Bureau is the official source of data regarding people and economy of the United States. The bureau uses surveys and other sources to compile this data. We will be using data from year 2008-2014. Source of the dataset: 
http://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_13_1YR_S0201&prodType=table 

Data Cleaning:
The census data was downloaded with each year being a separate csv file.  Upon analysis of the separate tables it was determined that the tables change slightly every couple years.  These changes are mainly cosmetic such as naming and more structural with the order of the columns being rearranged or new fields being added. As a result, 3 user functions were created that will import the data which work around the differences in the various tables.
These functions:
●	Strip away unnecessary data that we are not using within this analysis.
●	Ensure that all text fields are lowercase
●	Ensure that all numbers are stored as numbers
●	Add a new column indicating the year the dataset is from
The datasets will then be merged based on the state name.

In order to clean the data, various R steps will be taken.
●	There are no NULL values in both the datasets. Hence, the datasets do not have any missing values.
●	After removing the unnecessary columns, we will get two complete and accurate datasets which will be ready to link. 
After the data is cleaned and transformed, the two datasets will be linked together by the R function merge(). We can link the two datasets by their common variable “state” and “Year”. We will be using data for the years 2008-2012. 

The structure of the linked dataset will be as follows:

Columns	                              Data Types	Values
State	                                Character	 alabama, arkansas,...wyoming
year	                                Numeric	   2008,2009,..2012
Population	                          Integer	   96,000
NoHSDiplomaPct	                      Numeric	   31.6
BachelorDegreePct	                   Numeric	   14.3
GraduateDegreePct	                    Numeric	   10.9
MedianHouseholdIncome	                Integer	   260000
Violent.crime.total	                  Integer	   20000
Murder.and.nonnegligent.Manslaughter	Integer	   14
Forcible.rape	                        Integer	   900
Robbery	                              Integer	   1200
Aggravated.assault	                  Integer	   5000

Business Questions:
1.	Which states have the highest crime rate per capita or lowest?
2.	Which category of crime has the highest number of crimes in the different states?
3.	Has there been a trend for particular crime change across the years?
4.	Using the crime and census data, what trends and predictions can be made?
5.	What is the correlation between education rate and crime?
