# plot4.R

# source the R script to read the data if 'processed' data frame
# is nonexistent

read_power_data_file <- "readElectricalPowerData.R"
if (!exists("processed") && !is.data.frame(("processed"))) {
	source(read_power_data_file)
}

source("plotFunctions.R")

png(filename = "plot4.png",
    width = 480,
    height = 480,
    units = "px")

plotDashboard()

dev.off()