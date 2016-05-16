plot1 <- function(){
    library(reshape2)
    library(chron)
    library(datasets)
    
    ##Only selects the data that corresponds to 1/2/2007 - 2/2/2007
    data <- read.table("./4_Exploratory/household_power_consumption.txt",skip = 66636,nrows=2880,header=TRUE
                       ,sep=";",na.strings="?") 
    ##Selects the names of the data columns
    id <- read.table("./4_Exploratory/household_power_consumption.txt",nrows=1,sep=";")
    ##Gives the column in the data frame names 
    id.list <- as.list(id)
    id.unlist <- unlist(id.list)
    idaschar <- as.character(id.unlist)
    data.names = setNames(data,idaschar)
    ##changes the data type in the "Date" column to a date class
    Date <- data.names$Date
    date.list <- as.list(Date)
    date.unlist <- unlist(date.list)
    date_class <- as.Date(date.unlist,"%d/%m/%Y")
    data.names$Date <- date_class
    ##changes the data type in the "Time" column to a time class
    Time <- data.names$Time
    time.list <- as.list(Time)
    time.unlist<-unlist(time.list)
    time.char <- as.character(time.unlist)
    time_class <- chron(times=time.char)
    data.names$Time <- time_class
    par(mfcol=c(1,1))
    hist(data.names$Global_active_power,col="red",xlab="Global Active Power (killowatts)",
         main="Global Active Power")
    dev.copy(png,file="./4_Exploratory/plot1.png",width=480,height=480)
    dev.off()
}