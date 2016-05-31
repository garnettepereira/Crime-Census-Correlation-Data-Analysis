

library(choroplethr)
library(choroplethrMaps)
library(reshape)
library(ggplot2)

#dataimport--------------------------------

readData08_09 <- function(x)
{
  #pull in information from csv
  #census.raw <- read.csv(paste0("C:/Users/thema/Desktop/Google Drive/School/SU/IST 718/FInal Project/Data/ACS_11_1YR_S0201_with_ann.csv"), stringsAsFactors = FALSE)
  census.raw <- read.csv(paste0("ACS_",
                                x,"_1YR_S0201_with_ann.csv"), stringsAsFactors = FALSE)
  
  #preserve raw data
  census <- census.raw
  
  
  #find column number (row 2 in csv) where the information is located
  noHSDiploma <- which(census[1,]=='Estimate; EDUCATIONAL ATTAINMENT - Population 25 years and over - High school graduate (includes equivalency)')
  BachelorDegree <- which(census[1,]=="Estimate; EDUCATIONAL ATTAINMENT - Population 25 years and over - Bachelor's degree")
  GraduateDegree <- which(census[1,]=="Estimate; EDUCATIONAL ATTAINMENT - Population 25 years and over - Graduate or professional degree")
  medianHousehold <- which(census[1,]==paste0("Estimate; INCOME IN THE PAST 12 MONTHS (IN 20",x," INFLATION-ADJUSTED DOLLARS) - Households"))
  
  #eliminate the first row as it is no longer needed
  census <- data.frame(census[-1,], check.rows = TRUE)
  
  census <- census[census$POPGROUP.id=='001',]  
  # This command creates a new data frame with required variables for analysis.
  censusData <- data.frame(State = tolower(census$GEO.display.label), 
                           Population = as.integer(census$EST_VC08),
                           NoHSDiplomaPct = as.numeric(unlist(subset(census, select = c(as.integer(substr(noHSDiploma,1,3)))))),
                           BachelorDegreePct = as.numeric(unlist(subset(census, select = c(as.integer(substr(BachelorDegree,1,3)))))),
                           GraduateDegreePct = as.numeric(unlist(subset(census, select = c(as.integer(substr(GraduateDegree,1,3)))))),
                           MedianHouseholdIncome = as.integer(unlist(subset(census, select = c(as.integer(substr(medianHousehold,1,3)))))),
                           stringsAsFactors=FALSE)
  #return the data.frame
  return(censusData)
}


#function to pull in years 10-12
readData10_12 <- function(x)
{
  #pull in information from csv
  #census.raw <- read.csv(paste0("C:/Users/thema/Desktop/Google Drive/School/SU/IST 718/FInal Project/Data/ACS_11_1YR_S0201_with_ann.csv"), stringsAsFactors = FALSE)
  census.raw <- read.csv(paste0("ACS_",
                                x,"_1YR_S0201_with_ann.csv"), stringsAsFactors = FALSE)
  
  #preserve raw data
  census <- census.raw
  
  
  #find column number (row 2 in csv) where the information is located
  noHSDiploma <- which(census[1,]=='Estimate; EDUCATIONAL ATTAINMENT - High school graduate (includes equivalency)')
  BachelorDegree <- which(census[1,]=="Estimate; EDUCATIONAL ATTAINMENT - Bachelor's degree")
  GraduateDegree <- which(census[1,]=="Estimate; EDUCATIONAL ATTAINMENT - Graduate or professional degree")
  medianHousehold <- which(census[1,]==paste0("Estimate; INCOME IN THE PAST 12 MONTHS (IN 20",x," INFLATION-ADJUSTED DOLLARS) - Households"))
  
  #eliminate the first row as it is no longer needed
  census <- data.frame(census[-1,], check.rows = TRUE)
  
  # This command creates a new data frame with required variables for analysis.
  censusData <- data.frame(State = tolower(census$GEO.display.label), 
                           Population = as.integer(census$EST_VC03),
                           NoHSDiplomaPct = as.numeric(unlist(subset(census, select = c(as.integer(substr(noHSDiploma,1,3)))))),
                           BachelorDegreePct = as.numeric(unlist(subset(census, select = c(as.integer(substr(BachelorDegree,1,3)))))),
                           GraduateDegreePct = as.numeric(unlist(subset(census, select = c(as.integer(substr(GraduateDegree,1,3)))))),
                           MedianHouseholdIncome = as.integer(unlist(subset(census, select = c(as.integer(substr(medianHousehold,1,3)))))),
                           stringsAsFactors=FALSE)
  #return the data.frame
  return(censusData)
}


