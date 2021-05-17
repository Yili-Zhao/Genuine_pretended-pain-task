library(bootcorci)

# behavioral: q2~pain feeling,q3~unpleasantness, genuine and pretended pain expressions
dat_q2_q3<- read.csv("../Data/pain_behavioral_data.csv",TRUE, ",")

class(dat_q2_q3)
head(dat_q2_q3)

colnames(dat_q2_q3)[5] = "genuine_ex_q2"
colnames(dat_q2_q3)[7] = "pretended_ex_q2"
colnames(dat_q2_q3)[9] = "genuine_ex_q3"
colnames(dat_q2_q3)[11] = "pretended_ex_q3" 

## Correlations    
x1=dat_q2_q3$genuine_ex_q2 
y1=dat_q2_q3$genuine_ex_q3
x2=dat_q2_q3$pretended_ex_q2
y2=dat_q2_q3$pretended_ex_q3

Q2_Q3_correlation=twocorci.nov(x1,
                               y1,
                               x2,
                               y2,
                               method = "pbcor",
                               nboot = 2000,
                               alpha = 0.05,
                               alternative = "two.sided",
                               null.value = 0,
                               saveboot = TRUE)