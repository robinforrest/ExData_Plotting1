
# Read in and subset data

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- data[data$Date >= "2007-02-01 00:00:00" & data$Date < "2007-02-03 00:00:00",]


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

png(file="plot3.png")
plot(data$submetering1 ~ data$date,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(data$submetering2 ~ data$date,
      type="l",
      col="red")
lines(data$submetering3 ~ data$date,
      type="l",
      col="blue")
legend("topright", lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"))
dev.off()