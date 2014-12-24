rm(list=ls(all.names=TRUE))
rm(list=objects(all.names=TRUE))
#dev.off()

########################################################################
## This script reads in and explores the BKPAI dataset                ##
########################################################################

########################################################################
## Run Header files                                                   ##
########################################################################
#Filename.Header <- paste('~/RScripts/HeaderFile_Nandi.R', sep='')
Filename.Header <- paste('S:/RScripts/HeaderFile_Nandi.R', sep='')
source(Filename.Header)
#RScriptPath <- '~/Project_BKPAI/RScripts_BKPAI/'
RScriptPath <- 'S:/Stat/Stat_Consulting/Project_BKPAI/RScripts_BKPAI/'
source(paste(RScriptPath, 'fn_Library_BKPAI.R', sep=''))
ProjectPath <- 'S:/Stat/Stat_Consulting/Project_BKPAI/'

########################################################################
## Data Input                                                         ##
########################################################################
Filename.rdata <- paste(ProjectPath, 'DATA_for_Analysis_12_23_2014.rdata', sep='')
load(Filename.rdata)

########################################################################
## Basic understanding of the dataset                                 ##
########################################################################
Data <- as.data.frame(Data)
Data <- Data[, c('uid', colnames(Data) %w/o% 'uid')]

length(unique(Data$iuid))
length(unique(Data$vhhno))
length(unique(Data$uid))

# plot(Data$live_arrange_max)
# plot(log(Data$row_total_income))
# xyplot(live_arrange_max ~ log(row_total_income), data=Data)
# 
# barplot(table(Data$wealth_quintile))
# barplot(table(Data$own_asset))

summary(Data$edu_avg_r)

Varlist <- c('uid',
             'hhweight',
             'wealth_quintile',
             'state',
             'htype',
             'hhpers',
             'live_arrange_max',
             'poor_health',
             'row_total_income',
             #'contribute_max_i',
             'depend_child_mx',
             'own_asset',
             'transfer_child_mx', ## asset transfered to child
             #'own_asset',
             # transfer_child_mx',
             'disability_mx',  ## 
             'disability_F_mx',
             'disability_M_mx',
             'either_disb',
             'work_adult',
             'education',
             'edu_avg_r',
             'adult_hh_mx',
             'total_edu',
             'avg_edu_adult',
             'total_work_adultR',
             'HH_head60', ## if the aging adult is a HH head
             'caste',
             'religion'
)
#lapply(X=Varlist, FUN=function(var){if(!(var %in% colnames(Data))) print(var)})

Data1 <- Data[,Varlist]
str(Data1)
levels(Data1$live_arrange_max)[4] <- 'with children'

## Education
summary(Data1$education)
sum(is.na(Data1$education))
barplot(table(Data1$education))
matplot(prop.table(table(Data1$education,Data1$live_arrange_max),1),type="l",
        xlab="Education",ylab="Proportion",lty=c(1,2,4,5))

## hhweight
summary(Data1$hhweight)
qplot(x=live_arrange_max, y=hhweight, data=Data1) + geom_boxplot()

## wealth_quintile
summary(Data1$wealth_quintile)
Table.wealth_quintile <- prop.table(table(Data1$wealth_quintile,Data1$live_arrange_max),1)
Table.wealth_quintile.r <- melt(Table.wealth_quintile, id=rownames(Table.wealth_quintile))
names(Table.wealth_quintile.r)[2] <- 'Living'
Plot1 <- qplot(x=Var.1, y=value, data=Table.wealth_quintile.r, color=Living) + 
  geom_line(size=1.2) + 
  xlab(label = 'Wealth Quintile') + ylab('Percentage') + 
  ggtitle('Living arrangement and Wealth quintile')
#legend.title = element_text(label='Living', size=14)
jpeg("Wealth_Quintile.jpg")
Plot1
dev.off()

## poor_health
summary(Data1$poor_health)
Table.poor_health <- prop.table(table(Data1$poor_health,Data1$live_arrange_max),1)
Table.poor_health.r <- melt(Table.poor_health, id=rownames(Table.poor_health))
table(Data1$poor_health,Data1$live_arrange_max)
Test.poor_health <- chisq.test(table(Data1$poor_health,Data1$live_arrange_max))
xtable(as.data.frame(cbind(X_Sq=Test.poor_health$statistic, 
                           DF=Test.poor_health$parameter, 
                           pvalue=Test.poor_health$p.value)))

