filename = "exdata_data_household_power_consumption.zip"
if (!file.exists(filename)) {
    retrieve_data = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                                  destfile = filename,
                                  method = "curl")
}

data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T,
                   sep=";", stringsAsFactors=F, na.strings="?",
                   colClasses=c("character", "character", "numeric",
                                "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric"))
attach(data)

subset <- Date == "1/2/2007" | Date == "2/2/2007"
cleanData <- data[subset, ]
attach(cleanData)

x <- paste(Date, Time)
cleanData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(cleanData) <- 1:nrow(cleanData)
attach(cleanData)