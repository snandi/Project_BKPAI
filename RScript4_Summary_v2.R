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

Varlist <- c('live_arrange_max',
             'wealth_quintile',
             'state',
             'htype',
             'hhpers',
             'poor_health',
             'row_total_income',
             'contribute_max',
             'depend_child_mx',
             'dependence_other_mx',
             'own_asset',
             'transfer_child_mx',
             'asset_nominate_mx',
             'disability_mx',
             'disability_F_mx',
             'disability_M_mx',
             'avg_ADL',
             'ADL_mx',
             'IADL_mx',
             'avg_IADL',
             'either_disb',
             'work_adult',
             'education',
             'edu_avg_r',
             'adult_hh_mx',
             'total_edu',
             'avg_edu_adult',
             'total_work_adultR',
             'HH_head60',
             'HH_headM_max',
             'caste',
             'religion'
)

# Varlist <- c('uid',
#              'hhweight',
#              'wealth_quintile',
#              'state',
#              'htype',
#              'hhpers',
#              'live_arrange_max',
#              'poor_health',
#              'row_total_income',
#              #'contribute_max_i',
#              'depend_child_mx',
#              'own_asset',
#              'transfer_child_mx', ## asset transfered to child
#              #'own_asset',
#              # transfer_child_mx',
#              'disability_mx',  ## 
#              'disability_F_mx',
#              'disability_M_mx',
#              'either_disb',
#              'work_adult',
#              'education',
#              'edu_avg_r',
#              'adult_hh_mx',
#              'total_edu',
#              'avg_edu_adult',
#              'total_work_adultR',
#              'HH_head60', ## if the aging adult is a HH head
#              'caste',
#              'religion'
# )
lapply(X=Varlist, FUN=function(var){if(!(var %in% colnames(Data))) print(var)})

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

####################################################################
## HH_live_son_mx ##
####################################################################
table(Data$HH_son_max)
table(Data$HH_son2_max)
table(Data$HH_son2W_max)
table(Data$HH_son2M_max)
table(Data$HH_sonwife_mx)
table(Data$HH_son60_max)
table(Data$HH_son_adopt_max)

Son_Variables <- c('HH_son_max',
                   'HH_son2_max',
                   'HH_son2W_max',
                   'HH_son2M_max',
                   'HH_sonwife_mx',
                   'HH_son60_max',
                   'HH_son_adopt_max')
Son_Varnames <- c('son',
                  'son2',
                  'son2W',
                  'son2M',
                  'sonwife',
                  'son60',
                  'son_adopt')

Table2 <- NULL
for(Var in Son_Variables){
  Table2 <- rbind(Table2, table(Data[,Var]))
}
rownames(Table2) <- Son_Varnames
Table2 <- as.data.frame(Table2)
Table2$no_percent <- Table2$no * 100/7920
Table2$yes_percent <- Table2$yes * 100/7920
xtable(Table2, digits = c(0, 0, 0, 2, 2))

####################################################################
## HH_live_daughter_mx ##
####################################################################
Data$HH_daughter_max <- as.factor(Data$HH_daughter_max)
levels(Data$HH_daughter_max) <- c('no', 'yes')
table(Data$HH_daughter_max)

table(Data$HH_daughter2_max)
table(Data$HH_D2W_max)
table(Data$HH_D2M_max)

Data$HH_daughterhusband_i <- as.factor(Data$HH_daughterhusband_i)
levels(Data$HH_daughterhusband_i) <- c('no', 'yes')
table(Data$HH_daughterhusband_i)

table(Data$HH_daughter60_max)

Data$HH_daughter_adopt2 <- as.factor(Data$HH_daughter_adopt2)
levels(Data$HH_daughter_adopt2) <- c('no', 'yes')
table(Data$HH_daughter_adopt2)

Daughter_Variables <- c('HH_daughter_max',
                        'HH_daughter2_max',
                        'HH_D2W_max',
                        'HH_D2M_max',
                        'HH_daughterhusband_i',
                        'HH_daughter60_max',
                        'HH_daughter_adopt2')
Daughter_Varnames <- c('daughter',
                       'daughter2',
                       'D2W',
                       'D2M',
                       'daughterhusband',
                       'daughter60',
                       'daughter_adopt')

Table3 <- NULL
for(Var in Daughter_Variables){
  Table3 <- rbind(Table3, table(Data[,Var]))
}
rownames(Table3) <- Daughter_Varnames
Table3 <- as.data.frame(Table3)
Table3$no_percent <- Table3$no * 100/7920
Table3$yes_percent <- Table3$yes * 100/7920
xtable(Table3, digits = c(0, 0, 0, 2, 2))

####################################################################
## Live alone ##
####################################################################
table(Data$F_alone2)
table(Data$M_alone2)
Alone_Variables <- c('F_alone2', 
                     'M_alone2')
Alone_Varnames <- c('Female', 
                     'Male')

Table4 <- NULL
for(Var in Alone_Variables){
  Table4 <- rbind(Table4, table(Data[,Var]))
}
rownames(Table4) <- Alone_Varnames
Table4 <- as.data.frame(Table4)
Table4$no_percent <- Table4$no * 100/7920
Table4$yes_percent <- Table4$liv * 100/7920
xtable(Table4, digits = c(0, 0, 0, 2, 2))

####################################################################
## relationships ##
####################################################################
Data1 <- Data[,Varlist]
levels(Data1$live_arrange_max)[4] <- 'with children'

str(Data1)
Data1 <- within(data=Data1,{
  state <- as.factor(state)
  dependence_other_mx <- as.factor(dependence_other_mx)
  own_asset <- as.factor(own_asset)
})
levels(Data1$state) <- c('Himachal', 'Punjab', 'Bengal', 'Odisha', 
                         'Maharashtra', 'Kerala', 'Tamil Nadu')

Col <- 31

fn_printFactorTables <- function(Col, Data1){
  Colname <- gsub(pattern = "_", replacement = " ", x = colnames(Data1)[Col])
  Caption.1 <- paste('Frequency table between', Colname, 'and Living Arrangement')
  Caption.2 <- paste('Test of independence between', Colname, 'and Living Arrangement')
  
  Table.pct <- prop.table(table(Data1[,Col],Data1$live_arrange_max),1)
  print(xtable(Table.pct, caption=Caption.1), table.placement='H')
  Table.pct.r <- melt(Table.pct, id=rownames(Table.pct))
  #table(Data1$poor_health,Data1$live_arrange_max)
  Test <- chisq.test(table(Data1[,Col],Data1$live_arrange_max))
  print(xtable(as.data.frame(cbind(X_Sq=Test$statistic, 
                                   DF=Test$parameter, 
                                   pvalue=Test$p.value)),
               caption=Caption.2,
               digits=c(0, 2, 0, 4)), 
        table.placement='H', include.rownames=FALSE)  

  names(Table.pct.r)[2] <- 'Living'
  Plot <- qplot(x=Var.1, y=value, data=Table.pct.r, geom="bar", 
                fill=Living, stat='identity') + 
    xlab(label = Colname) + ylab('Percentage') + 
    ggtitle(Caption.1)
  print(Plot)
}

fn_printFactorTables(Col=3, Data1=Data1)
Table.pct <- prop.table(table(Data1[,Col],Data1$live_arrange_max),1)
Table.pct.r <- melt(Table.pct, id=rownames(Table.pct))





