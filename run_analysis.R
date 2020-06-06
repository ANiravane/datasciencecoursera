library(plyr)

setwd("./UCI HAR Dataset")

train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")

train["activity"] <- read.table("train/y_train.txt")
test["activity"] <- read.table("test/y_test.txt")

train["subject"] <- read.table("train/subject_train.txt")
test["subject"] <- read.table("test/subject_test.txt")

dataset <- rbind(train, test)

means <- colMeans(dataset, na.rm = TRUE)
sds <- sapply(dataset, sd, na.rm = TRUE)

dataset$activity[dataset$activity == 1] <- "WALKING"
dataset$activity[dataset$activity == 2] <- "WALKING_UPSTAIRS"
dataset$activity[dataset$activity == 3] <- "WALKING_DOWNSTAIRS"
dataset$activity[dataset$activity == 4] <- "SITTING"
dataset$activity[dataset$activity == 5] <- "STANDING"
dataset$activity[dataset$activity == 6] <- "LAYING"

separated <- split(dataset, dataset$subject)

new_dataset <- data.frame()

for(s in separated) {
        r <- aggregate(s[, 1:561], list(s$activity), mean)
        new_dataset <- rbind(new_dataset, cbind(r, subj = rep(s$subject, times = nrow(r))))
}

names(new_dataset)[names(new_dataset) == 'Group.1'] <- 'activity'

write.table(new_dataset, file = "new_dataset.txt", row.names = FALSE)