if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

total <- aggregate(Emissions ~ year, NEI, sum)
png('plot1.png')
barplot(total$Emissions, names.arg=total$year, 
        xlab="years", ylab="total emission from PM 2.5 in  a year",
        main=expression("Total emissions from PM 2.5 in the United States from 1999 to 2008"),
        col=c(1,2,3,4))
dev.off()