#function to pull in years 13-14
readData13_14 <- function(x)
{
  #pull in information from csv
  #census.raw <- read.csv(paste0("C:/Users/thema/Desktop/Google Drive/School/SU/IST 718/FInal Project/Data/ACS_13_1YR_S0201_with_ann.csv"), stringsAsFactors = FALSE)
  census.raw <- read.csv(paste0("ACS_",
                                x,"_1YR_S0201_with_ann.csv"), stringsAsFactors = FALSE)
  
  census <- census.raw
  
  #find column number (row 2 in csv) where the information is located
  noHSDiploma <- which(census[1,]=='Estimate; EDUCATIONAL ATTAINMENT - Population 25 years and over - High school graduate (includes equivalency)')
  BachelorDegree <- which(census[1,]=="Estimate; EDUCATIONAL ATTAINMENT - Population 25 years and over - Bachelor's degree")
  GraduateDegree <- which(census[1,]=="Estimate; EDUCATIONAL ATTAINMENT - Population 25 years and over - Graduate or professional degree")
  medianHousehold <- which(census[1,]==paste0("Estimate; INCOME IN THE PAST 12 MONTHS (IN 20",x," INFLATION-ADJUSTED DOLLARS) - Households"))
  
  #eliminate the first row as it is no longer needed
  census <- data.frame(census[-1,], check.rows = TRUE)
  
  # This command creates a new data frame with required variables for analysis.
  censusData <- data.frame(State = tolower(census$GEO.display.label), 
                           Population = as.integer(census$EST_VC03),
                           NoHSDiplomaPct = as.numeric(unlist(subset(census, select = c(as.integer(substr(noHSDiploma,1,3)))))),
                           BachelorDegreePct = as.numeric(unlist(subset(census, select = c(as.integer(substr(BachelorDegree,1,3)))))),
                           GraduateDegreePct = as.numeric(unlist(subset(census, select = c(as.integer(substr(GraduateDegree,1,3)))))),
                           MedianHouseholdIncome = as.integer(unlist(subset(census, select = c(as.integer(substr(medianHousehold,1,3)))))),
                           stringsAsFactors=FALSE)
  #return the data.frame
  return(censusData)
}

#use functions created to import data
censusData2008 <-readData08_09('08')
censusData2009 <-readData08_09('09')
censusData2010 <-readData10_12(10)
censusData2011 <-readData10_12(11)
censusData2012 <-readData10_12(12)
censusData2013 <-readData13_14(13)
censusData2014 <-readData13_14(14)

#bring in crime data
crime2008 <- read.csv("2008-CrimeOneYearofData.csv", stringsAsFactors = FALSE)
crime2009 <- read.csv("2009-CrimeOneYearofData.csv", stringsAsFactors = FALSE)
crime2010 <- read.csv("2010-CrimeOneYearofData.csv", stringsAsFactors = FALSE)
crime2011 <- read.csv("2011-CrimeOneYearofData.csv", stringsAsFactors = FALSE)
crime2012 <- read.csv("2012-CrimeOneYearofData.csv", stringsAsFactors = FALSE)


