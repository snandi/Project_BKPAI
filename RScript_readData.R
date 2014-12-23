rm(list=ls(all.names=TRUE))
rm(list=objects(all.names=TRUE))
#dev.off()

########################################################################
## This script reads in and explores the BKPAI dataset                ##
########################################################################

########################################################################
## Run Header files                                                   ##
########################################################################
Filename.Header <- paste('~/RScripts/HeaderFile_Nandi.R', sep='')
source(Filename.Header)
RScriptPath <- '~/Project_BKPAI/RScripts_BKPAI/'
source(paste(RScriptPath, 'fn_Library_BKPAI.R', sep=''))

########################################################################
## Data Input                                                         ##
########################################################################
# Filename.Data <- paste('~/Honey/BKPAI/BKPAI.csv')
# Data <- read.csv(file=Filename.Data, header=FALSE, nrows=250,
#                   quote="", 
#                   comment.char="",
#                   stringsAsFactors=F)
# colnames(Data) <- Data[1,]
# str(Data)
# Data <- Data[-1,]

# Filename.dta <- paste('~/Honey/BKPAI/BKPAI_Data_S_J.dta')
# Data <- read.dta(file = Filename.dta)

Filename.rdata <- paste('~/Project_BKPAI/BKPAI.RData')
# save(Data, file = Filename.rdata)
load(Filename.rdata)

########################################################################
## Basic understanding of the dataset                                 ##
########################################################################
Data <- as.data.frame(Data)
Data <- Data[, c('uid', colnames(Data) %w/o% 'uid')]

length(unique(Data$iuid)) #7920
length(unique(Data$vhhno))
length(unique(Data$uid)) #7920

nrow(subset(Data, iuid=='0'))
View(subset(Data, iuid=='0'))

## plot(Data$live_arrange_max)
## plot(log(Data$row_total_income))
## xyplot(live_arrange_max ~ log(row_total_income), data=Data)

## barplot(table(Data$wealth_quintile))
## barplot(table(Data$own_asset))

## summary(Data$edu_avg_r)

Varlist <- c('uid',
             'hhweight',
             'wealth_quintile',
             'state',
             'htype',
             'hhpers',
             'live_arrange_max',
             'poor_health',
             'row_total_income',
             'contribute_max_i',
             'depend_child_mx',
             'own_asset',
             'transfer_child_mx',
             'own_asset',
             'transfer_child_mx',
             'disability_mx',
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
             'HH_head60',
             'caste',
             'religion'
             )
 
lapply(X=Varlist, FUN=function(var){if(!(var %in% colnames(Data))) print(var)})

Data.Subset <- Data[,Varlist]
