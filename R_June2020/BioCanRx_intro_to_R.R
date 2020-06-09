# There is far more to R than we can learn in an hour!
# but let's start our basic script here

# let's read in some data. I found this random baseball stadium data on the internet.
# We can provide filepaths or weblinks, too
# this will import data as a 'data.frame'

# note quotes on the path to the data--these are required
bdata <- read.csv('https://raw.githubusercontent.com/lenwood/MLB-Attendance/master/data/clean/MLB-Stadium-Capacity.csv')

# you should always inspect your data to see if the import worked correcly

# head() shows first rows of data
head(bdata)

# tail shows last rows
tail(bdata)

# get dataset dimensions
dim(bdata)
ncol(bdata)
nrow(bdata)

# we can get a lot more info too with the structure (str()) function
str(bdata)

# there are a bunch of way we can access the columns of a data.frame.
# One is using '$'

# look at histogram of capacities
hist(bdata$Capacity)
mean(bdata$Capacity)

# make a 'base' boxplot of capacities by Year
boxplot(bdata$Capacity ~ bdata$Year)

# make a similar boxplot with ggplot
library(ggplot2)
ggplot(bdata, aes(x=Year, group=Year, y=Capacity)) + geom_boxplot()

# let's do some basic (likely incorrect) stats:
# first plot data
ggplot(bdata, aes(x=State, group=State, y=Capacity)) + geom_boxplot()

# this will compute an ANOVA with Capacity (Y) as a function of State (X)
# note this is an incorrect procedure. Why?
mod <- aov(Capacity ~ State, data=bdata)
summary(mod)
TukeyHSD(mod)

# better way to consider data?
ggplot(bdata, aes(x=Year, group=Team, y=Capacity, color=Team)) + 
  geom_point() + 
  geom_line()
