setwd("~/Learning/exdata/ExData_Plotting2")

library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#I found three Sectors that contained Coal and Comb(ustion)
#by manually searching unique(SCC["EI.Sector"])
coalIDs = SCC[SCC["EI.Sector"] == "Fuel Comb - Electric Generation - Coal" | SCC["EI.Sector"] == "Fuel Comb - Industrial Boilers, ICEs - Coal" | SCC["EI.Sector"] == "Fuel Comb - Comm/Institutional - Coal", "SCC"]


png(filename="plot4.png")
qplot(x=c("1999","2002","2005","2008"), y=tapply(NEI[NEI[,"SCC"] %in% coalIDs, "Emissions"], NEI[NEI[,"SCC"] %in% coalIDs, "year"], sum), xlab="Year",ylab="Coal Combustion Emissions", geom="bar", stat="identity")
dev.off()