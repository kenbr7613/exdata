setwd("~/Learning/exdata/ExData_Plotting2")

library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totals = tapply(NEI[,"Emissions"], list(NEI[,"type"], NEI[,"year"]), sum)


png(filename="plot3.png")
names(cols) = c("Non-road","Nonpoint","On-road","Point")
p = qplot(rep(c("1999","2002","2005","2008"),each=4), as.vector(totals), col=rep(cols,4), xlab="Year",ylab="Emissions")
p = p + scale_color_discrete(name="Type", labels=names(cols)) + geom_point(size=4)
print(p)
dev.off()