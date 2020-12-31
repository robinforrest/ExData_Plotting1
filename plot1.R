
# Read in and subset data

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]


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

png(file="plot1.png")
hist(data$globalactivepower,
     breaks=12,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
dev.off()