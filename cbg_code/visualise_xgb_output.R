library(data.table)

x <- fread('~/Documents/data/CBGdata/abstract_exports/export_admissionDuration_14_days_hypothresh_NAs_included_3_ratio_4_WITH_LOO_PRED.csv')

x_no_prior_hypo <- x[training_min > 3]
x_hr <- x_no_prior_hypo[prediction > 0.4]
boxplot(x_hr[, -c('id')], ylim = c(0, 28), las=3, varwidth=T)

export=x

plot(export$cV, export$prediction, cex = 0.4, col=rgb(0,0,0,0.4))

plot(export$min_by_day_13, export$prediction, cex = 0.4, col=rgb(0,0,0,0.4))
plot(export$min_by_day_7, export$prediction, cex = 0.4, col=rgb(0,0,0,0.4))
plot(export$min_by_day_1, export$prediction, cex = 0.4, col=rgb(0,0,0,0.4))

boxplot(export$prediction ~ cut(export$min_by_day_13, 80), varwidth=T, las = 3)
boxplot(export$prediction ~ cut(export$min_by_day_7, 80), varwidth=T, las = 3)
boxplot(export$prediction ~ cut(export$min_by_day_1, 80), varwidth=T, las = 3)

boxplot(export$prediction ~ cut(export$max_by_day_13, 80), varwidth=T, las = 3)
boxplot(export$prediction ~ cut(export$max_by_day_7, 80), varwidth=T, las = 3)
boxplot(export$prediction ~ cut(export$max_by_day_1, 100), varwidth=T, las = 3)

boxplot(export$prediction ~ export$day_N_13, varwidth=T)
boxplot(export$prediction ~ export$day_N_7, varwidth=T)
boxplot(export$prediction ~ export$day_N_1, varwidth=T)

boxplot(export$prediction ~ cut(export$gradient, 80), varwidth=T)
boxplot(export$prediction ~ cut(export$cV, 100), varwidth=T)

