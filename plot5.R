library(ggplot2)
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}


E_baltimore <- subset(NEI,fips=="24510" & type=="ON-ROAD" )
Motor_E_baltimore <- aggregate(Emissions ~ year, E_baltimore, sum)

png('plot5.png')
p <- ggplot(Motor_E_baltimore, aes(x=year , y=Emissions)) 
p <- p + geom_point(size=2) + geom_line(size=1)
p <- p + ylab("PM 2.5 Emissions") +
    ggtitle("Motor Emissions in Baltimore  from 1999 to 2008")
print(p)
dev.off()