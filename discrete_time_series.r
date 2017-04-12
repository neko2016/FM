library(ggplot2)
setwd("path_to_working_folder")

df <- read.csv(file="Readings_user_134_session_6.csv", 
      stringsAsFactors = FALSE) 

# add a new column to df
df$rtype <- as.factor(df$reading_type)
df$seid2 <- as.factor(df$seid)

# subset the data by "reading_type"
newdata1 <- df[which(df$reading_type == 1), ]
newdata4 <- df[which(df$reading_type == 4), ]

# lines on a continuous x-axis ("secs_elapsed")
# line1 <- ggplot(newdata1, aes(x = newdata1$secs_elapsed)) + geom_line(aes(y= newdata1$reading_value))
line1 <- ggplot(newdata1, aes(secs_elapsed, reading_value)) + geom_line()
line4 <- ggplot(newdata1, aes(secs_elapsed, reading_value)) + geom_line()

# scatter plot on a continuous x-axis ("secs_elapsed")
# scatter1 <- ggplot(newdata1, aes(x = newdata1$secs_elapsed, y = newdata1$reading_value)) + geom_point()
scatter1 <- ggplot(newdata1, aes(secs_elapsed, reading_value)) + geom_point()
scatter4 <- ggplot(newdata1, aes(secs_elapsed, reading_value)) + geom_point()

# display the data by exhalation "seid" on a discontinuous x-axis
line1 + facet_grid(. ~seid, scales = 'free')
ggsave("Readings_user_134_session_6_h2_line_facet_evenWidth.jpg", width=9, height=6, dpi=300)
line1 + facet_grid(. ~seid, scales = 'free', space = 'free')
ggsave("Readings_user_134_session_6_h2_line_facet_unevenWidth.jpg", width=9, height=6, dpi=300)

scatter1 + facet_grid(. ~seid, scales = 'free')
ggsave("Readings_user_134_session_6_h2_scatter_facet_evenWidth.jpg", width=9, height=6, dpi=300)
scatter1 + facet_grid(. ~seid, scales = 'free', space = 'free')
ggsave("Readings_user_134_session_6_h2_scatter_facet_unevenWidth.jpg", width=9, height=6, dpi=300)

line4 + facet_grid(. ~seid, scales = 'free')
ggsave("Readings_user_134_session_6_ch4_line_facet_evenWidth.jpg", width=9, height=6, dpi=300)
line4 + facet_grid(. ~seid, scales = 'free', space = 'free')
ggsave("Readings_user_134_session_6_ch4_line_facet_unevenWidth.jpg", width=9, height=6, dpi=300)

scatter4 + facet_grid(. ~seid, scales = 'free')
ggsave("Readings_user_134_session_6_ch4_scatter_facet_evenWidth.jpg", width=9, height=6, dpi=300)
scatter4 + facet_grid(. ~seid, scales = 'free', space = 'free')
ggsave("Readings_user_134_session_6_ch4_scatter_facet_unevenWidth.jpg", width=9, height=6, dpi=300)

# overlayed all readings by "reading_type" and by exhalation "seid"
ggplot(df, aes(secs_elapsed, reading_value, colour=rtype)) +  geom_point() + facet_grid(. ~seid, scales = 'free')
ggsave("Readings_user_134_session_6_allReadings_scatter_evenFacet.jpg", width=9, height=6, dpi=300)
ggplot(df, aes(secs_elapsed, reading_value, colour=rtype)) +  geom_line() + geom_point() + facet_grid(. ~seid, scales = 'free')
ggsave("Readings_user_134_session_6_allReadings_scatterLine_evenFacet.jpg", width=9, height=6, dpi=300)

ggplot(df, aes(secs_elapsed, reading_value, colour=rtype)) +  geom_point() + facet_grid(. ~seid, scales = 'free', space = 'free')
ggsave("Readings_user_134_session_6_allReadings_scatter_unevenFacet.jpg", width=9, height=6, dpi=300)
ggplot(df, aes(secs_elapsed, reading_value, colour=rtype)) +  geom_line() + geom_point() + facet_grid(. ~seid, scales = 'free', space = 'free')
ggsave("Readings_user_134_session_6_allReadings_scatterLine_unevenFacet.jpg", width=9, height=6, dpi=300)

# overlayed h2 readings by exhalation "seid2"
ggplot(newdata1, aes(erid, reading_value, group=seid2, colour=seid2)) +  geom_line()
ggsave("Readings_user_134_session_6_h2_line_overlayed.jpg", width=9, height=6, dpi=300)
# overlayed ch4 readings by exhalation "seid2"
ggplot(newdata4, aes(erid, reading_value, group=seid2, colour=seid2)) +  geom_line()
ggsave("Readings_user_134_session_6_ch4_line_overlayed.jpg", width=9, height=6, dpi=300)