#add year to all the things
censusData2008 <- data.frame(censusData2008,year= 2008)
censusData2009 <- data.frame(censusData2009,year= 2009)
censusData2010 <- data.frame(censusData2010,year= 2010)
censusData2011 <- data.frame(censusData2011,year= 2011)
censusData2012 <- data.frame(censusData2012,year= 2012)
censusData2013 <- data.frame(censusData2013,year= 2013)
censusData2014 <- data.frame(censusData2014,year= 2014)
crime2008 <- data.frame(crime2008, year=2008)
crime2009 <- data.frame(crime2009, year=2009)
crime2010 <- data.frame(crime2010, year=2010)
crime2011 <- data.frame(crime2011, year=2011)
crime2012 <- data.frame(crime2012, year=2012)


#merge it all into one
censusData <- rbind(censusData2008,censusData2009)
censusData <- rbind(censusData,censusData2010)
censusData <- rbind(censusData,censusData2011)
censusData <- rbind(censusData,censusData2012)

crime <- rbind(crime2008,crime2009)
crime <- rbind(crime,crime2010)
crime <- rbind(crime,crime2011)
crime <- rbind(crime,crime2012)


#clean up crime
crime$State <- tolower(crime$State)
crime <- subset(crime, select = -c(2))

#create final data
fdata <- merge(censusData,crime, by= c('State','year'))

#create test data for projection
tData <- rbind(censusData2013,censusData2014)


#clean up time
rm(censusData)
rm(censusData2014)
rm(censusData2013)
rm(censusData2012)
rm(censusData2011)
rm(censusData2010)
rm(censusData2009)
rm(censusData2008)
rm(crime)
rm(crime2012)
rm(crime2011)
rm(crime2010)
rm(crime2009)
rm(crime2008)
rm(readData13_14)
rm(readData10_12)
rm(readData08_09)


#1----------------
#pull out data for 2012
crime2012 <- subset(fdata,  year == 2012)

#This command creates a new data frame for vizualization
state.crime <- data.frame(region = tolower(crime2012$State), value = crime2012$Violent.crime.total/crime2012$Population, stringsAsFactors = FALSE)

#This command creates a map for Statewise crime in US
state_choropleth(state.crime, title="Per Capita Violent Crime in US in 2012", legend="Per Capita Violent Crime")

#find best/worst
state.crime <-state.crime[order(-state.crime[,2]),]
head(state.crime,5)
state.crime <- state.crime[order(state.crime[,2]),]
head(state.crime,5)

#2--------------
#melt the data and then remove census info
crime.m <- melt(subset(crime2012, select = -c(2:8)))

#put the highest crime rate type first
crime.m <- crime.m[order(-crime.m[,3]),]

#remove duplicates (so only the highest remains)
crime.m <- crime.m[!duplicated(crime.m[,1]),]

summary(crime.m)

#there were only two types, so convert to values
crime.m[crime.m$variable=='Aggravated.assault',3] <- 1
crime.m[crime.m$variable=='Robbery',3] <- 2

#change up identifiers for chlorpleth
crime.m$State <- tolower(crime.m$State)
colnames(crime.m)[1] <- 'region'

#remove extra column
crime.m <- subset(crime.m, select = -c(2))

#make graph
state_choropleth(crime.m,title="Top Violent Crime in 2012") + scale_fill_discrete("Top Violent Crime",breaks=c("1","2"),labels=c("Assault","Robbery"))

#cleanup
rm(crime.m)
rm(crime2012)
rm(state.crime)

#3---------------
#pull out and aggregate state data
tsData <- aggregate(cbind(Murder.and.nonnegligent.Manslaughter,Forcible.rape,Robbery,Aggravated.assault) ~ year, data=fdata,FUN=sum)

#change numbers to thousands
tsData <- data.frame(year = tsData$year,'Murder' = tsData$Murder.and.nonnegligent.Manslaughter/1000,
                     'Forcible Rape' = tsData$Forcible.rape/1000,
                     'Robbery' =tsData$Robbery/1000,
                     'Assault' =tsData$Aggravated.assault/1000)

#change row names and remove year row
rownames(tsData) <- tsData$year
tsData <-subset(tsData, select = -c(1))

#convert to ts
tsData <- ts(tsData, start=2008)

