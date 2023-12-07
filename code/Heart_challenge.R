library(this.path)

#loading the data 

fit <- read.csv(paste0(this.dir(), "/../clean/cleaned_heart.csv"))

# head(fit, 10)
# sum(is.na(fit))
# 
# #Checking for missing values
# sum(is.na(fit$Cholesterol))
# table(is.na(fit$Cholesterol))
# 
# #Assigning all of the zero values to NA 
# 
# fit$Cholesterol[which(fit$Cholesterol <= 0)] <- NA
# table(is.na(fit$Cholesterol))
# 
# fit$RestingBP[which(fit$RestingBP <= 0)] <- NA
# table(is.na(fit$RestingBP))
# 
# #Cleaning the data 
# 
# fit.clean_chol <- subset(fit, !is.na(fit$Cholesterol))
# str(fit.clean)
# 
# fit.clean_bp <- subset(fit, !is.na(fit$RestingBP))
# str(fit.clean_bp)








