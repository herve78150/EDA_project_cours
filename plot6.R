library(ggplot2)
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}



E_BAL_LA <- subset(NEI,(NEI$fips=="24510" | NEI$fips=="06037"  ) & NEI$type=="ON-ROAD" )
Motor_BAL_LA <- aggregate(Emissions ~ year + fips, E_BAL_LA, sum)

county <-Motor_BAL_LA[,2]
county[county[]== "06037"] <- "Los Angels"
county[county[]== "24510"] <- "Baltimore"
county <- as.data.frame(county)
Motor_BAL_LA <- cbind(Motor_BAL_LA, county)


#png('plot6.png')
p <- ggplot(Motor_BAL_LA, aes(x=year , y=Emissions, col=county)) 
p <- p + geom_point(size=2) + geom_line(size=1)
p <- p + ylab("PM 2.5 Emissions") 
p <- p + ggtitle("Motor Emissions in Baltimore/LA  from 1999 to 2008")
print(p)
#dev.off()