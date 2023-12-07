library(this.path)
library(ggplot2)

#loading the data 

fitr <- read.csv(paste0(this.dir(), "/../raw/heart.csv"))
sum(fitr$Cholesterol==0)

fit <- read.csv(paste0(this.dir(), "/../clean/cleaned_heart.csv"))

lm<-lm(RestingBP ~ Cholesterol*Sex + Age, data=fit)
summary(lm)

fit$ageBin<-cut(fit$Age, breaks=c(-Inf, 50, Inf), labels=c("<54", ">=54"))

cholBPSex<-ggplot(fit, aes(x=Cholesterol, y=RestingBP, col=Sex))+
  geom_point(alpha=0.3)+
  geom_smooth(method="lm", formula=y~x, se=FALSE)+
  labs(x="Cholesterol", y="Resting Blood Pressure")

cholBPAge<-ggplot(fit, aes(x=Cholesterol, y=RestingBP, col=ageBin))+
  geom_point(alpha=0.3)+
  geom_smooth(method="lm", formula=y~x, se=FALSE)+
  labs(x="Cholesterol", y="Resting Blood Pressure", col="Age")

ggsave(paste0(this.dir(), "/../visualisation/cholBPSex.png"), cholBPSex)
ggsave(paste0(this.dir(), "/../visualisation/cholBPAge.png"), cholBPAge)



