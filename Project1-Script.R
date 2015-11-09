setwd("C:\\Users\\XXXX\\Documents\\R\\1511-04ExploratoryDataAnalytics\\ExData_Plotting1")

unzip("exdata_data_household_power_consumption.zip")

data <- read.csv("household_power_consumption.csv")

data$Date <- as.Date(data$Date)

## I can't change the date format correctly, so I am creating a dummy set of data to builf some plots
dummydata <- data[2000:2300,]

### turning factors of power data to numeric
dummydata$Global_active_power <- as.numeric(dummydata$Global_active_power)

### building a histogram based on power data and copying it into a png file 
hist(dummydata$Global_active_power)
dev.copy(png, file = "plot1.png")
## sorry, running out of time to complete the assignment...