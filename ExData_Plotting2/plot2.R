setwd("~/Learning/exdata/ExData_Plotting2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


data = sum(NEI[NEI["year"] == "1999" & NEI["fips"]=="24510","Emissions"]) / sum(NEI["fips"]=="24510" & NEI["year"]=="1999")
data[2] = sum(NEI[NEI["year"] == "2002" & NEI["fips"]=="24510","Emissions"]) / sum(NEI["fips"]=="24510" & NEI["year"]=="2002")
data[3] = sum(NEI[NEI["year"] == "2005" & NEI["fips"]=="24510","Emissions"]) / sum(NEI["fips"]=="24510" & NEI["year"]=="2005")
data[4] = sum(NEI[NEI["year"] == "2008" & NEI["fips"]=="24510","Emissions"]) / sum(NEI["fips"]=="24510" & NEI["year"]=="2008")

names(data) = c("1999","2002","2005","2008")

png(filename="plot2.png")
plot(names(data),data, xlab="Year",ylab="Average Emissions in Baltimore City per sensor")
text(names(data), data, names(data), cex=0.6, pos=c(1,1,1,3), col="black")
dev.off()