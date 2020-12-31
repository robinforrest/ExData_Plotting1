
# Read in and subset data

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- data[data$DateTime >= "2007-02-01 00:00:00" & data$DateTime < "2007-02-03 00:00:00",]


# Tidy attribute names

names(data) <- tolower(names(data))
names(data) <- gsub("_","",names(data))


# Convert numeric attributes from character

data$globalactivepower <- as.numeric(data$globalactivepower)
data$globalreactivepower <- as.numeric(data$globalreactivepower)
data$voltage <- as.numeric(data$voltage)
data$globalintensity <- as.numeric(data$globalintensity)
data$submetering1 <- as.numeric(data$submetering1)
data$submetering2 <- as.numeric(data$submetering2)
data$submetering3 <- as.numeric(data$submetering3)


# Create plot

png(file="plot4.png")
par(mfcol=c(2, 2))
with(data, {
  plot(globalactivepower ~ datetime,
       type="l",
       xlab="",
       ylab="Global Active Power")
  plot(data$submetering1 ~ data$datetime,
       type="l",
       xlab="",
       ylab="Energy sub metering")
  lines(data$submetering2 ~ data$datetime,
        type="l",
        col="red")
  lines(data$submetering3 ~ data$datetime,
        type="l",
        col="blue")
  legend("topright", lty=1, bty="n",
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"))
  plot(voltage ~ datetime,
       type="l",
       xlab="datetime",
       ylab="Voltage")
  plot(globalreactivepower ~ datetime,
       type="l",
       xlab="datetime",
       ylab="Global_reactive_power")
})
dev.off()