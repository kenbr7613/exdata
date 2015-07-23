setwd("~/Learning/exdata/ExData_Plotting2")

library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#I found three Sectors that contained Coal and Comb(ustion)
#by manually searching unique(SCC["EI.Sector"])

coalIDs = SCC[SCC["EI.Sector"] == "Mobile - On-Road Gasoline Light Duty Vehicles" | 
                SCC["EI.Sector"] == "Mobile - On-Road Gasoline Heavy Duty Vehicles" | 
                SCC["EI.Sector"] == "Mobile - On-Road Diesel Light Duty Vehicles" | 
                SCC["EI.Sector"] == "Mobile - On-Road Diesel Heavy Duty Vehicles" , "SCC"]


png(filename="plot5.png")
qplot(
    x=c("1999","2002","2005","2008"), 
    y=      tapply(NEI[NEI[,"SCC"] %in% coalIDs & NEI[,"fips"]=="24510", "Emissions"], 
                   NEI[NEI[,"SCC"] %in% coalIDs & NEI[,"fips"]=="24510", "year"], sum), 
    xlab="Year",
    ylab="Automotive Emissions in Baltimore City", 
    geom="bar", 
    stat="identity")
dev.off()