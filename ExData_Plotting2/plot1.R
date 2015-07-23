setwd("~/Learning/exdata/ExData_Plotting2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


data = sum(NEI[NEI["year"] == "1999","Emissions"])
data[2] = sum(NEI[NEI["year"] == "2002","Emissions"])
data[3] = sum(NEI[NEI["year"] == "2005","Emissions"])
data[4] = sum(NEI[NEI["year"] == "2008","Emissions"])

names(data) = c("1999","2002","2005","2008")

png(filename="plot1.png")
plot(names(data),data, xlab="Year",ylab="Emissions")
text(names(data), data, names(data), cex=0.6, pos=c(1,1,1,3), col="black")
dev.off()