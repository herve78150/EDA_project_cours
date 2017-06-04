if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

E_baltimore <- subset(NEI,fips=="24510" )
color_bar <- c(1,2,3,7)
png('plot2.png')
total_bal <- aggregate(Emissions ~ year, E_baltimore, sum)
barplot(total_bal$Emissions, names.arg=total_bal$year, 
        xlab="years", ylab="total emission from PM 2.5 in  a year",
        main=expression("Total emissions from PM 2.5 in Baltimore from 1999 to 2008"),
        col =color_bar)
dev.off()
