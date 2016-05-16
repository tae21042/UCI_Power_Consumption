plot3 <- function(){
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
    date.time = paste(data.names$Date,data.names$Time,sep=" ")
    time_class = strptime(date.time, "%d/%m/%Y %H:%M:%S")
    x = time_class
    y1 = data.names$Sub_metering_1
    y2 = data.names$Sub_metering_2
    y3 = data.names$Sub_metering_3
    par(mfcol=c(1,1))
    plot(x,y1,type="n",xlab="",ylab="Energy sub metering")
    lines(x,y1,col="black")
    lines(x,y2,col="red")
    lines(x,y3,col="blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.7,
                               text.width =40000,lty="solid", col=c("black","red","blue"))
    dev.copy(png,file="./4_Exploratory/plot3.png",width=480,height=480)
    dev.off()
    
}