# plotFunctions.R
#  Functions used to generate plots
# These functions assume the source data has been processed!
# See readElectricalPowerData.R

histGlobalActivePower <- function() {
	hist(processed$Global_active_power, 
	     col = "red",
	     main = "Global Active Power", 
	     xlab = "Global Active Power (kilowatts)")
}

plotDailyGlobalActivePower <- function() {
	with(processed, 
	     plot(Time, 
	          Global_active_power, 
	          type="l",
	          xlab="",
	          ylab="Global Active Power (kilowatts)"))
}

plotSubMetering <- function(legendBorder="o") {
	plot(processed$Time,
	     processed$Sub_metering_1,
	     col="black",
	     type="l",
	     xlab="",
	     ylab="Energy sub metering")
	
	lines(processed$Time,
	      processed$Sub_metering_2,
	      col="red")
	
	lines(processed$Time,
	      processed$Sub_metering_3,
	      col="blue")
	
	legend("topright",
	       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	       bty = legendBorder,
	       lty=c(1,1,1),
	       col=c("black", "red", "blue"),
	       cex=0.5)
}

plotVoltage <- function() {
	with(processed,
	     plot(Time,
	          Voltage,
	          type="l",
	          xlab="datetime"))
}

plotDailyGlobalReactivePower <- function() {
	with(processed,
	     plot(Time,
	          Global_reactive_power,
	          type="l",
	          xlab="datetime"))
}

plotDashboard <- function() {
	op <- par(mfrow=c(2,2),cex=0.6)
	plotDailyGlobalActivePower()
	plotVoltage()
	plotSubMetering(legendBorder = "n")
	plotDailyGlobalReactivePower()
	par(op)
}