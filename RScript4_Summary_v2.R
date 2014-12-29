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

####################################################################
## All possible combinations of living arrangements               ##
####################################################################
str(Data$HH_live_son_mx)

levels(Data$HH_live_son_mx) <- c('no', 'yes')
table(Data$HH_live_son_mx)

Data$HH_live_daughter_mx <- c('no', 'yes')
table(Data$HH_live_daughter_mx)

table(Data$spouse_Sfamily_mx)
table(Data$spouse_Dfamily_mx)
table(Data$spouse_SD_mx)
table(Data$Fnospouse_SD)
table(Data$Fnospouse_SorD)
table(Data$F_nosps_DIL2_r)
table(Data$mother_notmarried)
table(Data$HH_MIL)
table(Data$HH_SIL)
table(Data$Mnospouse_SD)
table(Data$Mnospouse_SorD)
table(Data$M_nosps_DIL2_r)
table(Data$father_notmarried)
table(Data$HH_FIL)
table(Data$HH_brother)
table(Data$HH_BIL)
table(Data$live_alone)
table(Data$spouseonly1_mx)
table(Data$F_grandchild_r)
table(Data$M_grandchild_r)

LivingArr_Variables <- c('HH_live_son_mx',  
                         'HH_live_daughter_mx', 
                         'spouse_Sfamily_mx', 
                         'spouse_Dfamily_mx', 
                         'spouse_SD_mx', 
                         'Fnospouse_SD', 
                         'Fnospouse_SorD', 
                         'F_nosps_DIL2_r', 
                         'mother_notmarried', 
                         'HH_MIL', 
                         'HH_SIL', 
                         'Mnospouse_SD', 
                         'Mnospouse_SorD', 
                         'M_nosps_DIL2_r', 
                         'father_notmarried',  
                         'HH_FIL', 
                         'HH_brother', 
                         'HH_BIL', 
                         'live_alone', 
                         'spouseonly1_mx', 
                         'F_grandchild_r', 
                         'M_grandchild_r'
                         )
Table1 <- NULL
for(Var in LivingArr_Variables){
  Table1 <- rbind(Table1, table(Data[,Var]))
}
rownames(Table1) <- LivingArr_Variables
Table1 <- as.data.frame(Table1)
Table1$no_percent <- Table1$no * 100/7920
Table1$yes_percent <- Table1$yes * 100/7920
xtable(Table1, digits = c(0, 0, 0, 2, 2))

