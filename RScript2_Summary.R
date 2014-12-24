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
barplot(table(Data1$wealth_quintile))
Table.wealth_quintile <- prop.table(table(Data1$wealth_quintile,Data1$live_arrange_max),1)
Table.wealth_quintile.r <- melt(Table.wealth_quintile, id=rownames(Table.wealth_quintile))
qplot(x=Var.1, y=value, data=Table.wealth_quintile.r, color=Var.2) + 
  geom_line(size=1.2)

## poor_health
summary(Data1$poor_health)
Table.poor_health <- prop.table(table(Data1$poor_health,Data1$live_arrange_max),1)
Table.poor_health.r <- melt(Table.poor_health, id=rownames(Table.poor_health))

## row_total_income
summary(Data1$row_total_income)
qplot(x=live_arrange_max, y=log(row_total_income + 1), data=Data1) + geom_boxplot()

## depend_child_mx
summary(Data1$depend_child_mx)
table(Data1$depend_child_mx, Data1$live_arrange_max)
qplot(live_arrange_max, data=Data1, geom="bar", fill=depend_child_mx)

## own_asset
table(Data1$own_asset)
table(Data1$live_arrange_max, Data1$own_asset)
prop.table(x = table(Data1$live_arrange_max, Data1$own_asset), margin=2)
qplot(live_arrange_max, data=Data1, geom="bar", fill=factor(own_asset))

## religion
summary(Data1$religion)
table(Data1$live_arrange_max, Data1$religion)
prop.table(x = table(Data1$religion, Data1$live_arrange_max), margin=1)
qplot(religion, data=Data1, geom="bar", fill=factor(live_arrange_max))

## disability_mx
table(Data1$disability_mx)
table(Data1$live_arrange_max, Data1$disability_mx)
prop.table(x = table(Data1$disability_mx, Data1$live_arrange_max), margin=1)

## work_adult
table(Data1$work_adult)
table(Data1$live_arrange_max, Data1$work_adult)
qplot(work_adult, data=Data1, geom="bar", fill=factor(live_arrange_max))
qplot(live_arrange_max, data=Data1, geom="bar", fill=factor(work_adult))

## total_edu
summary(Data1$total_edu)
qplot(x=live_arrange_max, y=log(total_edu+1), data=Data1) + geom_boxplot()

## HH_head60
table(Data1$HH_head60)
table(Data1$live_arrange_max, Data1$HH_head60)
qplot(HH_head60, data=Data1, geom="bar", fill=factor(live_arrange_max))