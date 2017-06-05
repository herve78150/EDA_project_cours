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
county[county[]== "06037"] <- "Los Angeles"
county[county[]== "24510"] <- "Baltimore"
county <- as.data.frame(county)
Motor_BAL_LA <- cbind(Motor_BAL_LA, county)


png('plot7.png')
p <- ggplot(Motor_BAL_LA, aes(x=year , y=Emissions)) 
p <- p + facet_grid(. ~ county)
p <- p + geom_bar(stat="identity")
p <- p + xlab("Year")
p <- p + ylab("Emissions PM 2.5")
p <- p + ggtitle(" Emissions from motor vehicle in Baltimore vs Los Angeles 1999-2008")
p <- p + theme(plot.title = element_text(hjust=0.5, colour="red"))
print(p)
dev.off()





dev.off()