## row_total_income
summary(Data1$row_total_income)
hist(log(Data1$row_total_income))
Plot2 <- qplot(x=live_arrange_max, y=log(row_total_income + 1), data=Data1) + 
  geom_boxplot() + 
  xlab(label = 'Living Arrangement') + ylab('log(row_total_income)')
jpeg("Row_Total_Income.jpg")
Plot2
dev.off()

## depend_child_mx
table(Data1$depend_child_mx)
table(Data1$depend_child_mx, Data1$live_arrange_max)
Test.depend_child_mx <- chisq.test(table(Data1$depend_child_mx, Data1$live_arrange_max))
xtable(as.data.frame(cbind(X_Sq=Test.depend_child_mx$statistic, 
                           DF=Test.depend_child_mx$parameter, 
                           pvalue=Test.depend_child_mx$p.value)))
Plot3 <- qplot(live_arrange_max, data=Data1, geom="bar", fill=depend_child_mx)
jpeg("Depend_Child_Mx.jpg")
Plot3
dev.off()

## own_asset
Data1$own_asset <- as.factor(Data1$own_asset)
table(Data1$own_asset)
table(Data1$live_arrange_max, Data1$own_asset)
prop.table(x = table(Data1$live_arrange_max, Data1$own_asset), margin=2)
Test.own_asset <- chisq.test(table(Data1$own_asset, Data1$live_arrange_max))
xtable(as.data.frame(cbind(X_Sq=Test.own_asset$statistic, 
                           DF=Test.own_asset$parameter, 
                           pvalue=Test.own_asset$p.value)))


## religion
table(Data1$religion)
table(Data1$live_arrange_max, Data1$religion)
xtable(prop.table(x = table(Data1$religion, Data1$live_arrange_max), margin=1))
Test.religion <- chisq.test(table(Data1$religion, Data1$live_arrange_max))
xtable(as.data.frame(cbind(X_Sq=Test.religion$statistic, 
                           DF=Test.religion$parameter, 
                           pvalue=Test.religion$p.value)), digits=c(0, 2, 0, 4))

## disability_mx
table(Data1$disability_mx)
table(Data1$live_arrange_max, Data1$disability_mx)
prop.table(x = table(Data1$disability_mx, Data1$live_arrange_max), margin=1)
Test.disability_mx <- chisq.test(table(Data1$disability_mx, Data1$live_arrange_max))
xtable(as.data.frame(cbind(X_Sq=Test.disability_mx$statistic, 
                           DF=Test.disability_mx$parameter, 
                           pvalue=Test.disability_mx$p.value)), digits=c(0, 2, 0, 4))

## work_adult
t(table(Data1$work_adult))
table(Data1$live_arrange_max, Data1$work_adult)
qplot(work_adult, data=Data1, geom="bar", fill=factor(live_arrange_max))
qplot(live_arrange_max, data=Data1, geom="bar", fill=factor(work_adult))
Test.work_adult <- chisq.test(table(Data1$work_adult, Data1$live_arrange_max))
xtable(as.data.frame(cbind(X_Sq=Test.work_adult$statistic, 
                           DF=Test.work_adult$parameter, 
                           pvalue=Test.work_adult$p.value)), digits=c(0, 2, 0, 4))

## total_edu
summary(Data1$total_edu)
qplot(x=live_arrange_max, y=log(total_edu+1), data=Data1) + geom_boxplot()

## HH_head60
table(Data1$HH_head60)
table(Data1$live_arrange_max, Data1$HH_head60)
qplot(HH_head60, data=Data1, geom="bar", fill=factor(live_arrange_max))

## transfer_child_mx
table(Data1$transfer_child_mx)
table(Data1$live_arrange_max, Data1$transfer_child_mx)
round(prop.table(x = table(Data1$transfer_child_mx, Data1$live_arrange_max), margin=1), 2)
round(prop.table(x = table(Data1$transfer_child_mx, Data1$live_arrange_max), margin=1), 2)
Test.transfer_child_mx <- chisq.test(table(Data1$transfer_child_mx, Data1$live_arrange_max))
xtable(as.data.frame(cbind(X_Sq=Test.transfer_child_mx$statistic, 
                           DF=Test.transfer_child_mx$parameter, 
                           pvalue=Test.transfer_child_mx$p.value)), digits=c(0, 2, 0, 4))

## caste
table(Data1$caste)
t(table(Data1$live_arrange_max, Data1$caste))
round(prop.table(x = table(Data1$caste, Data1$live_arrange_max), margin=1), 2)

## avg_edu_adult
summary(Data1$avg_edu_adult)
qplot(x=live_arrange_max, y=log(avg_edu_adult+1), data=Data1) + geom_boxplot()
