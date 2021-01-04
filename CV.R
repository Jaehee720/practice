library(tidyverse)
library(caret)

data("swiss")
sample_n(swiss,3)

set.seed(123)
training.samples <- swiss$Fertility %>% 
  createDataPartition(p = 0.8, list = F)
train.data <- swiss[training.samples,]
test.data <- swiss[-training.samples,]

model <- lm(Fertility ~., data = train.data)

predictions <- model %>% predict(test.data)

predictions