#plot ts 
plot(tsData, plot.type="single",col=1:4,xlab="Year",ylab="Number of Crime (thousand)", main="Overall U.S. Violent Crime Trend")
legend("bottomleft", colnames(ts(tsData)),col=1:4,lty=1,cex=.65)


#per state change 2008-2012
census2012 <-subset(fdata, year == 2012)
census2008 <-subset(fdata, year == 2008)

#remove extra rows
census2012 <- data.frame(state = census2012$State,'violent.crime.2012' = census2012$Violent.crime.total)
census2008 <- data.frame(state = census2008$State,'violent.crime.2008' = census2008$Violent.crime.total)

#merge them together
crimePct <- merge(census2012,census2008, by = 'state')

#find pct change
crimePct$pctChange <- crimePct$violent.crime.2012/crimePct$violent.crime.2008-1

#create choropleth
state.change <- data.frame(region = tolower(crimePct$state), value =crimePct$pctChange, stringsAsFactors = FALSE)
state_choropleth(state.change, title="% Change in Violent Crime in US from 2008-2012", legend="% Change")

#Change in Per Capita Violent Crime
census2012 <-subset(fdata, year == 2012)
census2008 <-subset(fdata, year == 2008)

#find out the per capita
census2012$perCapita <- census2012$Violent.crime.total/census2012$Population
census2008$perCapita <- census2008$Violent.crime.total/census2008$Population

# eviserate unnecessary columns
census2012 <- data.frame(region = census2012$State, value2012 = census2012$perCapita)
census2008 <- data.frame(region = census2008$State, value2008 = census2008$perCapita)

#merge
perCapitaPct <- merge(census2012, census2008, by = 'region')

#determine percent change
perCapitaPct$value <- perCapitaPct$value2012/perCapitaPct$value2008 -1

#create chloropleth
state.change <- data.frame(region = tolower(perCapitaPct$region), value = perCapitaPct$value, stringsAsFactors = FALSE)
state_choropleth(state.change, title="Per Capita % Change in Violent Crime in US from 2008-2012", legend="% Change")

#cleanup
rm(census2008)
rm(census2012)
rm(crimePct)
rm(perCapitaPct)
rm(state.change)
rm(tsData)



#4--------------
# Fitting a Linear model with the violent Crime data as the reponse variable
lmModel <- glm(Violent.crime.total ~ Population + MedianHouseholdIncome + NoHSDiplomaPct + BachelorDegreePct + GraduateDegreePct, data = fdata)


# Predict the values using the model created above and the prediction dataset which has 2013 and 2014 data
predictData <- tData
predictData$prediction <- predict(lmModel,newdata = predictData, interval='response')

# View the summary of the linear mdel generated above
summary(lmModel)

# to plot 4 plots on 1 page
par(mfrow = c(2, 2))
# Plot the linear model
plot(lmModel)

# Resetting the mfrow variable to show only one graph on the page
par(mfrow=c(1,1))

#subset out the data
predict2013 <- subset(predictData,year=='2013')
predict2014 <- subset(predictData,year=='2014')

#get per capita for graph
predict2013 <-  data.frame(region = predict2013$State, value = predict2013$prediction/predict2013$Population,stringsAsFactors = FALSE)
predict2014 <-  data.frame(region = predict2014$State, value = predict2014$prediction/predict2014$Population,stringsAsFactors = FALSE)

#choropleth
state_choropleth(predict2013, title="Predicted Per Capita Violent Crime in US in 2013", legend="Per Capita Violent Crime")
state_choropleth(predict2014, title="Predicted Per Capita Violent Crime in US in 2014", legend="Per Capita Violent Crime")

#cleanup
rm(predict2013)
rm(predict2014)






#5--------------
# Plotting the correlation using ggplot

ggplot(fdata, aes(x=GraduateDegreePct, y=Violent.crime.total, col="red")) + 
  geom_point() + 
  ggtitle("Correlation between Education Rate and Crime") + 
  xlab("Education Rate (Graduate School)") + 
  ylab ("Violent Crime Total") +
  theme_bw() +
  theme(axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) 
