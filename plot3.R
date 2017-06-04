library(ggplot2)
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

E_baltimore <- subset(NEI,fips=="24510" )
total_bal <- aggregate(Emissions ~ year + type, E_baltimore, sum)
png('plot3.png')
p <- ggplot(total_bal, aes(year, Emissions, col=type))
p <- p + geom_point(size=2) + geom_line(size=1)
p <- p + ylab("PM 2.5 Emissions") +
    ggtitle("Total Emissions in Baltimore  from 1999 to 2008")
print(p)
dev.off()