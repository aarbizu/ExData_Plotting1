# Exploratory Data Analysis, Coursera, Week 1 Peer-Graded Assignment

# Assumption: The UCI data set for Electric power consumption has
# been downloaded and uncompressed to the current working directory
# and the file below has been extracted from the archive.

filename <- "household_power_consumption.txt"

# Filter only the dates relevant to the assignment, 2007-02-01 and 2007-02-02

file <- readLines(filename)
header <- file[1]
file <- grep("^[12]/2/2007", file, value = TRUE)
file <- c(header, file)
tc <- textConnection(file)
processed <- read.table(tc, header = TRUE, sep=";", na.string="?")
close(tc)

processed$Time <- paste(as.character(processed$Date),processed$Time)
processed$Date <- as.Date(processed$Date)
processed$Time <- strptime(processed$Time, "%d/%m/%Y %H:%M:%S")

