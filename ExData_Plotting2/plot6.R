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

bal = tapply(NEI[NEI[,"SCC"] %in% coalIDs & NEI[,"fips"]=="24510", "Emissions"], 
             NEI[NEI[,"SCC"] %in% coalIDs & NEI[,"fips"]=="24510", "year"], sum)
los = tapply(NEI[NEI[,"SCC"] %in% coalIDs & NEI[,"fips"]=="06037", "Emissions"], 
             NEI[NEI[,"SCC"] %in% coalIDs & NEI[,"fips"]=="06037", "year"], sum)
df = data.frame(x=c("1999","2002","2005","2008", "1999","2002","2005","2008"), y = c(bal,los), City = rep(c("Balitmore","Los Angelos"),each=4))


png(filename="plot6.png")
qplot(
    x, 
    y, 
    data=df,
    group=City,
    position="dodge",
    xlab="Year",
    ylab="Automotive Emissions in Baltimore vs. Losangelos", 
    geom="bar", 
    stat="identity",
    fill=City
    )
dev.off()