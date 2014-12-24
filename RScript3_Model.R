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

Data <- as.data.frame(Data)
Data <- Data[, c('uid', colnames(Data) %w/o% 'uid')]

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
Data1 <- Data[,Varlist]
str(Data1)

########################################################################
## First Multinomial model                                            ##
########################################################################
Model1 <- multinom(live_arrange_max ~ poor_health + depend_child_mx + own_asset + 
                     transfer_child_mx + disability_mx + work_adult + caste + religion, 
                   data=Data1)

Model1.1 <- multinom(live_arrange_max ~ depend_child_mx + own_asset + 
                     transfer_child_mx + disability_mx + work_adult + caste + religion, 
                   data=Data1)

pchisq(deviance(Model1.1) - deviance(Model1), 
       Model1$edf - Model1.1$edf, lower=F)


Model1.2 <- multinom(live_arrange_max ~ poor_health + own_asset + 
                       transfer_child_mx + disability_mx + work_adult + caste + religion, 
                     data=Data1)
pchisq(deviance(Model1.2) - deviance(Model1), 
       Model1$edf - Model1.2$edf, lower=F)

Model1.3 <- multinom(live_arrange_max ~ poor_health + depend_child_mx + 
                       transfer_child_mx + disability_mx + work_adult + caste + religion, 
                     data=Data1)
pchisq(deviance(Model1.3) - deviance(Model1), 
       Model1$edf - Model1.3$edf, lower=F)
