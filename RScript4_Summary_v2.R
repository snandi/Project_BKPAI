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
PlotPath <- 'S:/Stat/Stat_Consulting/Project_BKPAI/Plots/'

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

VarNames <- c('Living Arrangement',
             'Wealth Quintile',
             'State',
             'Household type',
             'hhpers',
             'Poor Health',
             'Total Income',
             'contribute_max',
             'At least one dependent on children',
             'Other elderly financialy dependent',
             'Owns Asset',
             'Asset Transferred to Child',
             'asset_nominate_mx',
             'At least one elderly with disability',
             'Female elderly with disability',
             'Male elderly with disability',
             'Avg ADL needs of elderly',
             'At least one elderly with ADL needs',
             'Max IADL needed by elderly',
             'Avg IADL needs of elderly',
             'either_disb',
             'HH with working elderly',
             'Highest education of elderly',
             'Avg education of elderly',
             'Total adults between 17 and 60',
             'Total education of all adults',
             'Avg education of all adults',
             'Total number of working adults',
             'HH headed by adults above 60',
             'HH headed by male above 60',
             'Caste',
             'Religion'
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
VarMap <- VarNames
names(VarMap) <- Varlist
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
LivingArr_VarNames <- c("Living with son or son's family",
                        "Living with daughter or daughter's family",
                        "Living with son and spouse and family",
                        "Living with daughter and spouse and family",
                        "Elderly spouse with both son and daughter",
                        "No spouse, living with son and daughter",
                        "No spouse, living with son OR daughter",
                        "Female, No spouse, only DIL, no son",
                        "Unmarried mother 60 and up",
                        "Unmarried mother-in-law 60 and up",
                        "Unmarried sister-in-law 60 and up",
                        "Male elderly, no spouse, live son and daughter",
                        "Male elderly, no spouse, live son OR daughter",
                        "Male, No spouse, only DIL, no son",
                        "Unmarried father 60 and up",
                        "Unmarried father-in-law 60 and up",
                        "Unmarried brother 60 and up",
                        "Unmarried brother-in-law 60 and up",
                        "Elderly living alone",
                        "Living only with spouse",
                        "Female, living only with grandchildren",
                        "Male, living only with grandchildren"
)

Table1 <- NULL
for(Var in LivingArr_Variables){
  Table1 <- rbind(Table1, table(Data[,Var]))
}
rownames(Table1) <- LivingArr_VarNames
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
Son_Varnames <- c('HH head male < 60, with elderly',
                  'HH head adult > 60, with son',
                  'HH head female, spouse > 60, with son',
                  'HH head male, spouse > 60, with son',
                  'HH head DIL',
                  'HH head male > 60, with elderly',
                  'HH head adult > 60, with adopted son')

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
Daughter_Varnames <- c('HH head female < 60, with elderly',
                       'HH head adult > 60, with daughter',
                       'HH head female, spouse > 60, with daughter',
                       'HH head male, spouse > 60, with daughter',
                       'HH head Son in law',
                       'HH head female > 60, with elderly',
                       'HH head adult > 60, with adopted daughter')

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

Data1 <- within(data=Data1,{
  state <- as.factor(state)
  dependence_other_mx <- as.factor(dependence_other_mx)
  own_asset <- as.factor(own_asset)
})
levels(Data1$state) <- c('Himachal', 'Punjab', 'Bengal', 'Odisha', 
                         'Maharashtra', 'Kerala', 'Tamil Nadu')

str(Data1)

Col <- 2

# for(Col in 2:ncol(Data1)){
#   #for(Col in 2:6){
#   Colname <- gsub(pattern = "_", replacement = " ", x = colnames(Data1)[Col])
#   if(is.factor(Data1[,Col])){
#     cat("{\\bf{", Colname, "}}", sep="")
#     Filename.pdf <- paste(PlotPath, 'Plot_', Col, '.pdf', sep='')
#     fn_printFactorTables(Col=Col, Data1=Data1, PlotPath=PlotPath)
#     cat("\\begin{center}\n")
#     cat("\\begin{figure}[H]\n")
#     cat("\\includegraphics{", Filename.pdf, "}\n\n", sep="")
#     cat("\\end{figure}\n")
#     cat("\\end{center}\n")
#     cat("\\newpage")
#   }
# }

## wealth_quintile
summary(Data1$wealth_quintile)
Col <- 2
Table <- prop.table(table(Data1[,Col],Data1$live_arrange_max),1)
Table.r <- melt(Table, id=rownames(Table))
names(Table.r)[2] <- 'Living'
Plot1 <- qplot(x=Var.1, y=value, data=Table.r, color=Living) + 
  geom_line(size=1.2) + 
  xlab(label = 'Wealth Quintile') + ylab('Percentage') + 
  ggtitle('Living arrangement and Wealth quintile')
#legend.title = element_text(label='Living', size=14)
# jpeg("Wealth_Quintile.jpg")
Filename.jpg <- paste(PlotPath, 'Plot_wealth_quintile', '.jpg', sep='')
jpeg(file=Filename.jpg)
plot(Plot1)
dev.off()

## hhpers
summary(Data1$hhpers)
Col <- 5
Table <- prop.table(table(Data1[,Col],Data1$live_arrange_max),1)
Table.r <- melt(Table, id=rownames(Table))
names(Table.r)[2] <- 'Living'
Plot2 <- qplot(x=live_arrange_max, y=Data1[,Col], data=Data1) + 
  geom_boxplot() + 
  xlab(label = 'Living Arrangement') + ylab('hhpers') +
  ggtitle('Living arrangement and hhpers')
#legend.title = element_text(label='Living', size=14)
Filename.jpg <- paste(PlotPath, 'Plot_hhpers', '.jpg', sep='')
jpeg(file=Filename.jpg)
plot(Plot2)
dev.off()

## row_total_income
summary(Data1$row_total_income)
Plot3 <- qplot(x=live_arrange_max, y=log(row_total_income + 1), data=Data1) + 
  geom_boxplot() + 
  xlab(label = 'Living Arrangement') + ylab('log(row_total_income)')

Filename.jpg <- paste(PlotPath, 'Plot_row_total_income', '.jpg', sep='')
jpeg(file=Filename.jpg)
plot(Plot3)
dev.off()

## IADL_mx
summary(Data1$IADL_mx)
Plot4 <- qplot(x=live_arrange_max, y=log(IADL_mx + .1), data=Data1) + 
  geom_boxplot() + 
  xlab(label = 'Living Arrangement') + ylab('log(IADL_mx)')

Filename.jpg <- paste(PlotPath, 'Plot_IADL_mx', '.jpg', sep='')
jpeg(file=Filename.jpg)
plot(Plot4)
dev.off()

## avg_IADL
summary(Data1$avg_IADL)
Plot5 <- qplot(x=live_arrange_max, y=log(avg_IADL + .1), data=Data1) + 
  geom_boxplot() + 
  xlab(label = 'Living Arrangement') + ylab('log(avg_IADL)')
# jpeg("Row_Total_Income.jpg")
Plot5
dev.off()

## edu_avg_r
summary(Data1$edu_avg_r)
Plot6 <- qplot(x=live_arrange_max, y=edu_avg_r, data=subset(Data1, edu_avg_r<40)) + 
  geom_boxplot() + 
  xlab(label = 'Living Arrangement') + ylab('edu_avg_r')
# jpeg("Row_Total_Income.jpg")
Plot6
dev.off()

# Data1.1 <- subset(Data1, edu_avg_r < 40)
# Table <- prop.table(table(Data1.1$edu_avg_r,Data1.1$live_arrange_max),1)
# Table.r <- melt(Table, id=rownames(Table))
# names(Table.r)[2] <- 'Living'
# Plot7 <- qplot(x=Var.1, y=value, data=Table.r, color=Living) + 
#   geom_line(size=1.2) + 
#   xlab(label = 'Wealth Quintile') + ylab('Percentage') + 
#   ggtitle('Living arrangement and Wealth quintile')
# Plot7

## adult_hh_mx
summary(Data1$adult_hh_mx)
Plot8 <- qplot(x=live_arrange_max, y=adult_hh_mx, data=Data1) + 
  geom_boxplot() + 
  xlab(label = 'Living Arrangement') + ylab('adult_hh_mx')
# jpeg("Row_Total_Income.jpg")
Plot8
dev.off()

## total_work_adultR
summary(Data1$total_work_adultR)
Plot9 <- qplot(x=live_arrange_max, y=log(total_work_adultR + .1), data=Data1) + 
  geom_boxplot() + 
  xlab(label = 'Living Arrangement') + ylab('log(total_work_adultR)')
# jpeg("Row_Total_Income.jpg")
Plot9
dev.off()
