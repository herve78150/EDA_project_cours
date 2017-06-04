library(ggplot2)
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}


row_Coal <- grepl("Coal", SCC$EI.Sector)
NEI_Coal <- NEI[row_Coal, ]

sum_Coal <- aggregate(Emissions ~ year, NEI_Coal, sum)

png('plot4.png')
p <- ggplot(sum_Coal, aes(x=factor(year), y=Emissions)) 
p <- p + geom_bar(stat="identity")
p <- p + xlab("Year") +ylab("PM2.5 Emissions due to Coal") 
p <- p + ggtitle("Total PM2.5 Emissions due to Coal from 1999 to 2008")
print(p)
dev.off()