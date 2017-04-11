library(ggplot)
setwd("path_to_working_folder")
# getwd()

df <- read.csv(file="example.csv",
      stringsAsFactors = FALSE)

# head(df)
# summary(df)
# str(df)

# subset the data by "reading_type"
newdata1 <- df[which(df$reading_type == 1), ]

# time series on a continuous x-axis ("secs_elapsed")
line1 <- ggplot(newdata1, aes(x = newdata1$secs_elapsed)) + geom_line(aes(y= newdata1$reading_value))

# scatter plot on a continuous x-axis ("secs_elapsed")
scatter1 <- ggplot(newdata1, aes(x = newdata1$secs_elapsed, y = newdata1$reading_value)) + geom_point()

# display the data by exhalation "seid" on a discontinuous x-axis
line1 + facet_grid(. ~seid, scales = 'free')
line1 + facet_grid(. ~seid, scales = 'free', space = 'free')

