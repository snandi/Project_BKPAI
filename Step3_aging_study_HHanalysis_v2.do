******
*This do file
*1. works with the BKPAI_MASTER_DATA_CORRECTIONS.dta 
*December 20, 2014
*******/

clear
version 12
set more off
capture log close

set mem 2000m

cd "C:\Users\subharati\Desktop\BKPAI data"

log using INDIVIDUAL_BKPAIdata.log, text replace

sysuse "C:\Users\subharati\Desktop\BKPAI data\BKPAI_MASTER_DATA.dta"

format %19.0g iuid
****generate a variable which counts the total number of elderly in a household*** ACTUALLY WORK WITH THE MASTER DATA 

**Step 1

recode v106 (1=2) (2=1) (3=3) (4=4) (5=5) (6=6), gen (v106r)
label variable v106r "marital status"
label define v106r_i 1 "married" 2 "never married" 3 "living together" 4 "seperated" 5 "divorced" 6 "widowed"
label values v106r v106r_i

gen age01=0
replace age01= 1 if (hv105_01 > 59)

gen age02=0
replace age02= 1 if (hv105_02 > 59)

recode hv105_03 (.= 0)
gen age03=0
replace age03= 1 if (hv105_03 > 59)

recode hv105_04 (.= 0)
gen age04=0
replace age04= 1 if (hv105_04 > 59)

recode hv105_05 (.= 0)
gen age05=0
replace age05= 1 if (hv105_05 > 59)

recode hv105_06 (.= 0)
gen age06=0
replace age06= 1 if (hv105_06 > 59)

recode hv105_07 (.= 0)
gen age07=0
replace age07= 1 if (hv105_07 > 59)

recode hv105_08 (.= 0)
gen age08=0
replace age08= 1 if (hv105_08 > 59)

recode hv105_09 (.= 0)
gen age09=0
replace age09= 1 if (hv105_09 > 59)

recode hv105_10 (.= 0)
gen age10=0
replace age10= 1 if (hv105_10 > 59)

recode hv105_11 (.= 0)
gen age11=0
replace age11= 1 if (hv105_11 > 59)

recode hv105_12 (.= 0)
gen age12=0
replace age12= 1 if (hv105_12 > 59)

recode hv105_13 (.= 0)
gen age13=0
replace age13= 1 if (hv105_13 > 59)

recode hv105_14 (.= 0)
gen age14=0
replace age14= 1 if (hv105_14 > 59)

recode hv105_15 (.= 0)
gen age15=0
replace age15= 1 if (hv105_15 > 59)

recode hv105_16 (.= 0)
gen age16=0
replace age16= 1 if (hv105_16 > 59)

recode hv105_17 (.= 0)
gen age17=0
replace age17= 1 if (hv105_17 > 59)

recode hv105_18 (.= 0)
gen age18=0
replace age18= 1 if (hv105_18 > 59)

recode hv105_19 (.= 0)
gen age19=0
replace age19= 1 if (hv105_19 > 59)

recode hv105_20 (.= 0)
gen age20=0
replace age20= 1 if (hv105_20 > 59)

recode hv105_21 (.= 0)
gen age21=0
replace age21= 1 if (hv105_21 > 59)

recode hv105_22 (.= 0)
gen age22=0
replace age22= 1 if (hv105_22 > 59)

recode hv105_23 (.= 0)
gen age23=0
replace age23= 1 if (hv105_23 > 59)

recode hv105_24 (.= 0)
gen age24=0
replace age24= 1 if (hv105_24 > 59)

recode hv105_25 (.= 0)
gen age25=0
replace age25= 1 if (hv105_25 > 59)

recode hv105_26 (.= 0)
gen age26=0
replace age26= 1 if (hv105_26 > 59)

recode hv105_27 (.= 0)
gen age27=0
replace age27= 1 if (hv105_27 > 59)

******To sum the total number of elderly at home

egen old_hh= rsum (age01 age02 age03 age04 age05 age06 age07 age08 age09 age10 age11 age12 age13 age14 age15 age16 age17 age18 age19 age20 age21 age22 age23 age24 age25 age26 age27)
egen old_hh_mx= max (old_hh), by (uid)
label variable old_hh "total number of eldelry in HH"

***To ascertain relationship 

gen relation1=0
replace relation1= 1 if (hv103_01==1 & hv104_01==1)
replace relation1=2 if (hv103_01==1 & hv104_01==2)
label variable relation1 "relationship type 1"
label define relation1_i 1 "male head" 2 "female head"
label values relation1 relation1_i


gen relation2=0

replace relation2= 1 if (hv103_02==2 & hv104_02==1)
replace relation2=2 if (hv103_02==2 & hv104_02==2)
replace relation2= 3 if (hv103_02==3 & hv104_02==1)
replace relation2=4 if (hv103_02==3 & hv104_02==2)
replace relation2= 5 if (hv103_02==4 & hv104_02==1)
replace relation2=6 if (hv103_02==4 & hv104_02==2)
replace relation2= 7 if (hv103_02==5 & hv104_02==1)
replace relation2=8 if (hv103_02==5 & hv104_02==2)
replace relation2= 9 if (hv103_02==6 & hv104_02==1)
replace relation2=10 if (hv103_02==6 & hv104_02==2)
replace relation2= 11 if (hv103_02==7 & hv104_02==1)
replace relation2=12 if (hv103_02==7 & hv104_02==2)
replace relation2= 13 if (hv103_02==8 & hv104_02==1)
replace relation2=14 if (hv103_02==8 & hv104_02==2)
replace relation2= 15 if (hv103_02==9 & hv104_02==1)
replace relation2=16 if (hv103_02==9 & hv104_02==2)
replace relation2= 17 if (hv103_02==10 & hv104_02==1)
replace relation2=18 if (hv103_02==10 & hv104_02==2)
replace relation2= 19 if (hv103_02==11 & hv104_02==1)
replace relation2=20 if (hv103_02==11 & hv104_02==2)
replace relation2= 21 if (hv103_02==12 & hv104_02==1)
replace relation2=22 if (hv103_02==12 & hv104_02==2)
replace relation2= 23 if (hv103_02==13 & hv104_02==1)
replace relation2=24 if (hv103_02==13 & hv104_02==2)
replace relation2= 25 if (hv103_02==14 & hv104_02==1)
replace relation2=26 if (hv103_02==14 & hv104_02==2)
label variable relation2 "relation2"
label define relation2_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation2 relation2_i


gen relation3=0
replace relation3= 1 if (hv103_03==2 & hv104_03==1)
replace relation3=2 if (hv103_03==2 & hv104_03==2)
replace relation3= 3 if (hv103_03==3 & hv104_03==1)
replace relation3=4 if (hv103_03==3 & hv104_03==2)
replace relation3= 5 if (hv103_03==4 & hv104_03==1)
replace relation3=6 if (hv103_03==4 & hv104_03==2)
replace relation3= 7 if (hv103_03==5 & hv104_03==1)
replace relation3=8 if (hv103_03==5 & hv104_03==2)
replace relation3= 9 if (hv103_03==6 & hv104_03==1)
replace relation3=10 if (hv103_03==6 & hv104_03==2)
replace relation3= 11 if (hv103_03==7 & hv104_03==1)
replace relation3=12 if (hv103_03==7 & hv104_03==2)
replace relation3= 13 if (hv103_03==8 & hv104_03==1)
replace relation3=14 if (hv103_03==8 & hv104_03==2)
replace relation3= 15 if (hv103_03==9 & hv104_03==1)
replace relation3=16 if (hv103_03==9 & hv104_03==2)
replace relation3= 17 if (hv103_03==10 & hv104_03==1)
replace relation3=18 if (hv103_03==10 & hv104_03==2)
replace relation3= 19 if (hv103_03==11 & hv104_03==1)
replace relation3=20 if (hv103_03==11 & hv104_03==2)
replace relation3= 21 if (hv103_03==12 & hv104_03==1)
replace relation3=22 if (hv103_03==12 & hv104_03==2)
replace relation3= 23 if (hv103_03==13 & hv104_03==1)
replace relation3=24 if (hv103_03==13 & hv104_03==2)
replace relation3= 25 if (hv103_03==14 & hv104_03==1)
replace relation3=26 if (hv103_03==14 & hv104_03==2)
label variable relation3 "relation3"
label define relation3_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation3 relation3_i



gen relation4=0
replace relation4= 1 if (hv103_04==2 & hv104_04==1)
replace relation4=2 if (hv103_04==2 & hv104_04==2)
replace relation4= 3 if (hv103_04==3 & hv104_04==1)
replace relation4=4 if (hv103_04==3 & hv104_04==2)
replace relation4= 5 if (hv103_04==4 & hv104_04==1)
replace relation4=6 if (hv103_04==4 & hv104_04==2)
replace relation4= 7 if (hv103_04==5 & hv104_04==1)
replace relation4=8 if (hv103_04==5 & hv104_04==2)
replace relation4= 9 if (hv103_04==6 & hv104_04==1)
replace relation4=10 if (hv103_04==6 & hv104_04==2)
replace relation4= 11 if (hv103_04==7 & hv104_04==1)
replace relation4=12 if (hv103_04==7 & hv104_04==2)
replace relation4= 13 if (hv103_04==8 & hv104_04==1)
replace relation4=14 if (hv103_04==8 & hv104_04==2)
replace relation4= 15 if (hv103_04==9 & hv104_04==1)
replace relation4=16 if (hv103_04==9 & hv104_04==2)
replace relation4= 17 if (hv103_04==10 & hv104_04==1)
replace relation4=18 if (hv103_04==10 & hv104_04==2)
replace relation4= 19 if (hv103_04==11 & hv104_04==1)
replace relation4=20 if (hv103_04==11 & hv104_04==2)
replace relation4= 21 if (hv103_04==12 & hv104_04==1)
replace relation4=22 if (hv103_04==12 & hv104_04==2)
replace relation4= 23 if (hv103_04==13 & hv104_04==1)
replace relation4=24 if (hv103_04==13 & hv104_04==2)
replace relation4= 25 if (hv103_04==14 & hv104_04==1)
replace relation4=26 if (hv103_04==14 & hv104_04==2)
label variable relation4 "relation4"
label define relation4_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation4 relation4_i

gen relation5=0
replace relation5= 1 if (hv103_05==2 & hv104_05==1)
replace relation5=2 if (hv103_05==2 & hv104_05==2)
replace relation5= 3 if (hv103_05==3 & hv104_05==1)
replace relation5=4 if (hv103_05==3 & hv104_05==2)
replace relation5= 5 if (hv103_05==4 & hv104_05==1)
replace relation5=6 if (hv103_05==4 & hv104_05==2)
replace relation5= 7 if (hv103_05==5 & hv104_05==1)
replace relation5=8 if (hv103_05==5 & hv104_05==2)
replace relation5= 9 if (hv103_05==6 & hv104_05==1)
replace relation5=10 if (hv103_05==6 & hv104_05==2)
replace relation5= 11 if (hv103_05==7 & hv104_05==1)
replace relation5=12 if (hv103_05==7 & hv104_05==2)
replace relation5= 13 if (hv103_05==8 & hv104_05==1)
replace relation5=14 if (hv103_05==8 & hv104_05==2)
replace relation5= 15 if (hv103_05==9 & hv104_05==1)
replace relation5=16 if (hv103_05==9 & hv104_05==2)
replace relation5= 17 if (hv103_05==10 & hv104_05==1)
replace relation5=18 if (hv103_05==10 & hv104_05==2)
replace relation5= 19 if (hv103_05==11 & hv104_05==1)
replace relation5=20 if (hv103_05==11 & hv104_05==2)
replace relation5= 21 if (hv103_05==12 & hv104_05==1)
replace relation5=22 if (hv103_05==12 & hv104_05==2)
replace relation5= 23 if (hv103_05==13 & hv104_05==1)
replace relation5=24 if (hv103_05==13 & hv104_05==2)
replace relation5= 25 if (hv103_05==14 & hv104_05==1)
replace relation5=26 if (hv103_05==14 & hv104_05==2)
label variable relation5 "relation5"
label define relation5_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation5 relation5_i

gen relation6=0
replace relation6= 1 if (hv103_06==2 & hv104_06==1)
replace relation6=2 if (hv103_06==2 & hv104_06==2)
replace relation6= 3 if (hv103_06==3 & hv104_06==1)
replace relation6=4 if (hv103_06==3 & hv104_06==2)
replace relation6= 5 if (hv103_06==4 & hv104_06==1)
replace relation6=6 if (hv103_06==4 & hv104_06==2)
replace relation6= 7 if (hv103_06==5 & hv104_06==1)
replace relation6=8 if (hv103_06==5 & hv104_06==2)
replace relation6= 9 if (hv103_06==6 & hv104_06==1)
replace relation6=10 if (hv103_06==6 & hv104_06==2)
replace relation6= 11 if (hv103_06==7 & hv104_06==1)
replace relation6=12 if (hv103_06==7 & hv104_06==2)
replace relation6= 13 if (hv103_06==8 & hv104_06==1)
replace relation6=14 if (hv103_06==8 & hv104_06==2)
replace relation6= 15 if (hv103_06==9 & hv104_06==1)
replace relation6=16 if (hv103_06==9 & hv104_06==2)
replace relation6= 17 if (hv103_06==10 & hv104_06==1)
replace relation6=18 if (hv103_06==10 & hv104_06==2)
replace relation6= 19 if (hv103_06==11 & hv104_06==1)
replace relation6=20 if (hv103_06==11 & hv104_06==2)
replace relation6= 21 if (hv103_06==12 & hv104_06==1)
replace relation6=22 if (hv103_06==12 & hv104_06==2)
replace relation6= 23 if (hv103_06==13 & hv104_06==1)
replace relation6=24 if (hv103_06==13 & hv104_06==2)
replace relation6= 25 if (hv103_06==14 & hv104_06==1)
replace relation6=26 if (hv103_06==14 & hv104_06==2)
label variable relation6 "relation6"
label define relation6_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation6 relation6_i



gen relation7=0
replace relation7= 1 if (hv103_07==2 & hv104_07==1)
replace relation7=2 if (hv103_07==2 & hv104_07==2)
replace relation7= 3 if (hv103_07==3 & hv104_07==1)
replace relation7=4 if (hv103_07==3 & hv104_07==2)
replace relation7= 5 if (hv103_07==4 & hv104_07==1)
replace relation7=6 if (hv103_07==4 & hv104_07==2)
replace relation7= 7 if (hv103_07==5 & hv104_07==1)
replace relation7=8 if (hv103_07==5 & hv104_07==2)
replace relation7= 9 if (hv103_07==6 & hv104_07==1)
replace relation7=10 if (hv103_07==6 & hv104_07==2)
replace relation7= 11 if (hv103_07==7 & hv104_07==1)
replace relation7=12 if (hv103_07==7 & hv104_07==2)
replace relation7= 13 if (hv103_07==8 & hv104_07==1)
replace relation7=14 if (hv103_07==8 & hv104_07==2)
replace relation7= 15 if (hv103_07==9 & hv104_07==1)
replace relation7=16 if (hv103_07==9 & hv104_07==2)
replace relation7= 17 if (hv103_07==10 & hv104_07==1)
replace relation7=18 if (hv103_07==10 & hv104_07==2)
replace relation7= 19 if (hv103_07==11 & hv104_07==1)
replace relation7=20 if (hv103_07==11 & hv104_07==2)
replace relation7= 21 if (hv103_07==12 & hv104_07==1)
replace relation7=22 if (hv103_07==12 & hv104_07==2)
replace relation7= 23 if (hv103_07==13 & hv104_07==1)
replace relation7=24 if (hv103_07==13 & hv104_07==2)
replace relation7= 25 if (hv103_07==14 & hv104_07==1)
replace relation7=26 if (hv103_07==14 & hv104_07==2)
label variable relation7 "relation7"
label define relation7_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation7 relation7_i


gen relation8=0
replace relation8= 1 if (hv103_08==2 & hv104_08==1)
replace relation8=2 if (hv103_08==2 & hv104_08==2)
replace relation8= 3 if (hv103_08==3 & hv104_08==1)
replace relation8=4 if (hv103_08==3 & hv104_08==2)
replace relation8= 5 if (hv103_08==4 & hv104_08==1)
replace relation8=6 if (hv103_08==4 & hv104_08==2)
replace relation8= 7 if (hv103_08==5 & hv104_08==1)
replace relation8=8 if (hv103_08==5 & hv104_08==2)
replace relation8= 9 if (hv103_08==6 & hv104_08==1)
replace relation8=10 if (hv103_08==6 & hv104_08==2)
replace relation8= 11 if (hv103_08==7 & hv104_08==1)
replace relation8=12 if (hv103_08==7 & hv104_08==2)
replace relation8= 13 if (hv103_08==8 & hv104_08==1)
replace relation8=14 if (hv103_08==8 & hv104_08==2)
replace relation8= 15 if (hv103_08==9 & hv104_08==1)
replace relation8=16 if (hv103_08==9 & hv104_08==2)
replace relation8= 17 if (hv103_08==10 & hv104_08==1)
replace relation8=18 if (hv103_08==10 & hv104_08==2)
replace relation8= 19 if (hv103_08==11 & hv104_08==1)
replace relation8=20 if (hv103_08==11 & hv104_08==2)
replace relation8= 21 if (hv103_08==12 & hv104_08==1)
replace relation8=22 if (hv103_08==12 & hv104_08==2)
replace relation8= 23 if (hv103_08==13 & hv104_08==1)
replace relation8=24 if (hv103_08==13 & hv104_08==2)
replace relation8= 25 if (hv103_08==14 & hv104_08==1)
replace relation8=26 if (hv103_08==14 & hv104_08==2)
label variable relation8 "relation8"
label define relation8_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation8 relation8_i


gen relation9=0
replace relation9= 1 if (hv103_09==2 & hv104_09==1)
replace relation9=2 if (hv103_09==2 & hv104_09==2)
replace relation9= 3 if (hv103_09==3 & hv104_09==1)
replace relation9=4 if (hv103_09==3 & hv104_09==2)
replace relation9= 5 if (hv103_09==4 & hv104_09==1)
replace relation9=6 if (hv103_09==4 & hv104_09==2)
replace relation9= 7 if (hv103_09==5 & hv104_09==1)
replace relation9=8 if (hv103_09==5 & hv104_09==2)
replace relation9= 9 if (hv103_09==6 & hv104_09==1)
replace relation9=10 if (hv103_09==6 & hv104_09==2)
replace relation9= 11 if (hv103_09==7 & hv104_09==1)
replace relation9=12 if (hv103_09==7 & hv104_09==2)
replace relation9= 13 if (hv103_09==8 & hv104_09==1)
replace relation9=14 if (hv103_09==8 & hv104_09==2)
replace relation9= 15 if (hv103_09==9 & hv104_09==1)
replace relation9=16 if (hv103_09==9 & hv104_09==2)
replace relation9= 17 if (hv103_09==10 & hv104_09==1)
replace relation9=18 if (hv103_09==10 & hv104_09==2)
replace relation9= 19 if (hv103_09==11 & hv104_09==1)
replace relation9=20 if (hv103_09==11 & hv104_09==2)
replace relation9= 21 if (hv103_09==12 & hv104_09==1)
replace relation9=22 if (hv103_09==12 & hv104_09==2)
replace relation9= 23 if (hv103_09==13 & hv104_09==1)
replace relation9=24 if (hv103_09==13 & hv104_09==2)
replace relation9= 25 if (hv103_09==14 & hv104_09==1)
replace relation9=26 if (hv103_09==14 & hv104_09==2)
label variable relation9 "relation9"
label define relation9_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation9 relation9_i

gen relation10=0
replace relation10= 1 if (hv103_10==2 & hv104_10==1)
replace relation10=2 if (hv103_10==2 & hv104_10==2)
replace relation10= 3 if (hv103_10==3 & hv104_10==1)
replace relation10=4 if (hv103_10==3 & hv104_10==2)
replace relation10= 5 if (hv103_10==4 & hv104_10==1)
replace relation10=6 if (hv103_10==4 & hv104_10==2)
replace relation10= 7 if (hv103_10==5 & hv104_10==1)
replace relation10=8 if (hv103_10==5 & hv104_10==2)
replace relation10= 9 if (hv103_10==6 & hv104_10==1)
replace relation10=10 if (hv103_10==6 & hv104_10==2)
replace relation10= 11 if (hv103_10==7 & hv104_10==1)
replace relation10=12 if (hv103_10==7 & hv104_10==2)
replace relation10= 13 if (hv103_10==8 & hv104_10==1)
replace relation10=14 if (hv103_10==8 & hv104_10==2)
replace relation10= 15 if (hv103_10==9 & hv104_10==1)
replace relation10=16 if (hv103_10==9 & hv104_10==2)
replace relation10= 17 if (hv103_10==10 & hv104_10==1)
replace relation10=18 if (hv103_10==10 & hv104_10==2)
replace relation10= 19 if (hv103_10==11 & hv104_10==1)
replace relation10=20 if (hv103_10==11 & hv104_10==2)
replace relation10= 21 if (hv103_10==12 & hv104_10==1)
replace relation10=22 if (hv103_10==12 & hv104_10==2)
replace relation10= 23 if (hv103_10==13 & hv104_10==1)
replace relation10=24 if (hv103_10==13 & hv104_10==2)
replace relation10= 25 if (hv103_10==14 & hv104_10==1)
replace relation10=26 if (hv103_10==14 & hv104_10==2)
label variable relation10 "relation10"
label define relation10_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation10 relation10_i

gen relation11=0
replace relation11= 1 if (hv103_11==2 & hv104_11==1)
replace relation11=2 if (hv103_11==2 & hv104_11==2)
replace relation11= 3 if (hv103_11==3 & hv104_11==1)
replace relation11=4 if (hv103_11==3 & hv104_11==2)
replace relation11= 5 if (hv103_11==4 & hv104_11==1)
replace relation11=6 if (hv103_11==4 & hv104_11==2)
replace relation11= 7 if (hv103_11==5 & hv104_11==1)
replace relation11=8 if (hv103_11==5 & hv104_11==2)
replace relation11= 9 if (hv103_11==6 & hv104_11==1)
replace relation11=10 if (hv103_11==6 & hv104_11==2)
replace relation11= 11 if (hv103_11==7 & hv104_11==1)
replace relation11=12 if (hv103_11==7 & hv104_11==2)
replace relation11= 13 if (hv103_11==8 & hv104_11==1)
replace relation11=14 if (hv103_11==8 & hv104_11==2)
replace relation11= 15 if (hv103_11==9 & hv104_11==1)
replace relation11=16 if (hv103_11==9 & hv104_11==2)
replace relation11= 17 if (hv103_11==10 & hv104_11==1)
replace relation11=18 if (hv103_11==10 & hv104_11==2)
replace relation11= 19 if (hv103_11==11 & hv104_11==1)
replace relation11=20 if (hv103_11==11 & hv104_11==2)
replace relation11= 21 if (hv103_11==12 & hv104_11==1)
replace relation11=22 if (hv103_11==12 & hv104_11==2)
replace relation11= 23 if (hv103_11==13 & hv104_11==1)
replace relation11=24 if (hv103_11==13 & hv104_11==2)
replace relation11= 25 if (hv103_11==14 & hv104_11==1)
replace relation11=26 if (hv103_11==14 & hv104_11==2)
label variable relation11 "relation11"
label define relation11_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation11 relation11_i

gen relation12=0
replace relation12= 1 if (hv103_12==2 & hv104_12==1)
replace relation12=2 if (hv103_12==2 & hv104_12==2)
replace relation12= 3 if (hv103_12==3 & hv104_12==1)
replace relation12=4 if (hv103_12==3 & hv104_12==2)
replace relation12= 5 if (hv103_12==4 & hv104_12==1)
replace relation12=6 if (hv103_12==4 & hv104_12==2)
replace relation12= 7 if (hv103_12==5 & hv104_12==1)
replace relation12=8 if (hv103_12==5 & hv104_12==2)
replace relation12= 9 if (hv103_12==6 & hv104_12==1)
replace relation12=10 if (hv103_12==6 & hv104_12==2)
replace relation12= 11 if (hv103_12==7 & hv104_12==1)
replace relation12=12 if (hv103_12==7 & hv104_12==2)
replace relation12= 13 if (hv103_12==8 & hv104_12==1)
replace relation12=14 if (hv103_12==8 & hv104_12==2)
replace relation12= 15 if (hv103_12==9 & hv104_12==1)
replace relation12=16 if (hv103_12==9 & hv104_12==2)
replace relation12= 17 if (hv103_12==10 & hv104_12==1)
replace relation12=18 if (hv103_12==10 & hv104_12==2)
replace relation12= 19 if (hv103_12==11 & hv104_12==1)
replace relation12=20 if (hv103_12==11 & hv104_12==2)
replace relation12= 21 if (hv103_12==12 & hv104_12==1)
replace relation12=22 if (hv103_12==12 & hv104_12==2)
replace relation12= 23 if (hv103_12==13 & hv104_12==1)
replace relation12=24 if (hv103_12==13 & hv104_12==2)
replace relation12= 25 if (hv103_12==14 & hv104_12==1)
replace relation12=26 if (hv103_12==14 & hv104_12==2)
label variable relation12 "relation12"
label define relation12_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation12 relation12_i


gen relation13=0
replace relation13= 1 if (hv103_13==2 & hv104_13==1)
replace relation13=2 if (hv103_13==2 & hv104_13==2)
replace relation13= 3 if (hv103_13==3 & hv104_13==1)
replace relation13=4 if (hv103_13==3 & hv104_13==2)
replace relation13= 5 if (hv103_13==4 & hv104_13==1)
replace relation13=6 if (hv103_13==4 & hv104_13==2)
replace relation13= 7 if (hv103_13==5 & hv104_13==1)
replace relation13=8 if (hv103_13==5 & hv104_13==2)
replace relation13= 9 if (hv103_13==6 & hv104_13==1)
replace relation13=10 if (hv103_13==6 & hv104_13==2)
replace relation13= 11 if (hv103_13==7 & hv104_13==1)
replace relation13=12 if (hv103_13==7 & hv104_13==2)
replace relation13= 13 if (hv103_13==8 & hv104_13==1)
replace relation13=14 if (hv103_13==8 & hv104_13==2)
replace relation13= 15 if (hv103_13==9 & hv104_13==1)
replace relation13=16 if (hv103_13==9 & hv104_13==2)
replace relation13= 17 if (hv103_13==10 & hv104_13==1)
replace relation13=18 if (hv103_13==10 & hv104_13==2)
replace relation13= 19 if (hv103_13==11 & hv104_13==1)
replace relation13=20 if (hv103_13==11 & hv104_13==2)
replace relation13= 21 if (hv103_13==12 & hv104_13==1)
replace relation13=22 if (hv103_13==12 & hv104_13==2)
replace relation13= 23 if (hv103_13==13 & hv104_13==1)
replace relation13=24 if (hv103_13==13 & hv104_13==2)
replace relation13= 25 if (hv103_13==14 & hv104_13==1)
replace relation13=26 if (hv103_13==14 & hv104_13==2)
label variable relation13 "relation13"
label define relation13_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation13 relation13_i


gen relation14=0
replace relation14= 1 if (hv103_14==2 & hv104_14==1)
replace relation14=2 if (hv103_14==2 & hv104_14==2)
replace relation14= 3 if (hv103_14==3 & hv104_14==1)
replace relation14=4 if (hv103_14==3 & hv104_14==2)
replace relation14= 5 if (hv103_14==4 & hv104_14==1)
replace relation14=6 if (hv103_14==4 & hv104_14==2)
replace relation14= 7 if (hv103_14==5 & hv104_14==1)
replace relation14=8 if (hv103_14==5 & hv104_14==2)
replace relation14= 9 if (hv103_14==6 & hv104_14==1)
replace relation14=10 if (hv103_14==6 & hv104_14==2)
replace relation14= 11 if (hv103_14==7 & hv104_14==1)
replace relation14=12 if (hv103_14==7 & hv104_14==2)
replace relation14= 13 if (hv103_14==8 & hv104_14==1)
replace relation14=14 if (hv103_14==8 & hv104_14==2)
replace relation14= 15 if (hv103_14==9 & hv104_14==1)
replace relation14=16 if (hv103_14==9 & hv104_14==2)
replace relation14= 17 if (hv103_14==10 & hv104_14==1)
replace relation14=18 if (hv103_14==10 & hv104_14==2)
replace relation14= 19 if (hv103_14==11 & hv104_14==1)
replace relation14=20 if (hv103_14==11 & hv104_14==2)
replace relation14= 21 if (hv103_14==12 & hv104_14==1)
replace relation14=22 if (hv103_14==12 & hv104_14==2)
replace relation14= 23 if (hv103_14==13 & hv104_14==1)
replace relation14=24 if (hv103_14==13 & hv104_14==2)
replace relation14= 25 if (hv103_14==14 & hv104_14==1)
replace relation14=26 if (hv103_14==14 & hv104_14==2)
label variable relation14 "relation14"
label define relation14_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation14 relation14_i

gen relation15=0
replace relation15= 1 if (hv103_15==2 & hv104_15==1)
replace relation15=2 if (hv103_15==2 & hv104_15==2)
replace relation15= 3 if (hv103_15==3 & hv104_15==1)
replace relation15=4 if (hv103_15==3 & hv104_15==2)
replace relation15= 5 if (hv103_15==4 & hv104_15==1)
replace relation15=6 if (hv103_15==4 & hv104_15==2)
replace relation15= 7 if (hv103_15==5 & hv104_15==1)
replace relation15=8 if (hv103_15==5 & hv104_15==2)
replace relation15= 9 if (hv103_15==6 & hv104_15==1)
replace relation15=10 if (hv103_15==6 & hv104_15==2)
replace relation15= 11 if (hv103_15==7 & hv104_15==1)
replace relation15=12 if (hv103_15==7 & hv104_15==2)
replace relation15= 13 if (hv103_15==8 & hv104_15==1)
replace relation15=14 if (hv103_15==8 & hv104_15==2)
replace relation15= 15 if (hv103_15==9 & hv104_15==1)
replace relation15=16 if (hv103_15==9 & hv104_15==2)
replace relation15= 17 if (hv103_15==10 & hv104_15==1)
replace relation15=18 if (hv103_15==10 & hv104_15==2)
replace relation15= 19 if (hv103_15==11 & hv104_15==1)
replace relation15=20 if (hv103_15==11 & hv104_15==2)
replace relation15= 21 if (hv103_15==12 & hv104_15==1)
replace relation15=22 if (hv103_15==12 & hv104_15==2)
replace relation15= 23 if (hv103_15==13 & hv104_15==1)
replace relation15=24 if (hv103_15==13 & hv104_15==2)
replace relation15= 25 if (hv103_15==14 & hv104_15==1)
replace relation15=26 if (hv103_15==14 & hv104_15==2)
label variable relation15 "relation15"
label define relation15_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation15 relation15_i

gen relation16=0
replace relation16= 1 if (hv103_16==2 & hv104_16==1)
replace relation16=2 if (hv103_16==2 & hv104_16==2)
replace relation16= 3 if (hv103_16==3 & hv104_16==1)
replace relation16=4 if (hv103_16==3 & hv104_16==2)
replace relation16= 5 if (hv103_16==4 & hv104_16==1)
replace relation16=6 if (hv103_16==4 & hv104_16==2)
replace relation16= 7 if (hv103_16==5 & hv104_16==1)
replace relation16=8 if (hv103_16==5 & hv104_16==2)
replace relation16= 9 if (hv103_16==6 & hv104_16==1)
replace relation16=10 if (hv103_16==6 & hv104_16==2)
replace relation16= 11 if (hv103_16==7 & hv104_16==1)
replace relation16=12 if (hv103_16==7 & hv104_16==2)
replace relation16= 13 if (hv103_16==8 & hv104_16==1)
replace relation16=14 if (hv103_16==8 & hv104_16==2)
replace relation16= 15 if (hv103_16==9 & hv104_16==1)
replace relation16=16 if (hv103_16==9 & hv104_16==2)
replace relation16= 17 if (hv103_16==10 & hv104_16==1)
replace relation16=18 if (hv103_16==10 & hv104_16==2)
replace relation16= 19 if (hv103_16==11 & hv104_16==1)
replace relation16=20 if (hv103_16==11 & hv104_16==2)
replace relation16= 21 if (hv103_16==12 & hv104_16==1)
replace relation16=22 if (hv103_16==12 & hv104_16==2)
replace relation16= 23 if (hv103_16==13 & hv104_16==1)
replace relation16=24 if (hv103_16==13 & hv104_16==2)
replace relation16= 25 if (hv103_16==14 & hv104_16==1)
replace relation16=26 if (hv103_16==14 & hv104_16==2)
label variable relation16 "relation16"
label define relation16_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation16 relation16_i


gen relation17=0
replace relation17= 1 if (hv103_17==2 & hv104_17==1)
replace relation17=2 if (hv103_17==2 & hv104_17==2)
replace relation17= 3 if (hv103_17==3 & hv104_17==1)
replace relation17=4 if (hv103_17==3 & hv104_17==2)
replace relation17= 5 if (hv103_17==4 & hv104_17==1)
replace relation17=6 if (hv103_17==4 & hv104_17==2)
replace relation17= 7 if (hv103_17==5 & hv104_17==1)
replace relation17=8 if (hv103_17==5 & hv104_17==2)
replace relation17= 9 if (hv103_17==6 & hv104_17==1)
replace relation17=10 if (hv103_17==6 & hv104_17==2)
replace relation17= 11 if (hv103_17==7 & hv104_17==1)
replace relation17=12 if (hv103_17==7 & hv104_17==2)
replace relation17= 13 if (hv103_17==8 & hv104_17==1)
replace relation17=14 if (hv103_17==8 & hv104_17==2)
replace relation17= 15 if (hv103_17==9 & hv104_17==1)
replace relation17=16 if (hv103_17==9 & hv104_17==2)
replace relation17= 17 if (hv103_17==10 & hv104_17==1)
replace relation17=18 if (hv103_17==10 & hv104_17==2)
replace relation17= 19 if (hv103_17==11 & hv104_17==1)
replace relation17=20 if (hv103_17==11 & hv104_17==2)
replace relation17= 21 if (hv103_17==12 & hv104_17==1)
replace relation17=22 if (hv103_17==12 & hv104_17==2)
replace relation17= 23 if (hv103_17==13 & hv104_17==1)
replace relation17=24 if (hv103_17==13 & hv104_17==2)
replace relation17= 25 if (hv103_17==14 & hv104_17==1)
replace relation17=26 if (hv103_17==14 & hv104_17==2)
label variable relation17 "relation17"
label define relation17_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation17 relation17_i


gen relation18=0
replace relation18= 1 if (hv103_18==2 & hv104_18==1)
replace relation18=2 if (hv103_18==2 & hv104_18==2)
replace relation18= 3 if (hv103_18==3 & hv104_18==1)
replace relation18=4 if (hv103_18==3 & hv104_18==2)
replace relation18= 5 if (hv103_18==4 & hv104_18==1)
replace relation18=6 if (hv103_18==4 & hv104_18==2)
replace relation18= 7 if (hv103_18==5 & hv104_18==1)
replace relation18=8 if (hv103_18==5 & hv104_18==2)
replace relation18= 9 if (hv103_18==6 & hv104_18==1)
replace relation18=10 if (hv103_18==6 & hv104_18==2)
replace relation18= 11 if (hv103_18==7 & hv104_18==1)
replace relation18=12 if (hv103_18==7 & hv104_18==2)
replace relation18= 13 if (hv103_18==8 & hv104_18==1)
replace relation18=14 if (hv103_18==8 & hv104_18==2)
replace relation18= 15 if (hv103_18==9 & hv104_18==1)
replace relation18=16 if (hv103_18==9 & hv104_18==2)
replace relation18= 17 if (hv103_18==10 & hv104_18==1)
replace relation18=18 if (hv103_18==10 & hv104_18==2)
replace relation18= 19 if (hv103_18==11 & hv104_18==1)
replace relation18=20 if (hv103_18==11 & hv104_18==2)
replace relation18= 21 if (hv103_18==12 & hv104_18==1)
replace relation18=22 if (hv103_18==12 & hv104_18==2)
replace relation18= 23 if (hv103_18==13 & hv104_18==1)
replace relation18=24 if (hv103_18==13 & hv104_18==2)
replace relation18= 25 if (hv103_18==14 & hv104_18==1)
replace relation18=26 if (hv103_18==14 & hv104_18==2)
label variable relation18 "relation18"
label define relation18_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation18 relation18_i

gen relation19=0
replace relation19= 1 if (hv103_19==2 & hv104_19==1)
replace relation19=2 if (hv103_19==2 & hv104_19==2)
replace relation19= 3 if (hv103_19==3 & hv104_19==1)
replace relation19=4 if (hv103_19==3 & hv104_19==2)
replace relation19= 5 if (hv103_19==4 & hv104_19==1)
replace relation19=6 if (hv103_19==4 & hv104_19==2)
replace relation19= 7 if (hv103_19==5 & hv104_19==1)
replace relation19=8 if (hv103_19==5 & hv104_19==2)
replace relation19= 9 if (hv103_19==6 & hv104_19==1)
replace relation19=10 if (hv103_19==6 & hv104_19==2)
replace relation19= 11 if (hv103_19==7 & hv104_19==1)
replace relation19=12 if (hv103_19==7 & hv104_19==2)
replace relation19= 13 if (hv103_19==8 & hv104_19==1)
replace relation19=14 if (hv103_19==8 & hv104_19==2)
replace relation19= 15 if (hv103_19==9 & hv104_19==1)
replace relation19=16 if (hv103_19==9 & hv104_19==2)
replace relation19= 17 if (hv103_19==10 & hv104_19==1)
replace relation19=18 if (hv103_19==10 & hv104_19==2)
replace relation19= 19 if (hv103_19==11 & hv104_19==1)
replace relation19=20 if (hv103_19==11 & hv104_19==2)
replace relation19= 21 if (hv103_19==12 & hv104_19==1)
replace relation19=22 if (hv103_19==12 & hv104_19==2)
replace relation19= 23 if (hv103_19==13 & hv104_19==1)
replace relation19=24 if (hv103_19==13 & hv104_19==2)
replace relation19= 25 if (hv103_19==14 & hv104_19==1)
replace relation19=26 if (hv103_19==14 & hv104_19==2)
label variable relation19 "relation19"
label define relation19_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation19 relation19_i

gen relation20=0
replace relation20= 1 if (hv103_20==2 & hv104_20==1)
replace relation20=2 if (hv103_20==2 & hv104_20==2)
replace relation20= 3 if (hv103_20==3 & hv104_20==1)
replace relation20=4 if (hv103_20==3 & hv104_20==2)
replace relation20= 5 if (hv103_20==4 & hv104_20==1)
replace relation20=6 if (hv103_20==4 & hv104_20==2)
replace relation20= 7 if (hv103_20==5 & hv104_20==1)
replace relation20=8 if (hv103_20==5 & hv104_20==2)
replace relation20= 9 if (hv103_20==6 & hv104_20==1)
replace relation20=10 if (hv103_20==6 & hv104_20==2)
replace relation20= 11 if (hv103_20==7 & hv104_20==1)
replace relation20=12 if (hv103_20==7 & hv104_20==2)
replace relation20= 13 if (hv103_20==8 & hv104_20==1)
replace relation20=14 if (hv103_20==8 & hv104_20==2)
replace relation20= 15 if (hv103_20==9 & hv104_20==1)
replace relation20=16 if (hv103_20==9 & hv104_20==2)
replace relation20= 17 if (hv103_20==10 & hv104_20==1)
replace relation20=18 if (hv103_20==10 & hv104_20==2)
replace relation20= 19 if (hv103_20==11 & hv104_20==1)
replace relation20=20 if (hv103_20==11 & hv104_20==2)
replace relation20= 21 if (hv103_20==12 & hv104_20==1)
replace relation20=22 if (hv103_20==12 & hv104_20==2)
replace relation20= 23 if (hv103_20==13 & hv104_20==1)
replace relation20=24 if (hv103_20==13 & hv104_20==2)
replace relation20= 25 if (hv103_20==14 & hv104_20==1)
replace relation20=26 if (hv103_20==14 & hv104_20==2)
label variable relation20 "relation20"
label define relation20_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation20 relation20_i

gen relation21=0
replace relation21= 1 if (hv103_21==2 & hv104_21==1)
replace relation21=2 if (hv103_21==2 & hv104_21==2)
replace relation21= 3 if (hv103_21==3 & hv104_21==1)
replace relation21=4 if (hv103_21==3 & hv104_21==2)
replace relation21= 5 if (hv103_21==4 & hv104_21==1)
replace relation21=6 if (hv103_21==4 & hv104_21==2)
replace relation21= 7 if (hv103_21==5 & hv104_21==1)
replace relation21=8 if (hv103_21==5 & hv104_21==2)
replace relation21= 9 if (hv103_21==6 & hv104_21==1)
replace relation21=10 if (hv103_21==6 & hv104_21==2)
replace relation21= 11 if (hv103_21==7 & hv104_21==1)
replace relation21=12 if (hv103_21==7 & hv104_21==2)
replace relation21= 13 if (hv103_21==8 & hv104_21==1)
replace relation21=14 if (hv103_21==8 & hv104_21==2)
replace relation21= 15 if (hv103_21==9 & hv104_21==1)
replace relation21=16 if (hv103_21==9 & hv104_21==2)
replace relation21= 17 if (hv103_21==10 & hv104_21==1)
replace relation21=18 if (hv103_21==10 & hv104_21==2)
replace relation21= 19 if (hv103_21==11 & hv104_21==1)
replace relation21=20 if (hv103_21==11 & hv104_21==2)
replace relation21= 21 if (hv103_21==12 & hv104_21==1)
replace relation21=22 if (hv103_21==12 & hv104_21==2)
replace relation21= 23 if (hv103_21==13 & hv104_21==1)
replace relation21=24 if (hv103_21==13 & hv104_21==2)
replace relation21= 25 if (hv103_21==14 & hv104_21==1)
replace relation21=26 if (hv103_21==14 & hv104_21==2)
label variable relation21 "relation21"
label define relation21_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation21 relation21_i


gen relation22=0
replace relation22= 1 if (hv103_22==2 & hv104_22==1)
replace relation22=2 if (hv103_22==2 & hv104_22==2)
replace relation22= 3 if (hv103_22==3 & hv104_22==1)
replace relation22=4 if (hv103_22==3 & hv104_22==2)
replace relation22= 5 if (hv103_22==4 & hv104_22==1)
replace relation22=6 if (hv103_22==4 & hv104_22==2)
replace relation22= 7 if (hv103_22==5 & hv104_22==1)
replace relation22=8 if (hv103_22==5 & hv104_22==2)
replace relation22= 9 if (hv103_22==6 & hv104_22==1)
replace relation22=10 if (hv103_22==6 & hv104_22==2)
replace relation22= 11 if (hv103_22==7 & hv104_22==1)
replace relation22=12 if (hv103_22==7 & hv104_22==2)
replace relation22= 13 if (hv103_22==8 & hv104_22==1)
replace relation22=14 if (hv103_22==8 & hv104_22==2)
replace relation22= 15 if (hv103_22==9 & hv104_22==1)
replace relation22=16 if (hv103_22==9 & hv104_22==2)
replace relation22= 17 if (hv103_22==10 & hv104_22==1)
replace relation22=18 if (hv103_22==10 & hv104_22==2)
replace relation22= 19 if (hv103_22==11 & hv104_22==1)
replace relation22=20 if (hv103_22==11 & hv104_22==2)
replace relation22= 21 if (hv103_22==12 & hv104_22==1)
replace relation22=22 if (hv103_22==12 & hv104_22==2)
replace relation22= 23 if (hv103_22==13 & hv104_22==1)
replace relation22=24 if (hv103_22==13 & hv104_22==2)
replace relation22= 25 if (hv103_22==14 & hv104_22==1)
replace relation22=26 if (hv103_22==14 & hv104_22==2)
label variable relation22 "relation22"
label define relation22_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation22 relation22_i

gen relation23=0
replace relation23= 1 if (hv103_23==2 & hv104_23==1)
replace relation23=2 if (hv103_23==2 & hv104_23==2)
replace relation23= 3 if (hv103_23==3 & hv104_23==1)
replace relation23=4 if (hv103_23==3 & hv104_23==2)
replace relation23= 5 if (hv103_23==4 & hv104_23==1)
replace relation23=6 if (hv103_23==4 & hv104_23==2)
replace relation23= 7 if (hv103_23==5 & hv104_23==1)
replace relation23=8 if (hv103_23==5 & hv104_23==2)
replace relation23= 9 if (hv103_23==6 & hv104_23==1)
replace relation23=10 if (hv103_23==6 & hv104_23==2)
replace relation23= 11 if (hv103_23==7 & hv104_23==1)
replace relation23=12 if (hv103_23==7 & hv104_23==2)
replace relation23= 13 if (hv103_23==8 & hv104_23==1)
replace relation23=14 if (hv103_23==8 & hv104_23==2)
replace relation23= 15 if (hv103_23==9 & hv104_23==1)
replace relation23=16 if (hv103_23==9 & hv104_23==2)
replace relation23= 17 if (hv103_23==10 & hv104_23==1)
replace relation23=18 if (hv103_23==10 & hv104_23==2)
replace relation23= 19 if (hv103_23==11 & hv104_23==1)
replace relation23=20 if (hv103_23==11 & hv104_23==2)
replace relation23= 21 if (hv103_23==12 & hv104_23==1)
replace relation23=22 if (hv103_23==12 & hv104_23==2)
replace relation23= 23 if (hv103_23==13 & hv104_23==1)
replace relation23=24 if (hv103_23==13 & hv104_23==2)
replace relation23= 25 if (hv103_23==14 & hv104_23==1)
replace relation23=26 if (hv103_23==14 & hv104_23==2)
label variable relation23 "relation23"
label define relation23_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation23 relation23_i


gen relation24=0
replace relation24= 1 if (hv103_24==2 & hv104_24==1)
replace relation24=2 if (hv103_24==2 & hv104_24==2)
replace relation24= 3 if (hv103_24==3 & hv104_24==1)
replace relation24=4 if (hv103_24==3 & hv104_24==2)
replace relation24= 5 if (hv103_24==4 & hv104_24==1)
replace relation24=6 if (hv103_24==4 & hv104_24==2)
replace relation24= 7 if (hv103_24==5 & hv104_24==1)
replace relation24=8 if (hv103_24==5 & hv104_24==2)
replace relation24= 9 if (hv103_24==6 & hv104_24==1)
replace relation24=10 if (hv103_24==6 & hv104_24==2)
replace relation24= 11 if (hv103_24==7 & hv104_24==1)
replace relation24=12 if (hv103_24==7 & hv104_24==2)
replace relation24= 13 if (hv103_24==8 & hv104_24==1)
replace relation24=14 if (hv103_24==8 & hv104_24==2)
replace relation24= 15 if (hv103_24==9 & hv104_24==1)
replace relation24=16 if (hv103_24==9 & hv104_24==2)
replace relation24= 17 if (hv103_24==10 & hv104_24==1)
replace relation24=18 if (hv103_24==10 & hv104_24==2)
replace relation24= 19 if (hv103_24==11 & hv104_24==1)
replace relation24=20 if (hv103_24==11 & hv104_24==2)
replace relation24= 21 if (hv103_24==12 & hv104_24==1)
replace relation24=22 if (hv103_24==12 & hv104_24==2)
replace relation24= 23 if (hv103_24==13 & hv104_24==1)
replace relation24=24 if (hv103_24==13 & hv104_24==2)
replace relation24= 25 if (hv103_24==14 & hv104_24==1)
replace relation24=26 if (hv103_24==14 & hv104_24==2)
label variable relation24 "relation24"
label define relation24_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation24 relation24_i



gen relation25=0
replace relation25= 1 if (hv103_25==2 & hv104_25==1)
replace relation25=2 if (hv103_25==2 & hv104_25==2)
replace relation25= 3 if (hv103_25==3 & hv104_25==1)
replace relation25=4 if (hv103_25==3 & hv104_25==2)
replace relation25= 5 if (hv103_25==4 & hv104_25==1)
replace relation25=6 if (hv103_25==4 & hv104_25==2)
replace relation25= 7 if (hv103_25==5 & hv104_25==1)
replace relation25=8 if (hv103_25==5 & hv104_25==2)
replace relation25= 9 if (hv103_25==6 & hv104_25==1)
replace relation25=10 if (hv103_25==6 & hv104_25==2)
replace relation25= 11 if (hv103_25==7 & hv104_25==1)
replace relation25=12 if (hv103_25==7 & hv104_25==2)
replace relation25= 13 if (hv103_25==8 & hv104_25==1)
replace relation25=14 if (hv103_25==8 & hv104_25==2)
replace relation25= 15 if (hv103_25==9 & hv104_25==1)
replace relation25=16 if (hv103_25==9 & hv104_25==2)
replace relation25= 17 if (hv103_25==10 & hv104_25==1)
replace relation25=18 if (hv103_25==10 & hv104_25==2)
replace relation25= 19 if (hv103_25==11 & hv104_25==1)
replace relation25=20 if (hv103_25==11 & hv104_25==2)
replace relation25= 21 if (hv103_25==12 & hv104_25==1)
replace relation25=22 if (hv103_25==12 & hv104_25==2)
replace relation25= 23 if (hv103_25==13 & hv104_25==1)
replace relation25=24 if (hv103_25==13 & hv104_25==2)
replace relation25= 25 if (hv103_25==14 & hv104_25==1)
replace relation25=26 if (hv103_25==14 & hv104_25==2)
label variable relation25 "relation25"
label define relation25_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation25 relation25_i


gen relation26=0
replace relation26= 1 if (hv103_26==2 & hv104_26==1)
replace relation26=2 if (hv103_26==2 & hv104_26==2)
replace relation26= 3 if (hv103_26==3 & hv104_26==1)
replace relation26=4 if (hv103_26==3 & hv104_26==2)
replace relation26= 5 if (hv103_26==4 & hv104_26==1)
replace relation26=6 if (hv103_26==4 & hv104_26==2)
replace relation26= 7 if (hv103_26==5 & hv104_26==1)
replace relation26=8 if (hv103_26==5 & hv104_26==2)
replace relation26= 9 if (hv103_26==6 & hv104_26==1)
replace relation26=10 if (hv103_26==6 & hv104_26==2)
replace relation26= 11 if (hv103_26==7 & hv104_26==1)
replace relation26=12 if (hv103_26==7 & hv104_26==2)
replace relation26= 13 if (hv103_26==8 & hv104_26==1)
replace relation26=14 if (hv103_26==8 & hv104_26==2)
replace relation26= 15 if (hv103_26==9 & hv104_26==1)
replace relation26=16 if (hv103_26==9 & hv104_26==2)
replace relation26= 17 if (hv103_26==10 & hv104_26==1)
replace relation26=18 if (hv103_26==10 & hv104_26==2)
replace relation26= 19 if (hv103_26==11 & hv104_26==1)
replace relation26=20 if (hv103_26==11 & hv104_26==2)
replace relation26= 21 if (hv103_26==12 & hv104_26==1)
replace relation26=22 if (hv103_26==12 & hv104_26==2)
replace relation26= 23 if (hv103_26==13 & hv104_26==1)
replace relation26=24 if (hv103_26==13 & hv104_26==2)
replace relation26= 25 if (hv103_26==14 & hv104_26==1)
replace relation26=26 if (hv103_26==14 & hv104_26==2)
label variable relation26 "relation26"
label define relation26_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation26 relation26_i


gen relation27=0
replace relation27= 1 if (hv103_27==2 & hv104_27==1)
replace relation27=2 if (hv103_27==2 & hv104_27==2)
replace relation27= 3 if (hv103_27==3 & hv104_27==1)
replace relation27=4 if (hv103_27==3 & hv104_27==2)
replace relation27= 5 if (hv103_27==4 & hv104_27==1)
replace relation27=6 if (hv103_27==4 & hv104_27==2)
replace relation27= 7 if (hv103_27==5 & hv104_27==1)
replace relation27=8 if (hv103_27==5 & hv104_27==2)
replace relation27= 9 if (hv103_27==6 & hv104_27==1)
replace relation27=10 if (hv103_27==6 & hv104_27==2)
replace relation27= 11 if (hv103_27==7 & hv104_27==1)
replace relation27=12 if (hv103_27==7 & hv104_27==2)
replace relation27= 13 if (hv103_27==8 & hv104_27==1)
replace relation27=14 if (hv103_27==8 & hv104_27==2)
replace relation27= 15 if (hv103_27==9 & hv104_27==1)
replace relation27=16 if (hv103_27==9 & hv104_27==2)
replace relation27= 17 if (hv103_27==10 & hv104_27==1)
replace relation27=18 if (hv103_27==10 & hv104_27==2)
replace relation27= 19 if (hv103_27==11 & hv104_27==1)
replace relation27=20 if (hv103_27==11 & hv104_27==2)
replace relation27= 21 if (hv103_27==12 & hv104_27==1)
replace relation27=22 if (hv103_27==12 & hv104_27==2)
replace relation27= 23 if (hv103_27==13 & hv104_27==1)
replace relation27=24 if (hv103_27==13 & hv104_27==2)
replace relation27= 25 if (hv103_27==14 & hv104_27==1)
replace relation27=26 if (hv103_27==14 & hv104_27==2)
label variable relation27 "relation27"
label define relation27_i 1 "husband of head" 2 "wife of head" 3 "son" 4 "daughter" 5 "SonIL" 6 "DaughterIL" 7 "Grandson" 8 "Granddaughter" 9 "Father" 10 "mother" 11 "Father-inLaw" 12 "mother-in-law" 13 "brother" 14 "sister" 15 "BIL" 16 "SIL" 17 "nephew" 18 "niece" 19 "other rel male" 20 "other rel Fema" 21 "Adopfos M" 22 "AdopfosF" 23 "Domestic Serv M" 24 "Domestic Serv F" 25 "Other Male NR" 26 "Other Female Rel"
label values relation27 relation27_i

****To test whether household is headed by elder adult

tab age01  hv104_01 

***HH headed by males above age 60

gen HH_headM=0
replace HH_headM=1 if (age01==1 & relation1==1)

egen HH_headM_max= max (HH_headM), by (uid)
label variable HH_headM_max "Hh head males > age 60"
label define HH_headM_max_i 1 "yes" 0 "no"
label values HH_headM_max HH_headM_max_i


***HH headed by females above age 60

gen HH_headF=0
replace HH_headF=1 if (age01==1 & relation1==2)

egen HH_headF_max= max (HH_headF), by (uid)
label variable HH_headF_max "Hh head females > age 60"
label define HH_headF_max_i 1 "yes" 0 "no"
label values HH_headF_max HH_headF_max_i

gen HH_head60=0
replace HH_head60= 1 if (HH_headM_max==1 | HH_headF_max==1)
label variable HH_head60 "HH headed by adults above age 60"
label define HH_head60_i 1 "yes" 0 "no"
label values HH_head60 HH_head60_i

***HH headed by males below age 60

gen HH_nonageheadM=0
replace HH_nonageheadM=1 if (age01==0 & relation1==1)

egen HH_nonageheadM_max= max (HH_nonageheadM), by (uid)
label variable HH_nonageheadM_max "Hh head males < age 60"
label define HH_nonageheadM_max_i 1 "male < age 60 HH" 0 "no"
label values HH_nonageheadM_max HH_nonageheadM_max_i


***HH headed by females below age 60

gen HH_nonageheadF=0
replace HH_nonageheadF=1 if (age01==0 & relation1==2)
egen HH_nonageheadF_max= max (HH_nonageheadF), by (uid)
label variable HH_nonageheadF_max "Hh head females < age 60"
label define HH_nonageheadF_max_i 1 "female < age 60 HH" 0 "no"
label values HH_nonageheadF_max HH_nonageheadF_max_i

***************************************ELDERLY PARENTS LIVING WITH SONS*********************************************************88
 **step 1 (takes into account male household heads below age 60 in whose residence a mother/ father above age 60 lives)
 gen HH_son=0
 replace HH_son=1 if (relation2==9 | relation2==10 | relation3==9 | relation3==10 | relation4==9 | relation4==10 | relation5==9 | relation5==10 | relation6==9 | relation6==10 | relation7==9 | relation7==10 | relation8==9 | relation8==10 | relation9==9 | relation9==10 | relation10==9 | relation10==10 | relation11==9 | relation11==10 | relation12==9 | relation12==10 | relation13==9 | relation13==10 | relation14==9 | relation14==10 | relation15==9 | relation15==10 | relation16==9 | relation16==10 | relation17==9 | relation17==10 | relation18==9 | relation18==10 | relation19==9 | relation19==10 | relation20==9 | relation20==10 | relation21==9 | relation21==10 | relation22==9 | relation22==10 | relation23==9 | relation23==10 | relation24==9 | relation24==10 | relation25==9 | relation25==10 | relation26==9 | relation26==10 | relation27==9 | relation27==10)

 gen HH_sonr=0
 replace HH_sonr=1 if (HH_nonageheadM==1 & HH_son==1)
 
egen HH_son_max= max (HH_sonr), by (uid)
label variable HH_son_max "HH with a parent >=60 and headed by male below age 60"
label define HH_son_max_i 1 "yes" 0 "no"
label values HH_son_max HH_son_max_i

**step 2 (takes into account HH head above age 60 in whose residence a son lives)

gen HH_son2=0
replace HH_son2=1 if (relation2==3 | relation3==3 | relation4==3 | relation5==3 | relation6==3 | relation7==3 | relation8==3 | relation9==3 | relation10==3 | relation11==3 | relation12==3 | relation13==3 | relation14==3 | relation15==3 | relation16==3 | relation17==3 | relation18==3 | relation19==3 | relation20==3 | relation21==3 | relation22==3 | relation23==3 | relation24==3 | relation25== 3 | relation26==3 | relation27==3)

gen HH_son2r=0
replace HH_son2r=1 if (age01==1 & HH_son2==1)

egen HH_son2_max= max (HH_son2r), by (uid)
label variable HH_son2_max "HH head adult>60, with son"
label define HH_son2_max_i 1 "yes" 0 "no"
label values HH_son2_max HH_son2_max_i


**step 2b (takes into account HH head female with husband above 60 in whose residence a son lives)

gen HH_son2W=0
replace HH_son2W=1 if (relation1==2 & relation2==1 & age02==1)

gen HH_son2W_r=0
replace HH_son2W_r=1 if (relation2==3 | relation3==3 | relation4==3 | relation5==3 | relation6==3 | relation7==3 | relation8==3 | relation9==3 | relation10==3 | relation11==3 | relation12==3 | relation13==3 | relation14==3 | relation15==3 | relation16==3 | relation17==3 | relation18==3 | relation19==3 | relation20==3 | relation21==3 | relation22==3 | relation23==3 | relation24==3 | relation25== 3 | relation26==3 | relation27==3)

gen HH_son2W_rr=0
replace HH_son2W_rr=1 if (HH_son2W==1 & HH_son2W_r==1)

egen HH_son2W_max= max (HH_son2W_rr), by (uid)
label variable HH_son2W_max "HH head female with sps >60, with son"
label define HH_son2W_max_i 1 "yes" 0 "no"
label values HH_son2W_max HH_son2W_max_i

**step 2c (takes into account HH head male below age 60 but spouse above 60 in whose residence a son lives)

gen HH_son2M=0
replace HH_son2M=1 if (relation1==1 & relation2==2 & age02==1 & age01==0)

gen HH_son2M_r=0
replace HH_son2M_r=1 if (relation2==3 | relation3==3 | relation4==3 | relation5==3 | relation6==3 | relation7==3 | relation8==3 | relation9==3 | relation10==3 | relation11==3 | relation12==3 | relation13==3 | relation14==3 | relation15==3 | relation16==3 | relation17==3 | relation18==3 | relation19==3 | relation20==3 | relation21==3 | relation22==3 | relation23==3 | relation24==3 | relation25== 3 | relation26==3 | relation27==3)

gen HH_son2M_rr=0
replace HH_son2M_rr=1 if (HH_son2M==1 & HH_son2M_r==1)

egen HH_son2M_max= max (HH_son2M_rr), by (uid)
label variable HH_son2M_max "HH head male < 60 bt sps >60, with son"
label define HH_son2M_max_i 1 "yes" 0 "no"
label values HH_son2M_max HH_son2M_max_i


***step 3 (takes into accounts parents living in their sons house, where the HH head is the DIL)

gen HH_sonwife=0
replace HH_sonwife= 1 if (relation2==11 | relation2==12 | relation3==11 | relation3==12 | relation4==11 | relation4==12 | relation5==11 | relation5==12 | relation6==11 | relation6==12 | relation7==11 | relation7==12 | relation8==11 | relation8==12 | relation9==11 | relation9==12 | relation10==11 | relation10==12 | relation11==11 | relation11==12 | relation12==11 | relation12==12 | relation13==11 | relation13==12 | relation14==11 | relation14==12 | relation15==11 | relation15==12 | relation16==11 | relation16==12 | relation17==11 | relation17==12 | relation18==11 | relation18==12 | relation19==11 | relation19==12 | relation20==11 | relation20==12 | relation21==11 | relation21==12 | relation22==11 | relation22==12 | relation23==11 | relation23==12 | relation24==11 | relation24==12 | relation25==11 | relation25==12 | relation26==11 | relation26==12 | relation27==11 | relation27==12)

gen HH_sonwife_r= 0
replace HH_sonwife_r=1 if (HH_nonageheadF==1 & HH_sonwife==1)

gen HH_sonwife_i=0
replace HH_sonwife_i=1 if (relation1==2 & HH_sonwife_r==1)

egen HH_sonwife_mx = max (HH_sonwife_i), by (uid)
label variable HH_sonwife_mx "elderly living in HH headed by DIL"
label define HH_sonwife_mx_i 1 "Head DIL" 0 "DIL not head"
label values HH_sonwife_mx HH_sonwife_mx_i

****Step 4 (takes into account households headed by males above age 59 in whose households a parent lives, e.g mother/ father in 80's or 90's)

 gen HH_son60=0
 replace HH_son60=1 if (relation2==9 | relation2==10 | relation3==9 | relation3==10 | relation4==9 | relation4==10 | relation5==9 | relation5==10 | relation6==9 | relation6==10 | relation7==9 | relation7==10 | relation8==9 | relation8==10 | relation9==9 | relation9==10 | relation10==9 | relation10==10 | relation11==9 | relation11==10 | relation12==9 | relation12==10 | relation13==9 | relation13==10 | relation14==9 | relation14==10 | relation15==9 | relation15==10 | relation16==9 | relation16==10 | relation17==9 | relation17==10 | relation18==9 | relation18==10 | relation19==9 | relation19==10 | relation20==9 | relation20==10 | relation21==9 | relation21==10 | relation22==9 | relation22==10 | relation23==9 | relation23==10 | relation24==9 | relation24==10 | relation25==9 | relation25==10 | relation26==9 | relation26==10 | relation27==9 | relation27==10)

 gen HH_son60r=0
 replace HH_son60r=1 if (age01==1 & HH_son60==1 & relation1==1)
 
egen HH_son60_max= max (HH_son60r), by (uid)
label variable HH_son60_max "HH with a parent >=60 and headed by male above age 60"
label define HH_son60_max_i 1 "yes" 0 "no"
label values HH_son60_max HH_son60_max_i

***step 5 (HH with an adopted son)
gen HH_son_adopt=0
replace HH_son_adopt=1 if (relation2==21 | relation3==21 | relation4==21 | relation5==21 | relation6==21 | relation7==21 | relation8==21 | relation9==21 | relation10==21 | relation11==21 | relation12==21 | relation13==21 | relation14==21 | relation15==21 | relation16==21 | relation17==21 | relation18==21 | relation19==21 | relation20==21 | relation21==21 | relation22==21 | relation23==21 | relation24==21 | relation25== 21 | relation26==21 | relation27==21)

gen HH_son_adoptr=0
replace HH_son_adoptr=1 if (age01==1 & HH_son_adopt==1)

egen HH_son_adopt_max= max (HH_son_adoptr), by (uid)
label variable HH_son_adopt_max "HH head adult>60, with adopted son"
label define HH_son_adopt_max_i 1 "yes" 0 "no"
label values HH_son_adopt_max HH_son_adopt_max_i

**step 6 (HH where parents live with son's)

gen HH_live_son=0
replace HH_live_son=1 if (HH_sonwife_mx==1 | HH_son_max==1 | HH_son2_max==1 | HH_son60_max==1| HH_son2W_max==1 | HH_son2M_max==1 | HH_son_adopt_max==1)
label variable HH_live_son "elderly living with son/ son's family"
label define HH_live_son_i 1 "with son" 0 "without son"
label values HH_live_son HH_live_son_i

egen HH_live_son_mx= max (HH_live_son), by (uid)
label variable HH_live_son_mx "elderly living with son/son's family"
label define HH_live_son_mx_i 1 "with son/son's family" 0 "without son/son's family"
label values HH_live_son_mx HH_live_son_mx_i

***********************************ELDERLY PARENTS LIVING WITH DAUGHTERS****************************************

**step 1 (takes into account female household heads below age 60 in whose residence a mother/ father lives)
 gen HH_parent=0
 replace HH_parent=1 if (relation2==9 | relation2==10 | relation3==9 | relation3==10 | relation4==9 | relation4==10 | relation5==9 | relation5==10 | relation6==9 | relation6==10 | relation7==9 | relation7==10 | relation8==9 | relation8==10 | relation9==9 | relation9==10 | relation10==9 | relation10==10 | relation11==9 | relation11==10 | relation12==9 | relation12==10 | relation13==9 | relation13==10 | relation14==9 | relation14==10 | relation15==9 | relation15==10 | relation16==9 | relation16==10 | relation17==9 | relation17==10 | relation18==9 | relation18==10 | relation19==9 | relation19==10 | relation20==9 | relation20==10 | relation21==9 | relation21==10 | relation22==9 | relation22==10 | relation23==9 | relation23==10 | relation24==9 | relation24==10 | relation25==9 | relation25==10 | relation26==9 | relation26==10 | relation27==9 | relation27==10)

gen HH_daughter=0
replace HH_daughter=1 if (HH_parent==1 & HH_nonageheadF==1)

egen HH_daughter_max= max (HH_daughter), by (uid)

**step 2a (takes into account HH head age 60 and above in whose residence a daughter lives)

gen HH_Pdaughter2=0
replace HH_Pdaughter2=1 if (relation2==4 | relation3==4 | relation4==4 | relation5==4 | relation6==4 | relation7==4 | relation8==4 | relation9==4 | relation10==4 | relation11==4 | relation12==4 | relation13==4 | relation14==4 | relation15==4 | relation16==4 | relation17==4 | relation18==4 | relation19==4 | relation20==4 | relation21==4 | relation22==4 | relation23==4 | relation24==4 | relation25== 4 | relation26==4 | relation27==4)

gen HH_daughter2=0
replace HH_daughter2=1 if (age01==1 & HH_Pdaughter2==1)

egen HH_daughter2_max= max (HH_daughter2), by (uid)
label variable HH_daughter2_max "HH head adult>60, with daughter"
label define HH_daughter2_max_i 1 "yes" 0 "no"
label values HH_daughter2_max HH_daughter2_max_i

**step 2b (takes into account HH head female with spouse LIVING WITH DAUGHTER)
gen HH_D2W=0
replace HH_D2W=1 if (relation1==2 & relation2==1 & age02==1)

gen HH_D2W_r=0
replace HH_D2W_r=1 if (relation2==4 | relation3==4 | relation4==4 | relation5==4 | relation6==4 | relation7==4 | relation8==4 | relation9==4 | relation10==4 | relation11==4 | relation12==4 | relation13==4 | relation14==4 | relation15==4 | relation16==4 | relation17==4 | relation18==4 | relation19==4 | relation20==4 | relation21==4 | relation22==4 | relation23==4 | relation24==4 | relation25== 4 | relation26==4 | relation27==4)

gen HH_D2W_rr=0
replace HH_D2W_rr=1 if (HH_D2W==1 & HH_D2W_r==1)

egen HH_D2W_max= max (HH_D2W_rr), by (uid)
label variable HH_D2W_max "HH head female with sps >60, with daughter"
label define HH_D2W_max_i 1 "yes" 0 "no"
label values HH_D2W_max HH_D2W_max_i

**step 2c (takes into account HH head male below age 60 but spouse above 60 in whose residence a daughter lives)

gen HH_D2M=0
replace HH_D2M=1 if (relation1==1 & relation2==2 & age02==1 & age01==0)

gen HH_D2M_r=0
replace HH_D2M_r=1 if (relation2==4 | relation3==4 | relation4==4 | relation5==4 | relation6==4 | relation7==4 | relation8==4 | relation9==4 | relation10==4 | relation11==4 | relation12==4 | relation13==4 | relation14==4 | relation15==4 | relation16==4 | relation17==4 | relation18==4 | relation19==4 | relation20==4 | relation21==4 | relation22==4 | relation23==4 | relation24==4 | relation25== 4 | relation26==4 | relation27==4)

gen HH_D2M_rr=0
replace HH_D2M_rr=1 if (HH_D2M==1 & HH_D2M_r==1)

egen HH_D2M_max= max (HH_D2M_rr), by (uid)
label variable HH_D2M_max "HH head male < 60 bt sps >60, with daughter"
label define HH_D2M_max_i 1 "yes" 0 "no"
label values HH_D2M_max HH_D2M_max_i


***step 3 (takes into accounts parents living in their daughters house, where the HH head is the husband of the daughter)

gen HH_daughterhusband=0
replace HH_daughterhusband= 1 if (relation2==11 | relation2==12 | relation3==11 | relation3==12 | relation4==11 | relation4==12 | relation5==11 | relation5==12 | relation6==11 | relation6==12 | relation7==11 | relation7==12 | relation8==11 | relation8==12 | relation9==11 | relation9==12 | relation10==11 | relation10==12 | relation11==11 | relation11==12 | relation12==11 | relation12==12 | relation13==11 | relation13==12 | relation14==11 | relation14==12 | relation15==11 | relation15==12 | relation16==11 | relation16==12 | relation17==11 | relation17==12 | relation18==11 | relation18==12 | relation19==11 | relation19==12 | relation20==11 | relation20==12 | relation21==11 | relation21==12 | relation22==11 | relation22==12 | relation23==11 | relation23==12 | relation24==11 | relation24==12 | relation25==11 | relation25==12 | relation26==11 | relation26==12 | relation27==11 | relation27==12)

gen HH_daughterhusband_i=0
replace HH_daughterhusband_i=1 if (relation1==1 & HH_daughterhusband==1)

****step 4 takes into account households headed by females above age 59 in whose households a parent lives, e.g mother/ father in 80's or 90's)
 gen HH_daughter60=0
 replace HH_daughter60=1 if (relation2==9 | relation2==10 | relation3==9 | relation3==10 | relation4==9 | relation4==10 | relation5==9 | relation5==10 | relation6==9 | relation6==10 | relation7==9 | relation7==10 | relation8==9 | relation8==10 | relation9==9 | relation9==10 | relation10==9 | relation10==10 | relation11==9 | relation11==10 | relation12==9 | relation12==10 | relation13==9 | relation13==10 | relation14==9 | relation14==10 | relation15==9 | relation15==10 | relation16==9 | relation16==10 | relation17==9 | relation17==10 | relation18==9 | relation18==10 | relation19==9 | relation19==10 | relation20==9 | relation20==10 | relation21==9 | relation21==10 | relation22==9 | relation22==10 | relation23==9 | relation23==10 | relation24==9 | relation24==10 | relation25==9 | relation25==10 | relation26==9 | relation26==10 | relation27==9 | relation27==10)

 gen HH_daughter60r=0
 replace HH_daughter60r=1 if (age01==1 & HH_daughter60==1 & relation1==2)
 
egen HH_daughter60_max= max (HH_daughter60r), by (uid)
label variable HH_daughter60_max "HH with a parent >=60 and headed by female above age 60"
label define HH_daughter60_max_i 1 "yes" 0 "no"
label values HH_daughter60_max HH_daughter60_max_i

**step 5 (HH with adopted daughter)
gen HH_Pdaughter_adopt2=0
replace HH_Pdaughter_adopt2=1 if (relation2==22 | relation3==22 | relation4==22 | relation5==22 | relation6==22 | relation7==22 | relation8==22 | relation9==22 | relation10==22 | relation11==22 | relation12==22 | relation13==22 | relation14==22 | relation15==22 | relation16==22 | relation17==22 | relation18==22 | relation19==22 | relation20==22 | relation21==22 | relation22==22 | relation23==22 | relation24==22 | relation25== 22 | relation26==22 | relation27==22)

gen HH_daughter_adopt2=0
replace HH_daughter_adopt2=1 if (age01==1 & HH_Pdaughter_adopt2==1)

**step 6  (HH where the daughter lives with elderly parents and elderly parents live with daughter)

gen HH_live_daughter=0
replace HH_live_daughter=1 if (HH_daughter_max==1 | HH_daughter2==1 | HH_daughterhusband_i==1 | HH_D2M_max==1 | HH_D2W_max==1 | HH_daughter60_max==1 | HH_daughter_adopt2==1)
label variable HH_live_daughter "Men/Women living with daughters"
label define HH_live_daughter_i 1 "living with daughter" 0 "do not live with daughter"
label values HH_live_daughter HH_live_daughter_i


egen HH_live_daughter_mx= max (HH_live_daughter), by (uid)
label variable HH_live_daughter_mx "Men/Women living with daughters"
label define HH_live_daughter_mx_i 1 "living with daughter" 0 "do not live with daughter"
label values HH_live_daughter_mx HH_live_daughter_mx_i



***************************************ELDERLY LIVING ALONE******************************************************
***Women elderly
gen F_alone=0
replace F_alone=1 if (relation1==2 & age01==1)

gen F_alone1=0
replace F_alone1= 1 if (relation2==0 & relation3==0 & relation4==0 & relation5==0 & relation6==0 & relation7==0 & relation8==0 & relation9==0 & relation10==0 & relation11==0 & relation12==0 & relation13==0 & relation14==0 & relation15==0 & relation16==0 & relation17==0 & relation18==0 & relation19==0 & relation20==0 & relation21==0 & relation22==0 & relation23==0 & relation24==0 & relation25== 0 & relation26==0 & relation27==0)

gen F_alone2=0
replace F_alone2=1 if (F_alone==1 & F_alone1==1)
label variable F_alone2 "Women >age 60 living alone"
label define F_alone2_i 1 "living alone" 0 "not living alone"
label values F_alone2 F_alone2_i


***Male elderly
gen M_alone=0
replace M_alone=1 if (relation1==1 & age01==1)

gen M_alone1=0
replace M_alone1= 1 if (relation2==0 & relation3==0 & relation4==0 & relation5==0 & relation6==0 & relation7==0 & relation8==0 & relation9==0 & relation10==0 & relation11==0 & relation12==0 & relation13==0 & relation14==0 & relation15==0 & relation16==0 & relation17==0 & relation18==0 & relation19==0 & relation20==0 & relation21==0 & relation22==0 & relation23==0 & relation24==0 & relation25== 0 & relation26==0 & relation27==0)

gen M_alone2=0
replace M_alone2=1 if (M_alone==1 & M_alone1==1)
label variable M_alone2 "Men >age 60 living alone"
label define M_alone2_i 1 "living alone" 0 "not living alone"
label values M_alone2 M_alone2_i



gen live_alone=0
replace live_alone=1 if (F_alone2==1 | M_alone2==1)
label variable live_alone "elderly living alone"
label define live_alone_i 1 "yes" 0 "no"
label values live_alone live_alone_i
****************************************ELDERLY LIVING WITH SPOUSE ONLY******************************************8
***husband Household Head living with wife
gen spouseM=0
replace spouseM=1 if (age01==1 & relation1==1 & relation2==2) 

gen spouseM2=0
replace spouseM2=1 if (age01==0 & age02==1 & relation1==1 & relation2==2)

**Wife Household Head living with husband
gen spouseF=0
replace spouseF= 1 if (age01==1 & relation1==2 & relation2==1)

gen spouseF2=0
replace spouseF2= 1 if (age01==0 & age02==1 & relation1==2 & relation2==1)

gen spouseonly=0
replace spouseonly=1 if (spouseM==1 | spouseF==1 | spouseM2==1 | spouseF2==1)

gen spouseonly1=0
replace spouseonly1= 1 if (spouseonly==1 & relation3==0 & relation4==0 & relation5==0 & relation6==0 & relation7==0 & relation8==0 & relation9==0 & relation10==0 & relation11==0 & relation12==0 & relation13==0 & relation14==0 & relation15==0 & relation16==0 & relation17==0 & relation18==0 & relation19==0 & relation20==0 & relation21==0 & relation22==0 & relation23==0 & relation24==0 & relation25== 0 & relation26==0 & relation27==0)

egen spouseonly1_mx= max (spouseonly1), by (uid)
label variable spouseonly1_mx "living only with spouse"
label define spouseonly1_mx_i 1 "yes" 0 "no"
label values spouseonly1_mx spouseonly1_mx_i

*************************************ELDERLY LIVING WITH SPOUSE WITH SON & FAMILY*******************************


gen spouse_Sfamily=0
replace spouse_Sfamily= 1 if (spouseonly==1 & HH_live_son_mx==1)


egen spouse_Sfamily_mx= max (spouse_Sfamily), by (uid)
label variable spouse_Sfamily_mx "living with spouse & son & family"
label define spouse_Sfamily_mx_i 1 "yes" 0 "no"
label values spouse_Sfamily_mx spouse_Sfamily_mx_i


*************************************ELDERLY LIVING WITH SPOUSE WITH DAUGHTER & FAMILY*******************************

gen spouse_Dfamily=0
replace spouse_Dfamily= 1 if (spouseonly==1 & HH_live_daughter_mx==1)
label variable spouse_Dfamily "living with spouse & daughter & family"
label define spouse_Dfamily_i 1 "yes" 0 "no"
label values spouse_Dfamily spouse_Dfamily_i

egen spouse_Dfamily_mx= max (spouse_Dfamily), by (uid)
label variable spouse_Dfamily_mx "living with spouse & daughter & family"
label define spouse_Dfamily_mx_i 1 "yes" 0 "no"
label values spouse_Dfamily_mx spouse_Dfamily_mx_i

*************************************ELDERLY LIVING WITH SPOUSE WITH BOTH SONS AND DAUGHTER*************************

gen spouse_SD=0
replace spouse_SD=1 if (spouse_Sfamily==1 & spouse_Dfamily==1)
label variable spouse_SD "elderly spouse with both son & daughter"
label define spouse_SD_i 1 "yes" 0 "no"
label values spouse_SD spouse_SD_i

egen spouse_SD_mx= max (spouse_SD), by (uid)
label variable spouse_SD_mx "elderly spouse with both son & daughter"
label define spouse_SD_mx_i 1 "yes" 0 "no"
label values spouse_SD_mx spouse_SD_mx_i
*******************************************************************************************************************************
*************************************ELDERLY FEMALE HH head NO SPOUSE LIVING WITH SON*******************************

gen FNM_son=0
replace FNM_son=1 if (relation1==2 & age01==1 & hv104_01==2 & hv106_01 > 1 & HH_son2==1) 
label variable FNM_son "Female elderly HH head not married living with son"
label define FNM_son_i 1 "yes" 0 "no"
label values FNM_son FNM_son_i

egen FNM_son_mx= max (FNM_son), by (uid)
label variable FNM_son_mx "Female elderly HH not married living with son"
label define FNM_son_mx_i 1 "yes" 0 "no"
label values FNM_son_mx FNM_son_mx_i



*************************************ELDERLY FEMALE HH head NO SPOUSE LIVING WITH DAUGHTER*******************************

gen FNM_daughter=0
replace FNM_daughter=1 if (relation1==2 & age01==1 & hv104_01==2 & hv106_01 > 1 & HH_daughter2==1) 
label variable FNM_daughter "Female elderly HH head not married living with daughter"
label define FNM_daughter_i 1 "yes" 0 "no"
label values FNM_daughter FNM_daughter_i

egen FNM_daughter_mx= max (FNM_daughter), by (uid)
label variable FNM_daughter_mx "Female elderly HH not married living with daughter"
label define FNM_daughter_mx_i 1 "yes" 0 "no"
label values FNM_daughter_mx FNM_daughter_mx_i



*****FEMALE ELDERLY HH head WITHOUT SPOUSE WHO LIVE EITHER WITH SON & DAUGHTER

gen Fnospouse_SD=0
replace Fnospouse_SD=1 if (FNM_son==1 & FNM_daughter==1)
label variable Fnospouse_SD "eldelry no spouse, live son & daughter"
label define Fnospouse_SD_i 1 "yes" 0 "no"
label values Fnospouse_SD Fnospouse_SD_i


*****FEMALE ELDERLY HH head WITHOUT SPOUSE WHO LIVE EITHER WITH SON or DAUGHTER

gen Fnospouse_SorD=0
replace Fnospouse_SorD=1 if (FNM_son==1 | FNM_daughter==1)
label variable Fnospouse_SorD "eldelry no spouse, live son or daughter"
label define Fnospouse_SorD_i 1 "yes" 0 "no"
label values Fnospouse_SorD Fnospouse_SorD_i


****FEMALE ELDERLY HH head WITHOUT SPOUSE WHO LIVE WITH DIL & NOT SON'S (if this is so, give importance to this in comprison to daughter)

gen F_nosps_DIL=0
replace F_nosps_DIL=1 if (relation1==2 & age01==1 & hv104_01==2 & hv106_01 > 1 & HH_son2==0)

gen F_nosps_DIL2=0
replace F_nosps_DIL2=1 if (relation2==6 | relation3==6 | relation4==6 | relation5==6 | relation6==6 | relation7==6 | relation8==6 | relation9==6 | relation10==6 | relation11==6 | relation12==6 | relation13==6 | relation14==6 | relation15==6 | relation16==6 | relation17==6 | relation18==6 | relation19==6 | relation20==6 | relation21==6 | relation22==6 | relation23==6 | relation24==6 | relation25==6 | relation26==6 | relation27==6)

gen F_nosps_DIL2_r=0
replace F_nosps_DIL2_r=1 if (F_nosps_DIL==1 & F_nosps_DIL2==1)
label variable F_nosps_DIL2_r "elderly no sps, only DIL, no sons"
label define F_nosps_DIL2_r_i 1 "yes" 0 "no"
label values F_nosps_DIL2_r F_nosps_DIL2_r_i

*******TO FIGURE OUT WHO ELSE A FEMALE ELDERLY HH HEAD WHO LIVES WITH OTHERS, NOT SON/ DAUGHTER/ DIL

gen F_other=0
replace F_other=1 if (Fnospouse_SorD==0 & F_nosps_DIL2_r==0 & relation1==2 & age01==1 & hv104_01==2 & hv106_01 > 1 & F_alone2==0)
label variable F_other "female HH head live with other"
label define F_other_i 1 "yes" 0 "no"
label values F_other F_other_i

gen F_grandchild=0
replace F_grandchild=1 if (relation2==7 | relation2==8 | relation3==7 | relation3==8 | relation4==7 | relation4==8 | relation5==7 | relation5==8 | relation6==7 | relation6==8 | relation7==7 | relation7==8 | relation8==7 | relation8==8 | relation9==7 | relation9==8 | relation10==7 | relation10==8 | relation11==7 | relation11==8 | relation12==7 | relation12==8 | relation13==7 | relation13==8 | relation14==7 | relation14==8 | relation15==7 | relation15==8 | relation16==7 | relation16==8 | relation17==7 | relation17==8 | relation18==7 | relation18==8 | relation19==7 | relation19==8 | relation20==7 | relation20==8 | relation21==7 | relation21==8 | relation22==7 | relation22==8 | relation23==7 | relation23==8 | relation24==7 | relation24==8 | relation25==7 | relation25==8 | relation26==7 | relation26==8 | relation27==7 | relation27==8)

gen F_grandchild_r=0
replace F_grandchild_r=1 if (F_grandchild==1 & relation1==2 & age01==1 & hv104_01==2 & hv106_01 > 1 & F_other==1)
label variable F_grandchild_r "living only with grandchildren"
label define F_grandchild_r_i 1 "yes" 0 "no"
label values F_grandchild_r F_grandchild_r_i


gen F_servant=0
replace F_servant=1 if (relation2==23 | relation2==24)
gen F_servant_r=0
replace F_servant_r= 1 if (F_servant==1 & relation1==2 & age01==1 & hv104_01==2 & hv106_01 > 1 & F_other==1)

******Single mothers/ MIL/sister/ sister-in-laws who are not HH heads, living with son's/ SIL/ brothers/ DIL/ daughters********************


 gen HH_mother2=0
 replace HH_mother2=1 if (relation2==10 & age02==1 & hv106_02 > 1)
 
 gen HH_mother3=0
 replace HH_mother3=1 if (relation3==10 & age03==1 & hv106_03 > 1)
 
 gen HH_mother4=0
 replace HH_mother4=1 if (relation4==10 & age04==1 & hv106_04 > 1)
 
 gen HH_mother5=0
 replace HH_mother5=1 if (relation5==10 & age05==1 & hv106_05 > 1)
 
 gen HH_mother6=0
 replace HH_mother6=1 if (relation6==10 & age06==1 & hv106_06 > 1)
 
 gen HH_mother7=0
 replace HH_mother7=1 if (relation7==10 & age07==1 & hv106_07 > 1)
 
 gen HH_mother8=0
 replace HH_mother8=1 if (relation8==10 & age08==1 & hv106_08 > 1)
 
 gen HH_mother9=0
 replace HH_mother9=1 if (relation9==10 & age09==1 & hv106_09 > 1)
 
 gen HH_mother10=0
 replace HH_mother10=1 if (relation10==10 & age10==1 & hv106_10 > 1)
 
gen HH_mother11=0
replace HH_mother11=1 if (relation11==10 & age11==1 & hv106_11 > 1)

gen HH_mother12=0
replace HH_mother12=1 if (relation12==10 & age12==1 & hv106_12 > 1)

gen HH_mother13=0
replace HH_mother13=1 if (relation13==10 & age13==1 & hv106_13 > 1)

gen HH_mother14=0
replace HH_mother14=1 if (relation14==10 & age14==1 & hv106_14 > 1)

gen HH_mother17=0
replace HH_mother17=1 if (relation17==10 & age17==1 & hv106_17 > 1)

gen HH_mother20=0
replace HH_mother20=1 if (relation20==10 & age20==1 & hv106_20 > 1)

gen mother_notmarried=0
replace mother_notmarried=1 if (HH_mother2==1 | HH_mother3==1 | HH_mother4==1 | HH_mother5==1 | HH_mother6==1 | HH_mother7==1 | HH_mother8==1 | HH_mother9==1 | HH_mother10==1 | HH_mother11==1 | HH_mother12==1 | HH_mother13==1 | HH_mother14==1 | HH_mother17==1 | HH_mother20==1)
label variable mother_notmarried "unmarried mother > 60 in the household"
label define mother_notmarried_i 1 "yes" 0 "no"
label values mother_notmarried mother_notmarried_i


gen HH_MIL2=0
replace HH_MIL2=1 if (relation2==12 & age02==1 & hv106_02 > 1)

gen HH_MIL3=0
replace HH_MIL3=1 if (relation3==12 & age03==1 & hv106_03 > 1)

gen HH_MIL4=0
replace HH_MIL4=1 if (relation4==12 & age04==1 & hv106_04 > 1)

gen HH_MIL5=0
replace HH_MIL5=1 if (relation5==12 & age05==1 & hv106_05 > 1)

gen HH_MIL6=0
replace HH_MIL6=1 if (relation6==12 & age06==1 & hv106_06 > 1)

gen HH_MIL7=0
replace HH_MIL7=1 if (relation7==12 & age07==1 & hv106_07 > 1)

gen HH_MIL9=0
replace HH_MIL9=1 if (relation9==12 & age09==1 & hv106_09 > 1)

gen HH_MIL10=0
replace HH_MIL10=1 if (relation10==12 & age10==1 & hv106_10 > 1)

gen HH_MIL11=0
replace HH_MIL11=1 if (relation11==12 & age11==1 & hv106_11 > 1)

gen HH_MIL19=0
replace HH_MIL19=1 if (relation19==12 & age19==1 & hv106_19 > 1)

*******unmarried MIL in HH, irrespective of whether the HH is headed by female or male 
gen HH_MIL=0
replace HH_MIL = 1 if (HH_MIL2==1 | HH_MIL3==1 | HH_MIL4==1 | HH_MIL5==1 | HH_MIL6==1 | HH_MIL7==1 | HH_MIL9==1 | HH_MIL10==1 | HH_MIL11==1 | HH_MIL==19==1)
label variable HH_MIL "unmarried mother-in-law > 60"
label define HH_MIL_i 1 "yes" 0 "no"
label values HH_MIL HH_MIL_i


gen HH_sister2=0
replace HH_sister2=1 if (relation2==14 & age02==1 & hv106_02 > 1)

gen HH_sister3=0
replace HH_sister3=1 if (relation3==14 & age03==1 & hv106_03 > 1)

gen HH_sister4=0
replace HH_sister4=1 if (relation4==14 & age04==1 & hv106_04 > 1)

gen HH_sister5=0
replace HH_sister5=1 if (relation5==14 & age05==1 & hv106_05 > 1)

gen HH_sister6=0
replace HH_sister6=1 if (relation6==14 & age06==1 & hv106_06 > 1)

gen HH_sister7=0
replace HH_sister7=1 if (relation7==14 & age07==1 & hv106_07 > 1)

gen HH_sister8=0
replace HH_sister8=1 if (relation8==14 & age08==1 & hv106_08 > 1)

gen HH_sister10=0
replace HH_sister10=1 if (relation10==14 & age10==1 & hv106_10 > 1)

gen HH_sister14=0
replace HH_sister14=1 if (relation14==14 & age14==1 & hv106_14 > 1)

gen HH_sister=0
replace HH_sister=1 if (HH_sister2==1 | HH_sister3==1 | HH_sister4==1 | HH_sister5==1 | HH_sister6==1 | HH_sister7==1 | HH_sister8==1 | HH_sister10==1 | HH_sister14==1)
label variable HH_sister "unmarried sister > 60"
label define HH_sister_i 1 "yes" 0 "no"
label values HH_sister HH_sister_i


gen HH_SIL2=0
replace HH_SIL2=1 if (relation2==16 & age02==1 & hv106_02 > 1)

gen HH_SIL3=0
replace HH_SIL3=1 if (relation3==16 & age03==1 & hv106_03 > 1)

gen HH_SIL5=0
replace HH_SIL5=1 if (relation5==16 & age05==1 & hv106_05 > 1)

gen HH_SIL6=0
replace HH_SIL6=1 if (relation6==16 & age06==1 & hv106_06 > 1)

gen HH_SIL8=0
replace HH_SIL8=1 if (relation8==16 & age08==1 & hv106_08 > 1)

gen HH_SIL=0
replace HH_SIL=1 if (HH_SIL2==1 | HH_SIL3==1 | HH_SIL5==1 | HH_SIL6==1 | HH_SIL8==1)
label variable HH_SIL "unmarried sister-in-law > 60"
label define HH_SIL_i 1 "yes" 0 "no"
label values HH_SIL HH_SIL_i


//************************THE ABOVE TWO VARIABLES WILL NEED TO BE USED TOGETHER TO GET AN ESTIMATE /
//OF HOW MANY ELDERLY FEMALES (HEAD / NOT HEAD OF HOUSEHOLDS) ARE NOT MARRIED AND LIVING WITH SONS


*******************************************************************************************************************************
*************************************ELDERLY MALE HH head NO SPOUSE LIVING WITH SON*******************************

gen MNM_son=0
replace MNM_son=1 if (relation1==1 & age01==1 & hv104_01==1 & hv106_01 > 1 & HH_son2==1) 
label variable MNM_son "Male elderly HH head not married living with son"
label define MNM_son_i 1 "yes" 0 "no"
label values MNM_son MNM_son_i



egen MNM_son_mx= max (MNM_son), by (uid)
label variable MNM_son_mx "Male elderly HH head not married living with son"
label define MNM_son_mx_i 1 "yes" 0 "no"
label values MNM_son_mx MNM_son_mx_i


*************************************ELDERLY MALE HH head NO SPOUSE & LIVING WITH DAUGHTER*******************************

gen MNM_daughter=0
replace MNM_daughter=1 if (relation1==1 & age01==1 & hv104_01==1 & hv106_01 > 1 & HH_daughter2==1) 
label variable MNM_daughter "Male elderly HH head not married living with daughter"
label define MNM_daughter_i 1 "yes" 0 "no"
label values MNM_daughter MNM_daughter_i

egen MNM_daughter_mx= max (MNM_daughter), by (uid)
label variable MNM_daughter_mx "Male elderly HH not married living with daughter"
label define MNM_daughter_mx_i 1 "yes" 0 "no"
label values MNM_daughter_mx MNM_daughter_mx_i


*****MALE ELDERLY HH head WITHOUT SPOUSE WHO LIVE WITH BOTH SON & DAUGHTER

gen Mnospouse_SD=0
replace Mnospouse_SD=1 if (MNM_son==1 & MNM_daughter==1)
label variable Mnospouse_SD "Male eldelry no spouse, live son & daughter"
label define Mnospouse_SD_i 1 "yes" 0 "no"
label values Mnospouse_SD Mnospouse_SD_i


*****MALE ELDERLY HH head WITHOUT SPOUSE WHO LIVE EITHER WITH SON or DAUGHTER

gen Mnospouse_SorD=0
replace Mnospouse_SorD=1 if (MNM_son==1 | MNM_daughter==1)
label variable Mnospouse_SorD "Male eldelry no spouse, live son or daughter"
label define Mnospouse_SorD_i 1 "yes" 0 "no"
label values Mnospouse_SorD Mnospouse_SorD_i


****MALE ELDERLY HH head WITHOUT SPOUSE WHO LIVE WITH DIL & NOT SON'S (if this is so, give importance to this in comprison to daughter)

gen M_nosps_DIL=0
replace M_nosps_DIL=1 if (relation1==1 & age01==1 & hv104_01==1 & hv106_01 > 1 & HH_son2==0)

gen M_nosps_DIL2=0
replace M_nosps_DIL2=1 if (relation2==6 | relation3==6 | relation4==6 | relation5==6 | relation6==6 | relation7==6 | relation8==6 | relation9==6 | relation10==6 | relation11==6 | relation12==6 | relation13==6 | relation14==6 | relation15==6 | relation16==6 | relation17==6 | relation18==6 | relation19==6 | relation20==6 | relation21==6 | relation22==6 | relation23==6 | relation24==6 | relation25==6 | relation26==6 | relation27==6)

gen M_nosps_DIL2_r=0
replace M_nosps_DIL2_r=1 if (M_nosps_DIL==1 & M_nosps_DIL2==1)
label variable M_nosps_DIL2_r "Male elderly no sps, only DIL, no sons"
label define M_nosps_DIL2_r_i 1 "yes" 0 "no"
label values M_nosps_DIL2_r M_nosps_DIL2_r_i

*******TO FIGURE OUT WHO ELSE A MALE ELDERLY HH HEAD WHO LIVES WITH OTHERS, NOT SON/ DAUGHTER/ DIL

gen M_other=0
replace M_other=1 if (Mnospouse_SorD==0 & M_nosps_DIL2_r==0 & relation1==1 & age01==1 & hv104_01==1 & hv106_01 > 1 & M_alone2==0)
label variable M_other "Male HH head live with other"
label define M_other_i 1 "yes" 0 "no"
label values M_other M_other_i

gen M_grandchild=0
replace M_grandchild=1 if (relation2==7 | relation2==8 | relation3==7 | relation3==8 | relation4==7 | relation4==8 | relation5==7 | relation5==8 | relation6==7 | relation6==8 | relation7==7 | relation7==8 | relation8==7 | relation8==8 | relation9==7 | relation9==8 | relation10==7 | relation10==8 | relation11==7 | relation11==8 | relation12==7 | relation12==8 | relation13==7 | relation13==8 | relation14==7 | relation14==8 | relation15==7 | relation15==8 | relation16==7 | relation16==8 | relation17==7 | relation17==8 | relation18==7 | relation18==8 | relation19==7 | relation19==8 | relation20==7 | relation20==8 | relation21==7 | relation21==8 | relation22==7 | relation22==8 | relation23==7 | relation23==8 | relation24==7 | relation24==8 | relation25==7 | relation25==8 | relation26==7 | relation26==8 | relation27==7 | relation27==8)

gen M_grandchild_r=0
replace M_grandchild_r=1 if (M_grandchild==1 & relation1==1 & age01==1 & hv104_01==1 & hv106_01 > 1 & M_other==1)
label variable M_grandchild_r "Male head living only with grandchildren"
label define M_grandchild_r_i 1 "yes" 0 "no"
label values M_grandchild_r M_grandchild_r_i


gen M_servant=0
replace M_servant=1 if (relation2==23 | relation2==24)

gen M_servant_r=0
replace M_servant_r= 1 if (M_servant==1 & relation1==1 & age01==1 & hv104_01==1 & hv106_01 > 1 & M_other==1)



******Single father/ FIL/brothers/ brother-in-laws who are not HH heads, living with son's/ SIL/ brothers/ DIL/ daughters********************


 gen HH_father2=0
 replace HH_father2=1 if (relation2==9 & age02==1 & hv106_02 > 1)
 
 gen HH_father3=0
 replace HH_father3=1 if (relation3==9 & age03==1 & hv106_03 > 1)
 
 gen HH_father4=0
 replace HH_father4=1 if (relation4==9 & age04==1 & hv106_04 > 1)
 
 gen HH_father5=0
 replace HH_father5=1 if (relation5==9 & age05==1 & hv106_05 > 1)
 
 gen HH_father6=0
 replace HH_father6=1 if (relation6==9 & age06==1 & hv106_06 > 1)
 
 gen HH_father7=0
 replace HH_father7=1 if (relation7==9 & age07==1 & hv106_07 > 1)
 
 gen HH_father8=0
 replace HH_father8=1 if (relation8==9 & age08==1 & hv106_08 > 1)
 
 gen HH_father9=0
 replace HH_father9=1 if (relation9==9 & age09==1 & hv106_09 > 1)
 
 gen HH_father10=0
 replace HH_father10=1 if (relation10==9 & age10==1 & hv106_10 > 1)
 
gen HH_father13=0
replace HH_father13=1 if (relation13==9 & age13==1 & hv106_13 > 1)

gen HH_father17=0
replace HH_father17=1 if (relation17==9 & age17==1 & hv106_17 > 1)


gen father_notmarried=0
replace father_notmarried=1 if (HH_father2==1 | HH_father3==1 | HH_father4==1 | HH_father5==1 | HH_father6==1 | HH_father7==1 | HH_father8==1 | HH_father9==1 | HH_father10==1 | HH_father13==1 | HH_father17==1)
label variable father_notmarried "unmarried father > 60 in the household"
label define father_notmarried_i 1 "yes" 0 "no"
label values father_notmarried father_notmarried_i


gen HH_FIL2=0
replace HH_FIL2=1 if (relation2==11 & age02==1 & hv106_02 > 1)

gen HH_FIL3=0
replace HH_FIL3=1 if (relation3==11 & age03==1 & hv106_03 > 1)

gen HH_FIL4=0
replace HH_FIL4=1 if (relation4==11 & age04==1 & hv106_04 > 1)

gen HH_FIL5=0
replace HH_FIL5=1 if (relation5==11 & age05==1 & hv106_05 > 1)

gen HH_FIL6=0
replace HH_FIL6=1 if (relation6==11 & age06==1 & hv106_06 > 1)



*******unmarried FIL in HH, irrespective of whether the HH is headed by female or male 
gen HH_FIL=0
replace HH_FIL = 1 if (HH_FIL2==1 | HH_FIL3==1 | HH_FIL4==1 | HH_FIL5==1 | HH_FIL6==1)
label variable HH_FIL "unmarried father-in-law > 60"
label define HH_FIL_i 1 "yes" 0 "no"
label values HH_FIL HH_FIL_i


gen HH_brother2=0
replace HH_brother2=1 if (relation2==13 & age02==1 & hv106_02 > 1)

gen HH_brother3=0
replace HH_brother3=1 if (relation3==13 & age03==1 & hv106_03 > 1)

gen HH_brother4=0
replace HH_brother4=1 if (relation4==13 & age04==1 & hv106_04 > 1)

gen HH_brother5=0
replace HH_brother5=1 if (relation5==13 & age05==1 & hv106_05 > 1)

gen HH_brother6=0
replace HH_brother6=1 if (relation6==13 & age06==1 & hv106_06 > 1)

gen HH_brother7=0
replace HH_brother7=1 if (relation7==13 & age07==1 & hv106_07 > 1)

gen HH_brother13=0
replace HH_brother13=1 if (relation13==13 & age13==1 & hv106_13 > 1)

gen HH_brother=0
replace HH_brother=1 if (HH_brother2==1 | HH_brother3==1 | HH_brother4==1 | HH_brother5==1 | HH_brother6==1 | HH_brother7==1 | HH_brother13==1)
label variable HH_brother "unmarried brother > 60"
label define HH_brother_i 1 "yes" 0 "no"
label values HH_brother HH_brother_i


gen HH_BIL2=0
replace HH_BIL2=1 if (relation2==15 & age02==1 & hv106_02 > 1)

gen HH_BIL3=0
replace HH_BIL3=1 if (relation3==15 & age03==1 & hv106_03 > 1)

gen HH_BIL4=0
replace HH_BIL4=1 if (relation4==15 & age04==1 & hv106_04 > 1)

gen HH_BIL11=0
replace HH_BIL11=1 if (relation11==15 & age11==1 & hv106_11 > 1)


gen HH_BIL=0
replace HH_BIL=1 if (HH_BIL2==1 | HH_BIL3==1 | HH_BIL4==1 | HH_BIL11==1)
label variable HH_BIL "unmarried brother-in-law > 60"
label define HH_BIL_i 1 "yes" 0 "no"
label values HH_BIL HH_BIL_i

********create household type
* Alone; spouse only; living with children; living with others not children

gen live_arrange=0
replace live_arrange=1 if (live_alone==1)
replace live_arrange=2 if (spouseonly1_mx==1)
replace live_arrange=3 if (HH_live_son_mx==1 | HH_live_daughter_mx==1 | spouse_Sfamily_mx==1 | spouse_Dfamily_mx==1 | spouse_SD_mx==1 | FNM_son_mx==1 | FNM_daughter_mx==1 | Fnospouse_SD==1 | Fnospouse_SorD==1 | F_nosps_DIL2_r==1 | MNM_son_mx==1 | MNM_daughter_mx==1 | Mnospouse_SD==1 | Mnospouse_SorD==1 | M_nosps_DIL2_r)
label variable live_arrange "living arrangement of elderly"
label define live_arrange_i 0 "others" 1 "alone" 2 "spouse only" 3 "with child/ren"
label values live_arrange live_arrange_i


egen live_arrange_max= max (live_arrange), by (uid)
label variable live_arrange_max "living arrangement of elderly"
label define live_arrange_max_i 0 "others" 1 "alone" 2 "spouse only" 3 "with child/ren"
label values live_arrange_max live_arrange_max_i
br iuid uid vline1 hhno vhhno vline live_arrange live_alone spouseonly1_mx HH_live_son_mx HH_live_daughter_mx spouse_Sfamily_mx spouse_Dfamily_mx spouse_SD_mx FNM_son_mx FNM_daughter_mx Fnospouse_SD Fnospouse_SorD F_nosps_DIL2_r MNM_son_mx MNM_daughter_mx Mnospouse_SD Mnospouse_SorD M_nosps_DIL2_r



*******recoding of demographic variables
***self rated health
gen health=.
replace health=1 if (v501==5)
replace health=2 if (v501==4)
replace health=3 if (v501==3)
replace health=4 if (v501==2)
replace health=5 if (v501==1)
label variable health "health rating of the adult"
label define health_i 5 "excellent" 4 "very good" 3 "good" 2 "fair" 1 "poor"
label values health health_i

gen health_r=.
replace health_r= 1 if (health==1 | health==2)
replace health_r=0 if (health==3 | health==4 | health==5)
label variable health_r "health rating recoded"
label define health_r_i 0 "good health" 1 "poor health"
label values health_r health_r_i

egen poor_health= max (health_r), by (uid)
label variable poor_health "HH has atleast one adult who is in poor health"
label define poor_health_i 0 "healthy adults" 1 "unhealthy adults"
label values poor_health poor_health_i

***health compared to 12 months back

gen health12=.
replace health12= 1 if (v502==1)
replace health12= 2 if (v502==2)
replace health12= 3 if (v502==3)
label variable health12 "health compared to 12 months back"
label define health12_i 1 "better" 2 "same" 3 "worse" 
label values health12 health12_i

egen health12_poor= max (health12), by (uid)
label variable health12_poor "compared to 12 months back HH atleast one adult worse health"
label variable health12_poor "health compared to 12 months back"
label define health12_poor_i 1 "better" 2 "same" 3 "worse" 
label values health12_poor health12_poor_i


gen worse_h=.
replace worse_h=1 if (health12_poor==3)
replace worse_h=0 if (health12_poor==2)
replace worse_h=0 if (health12_poor==1)
label variable worse_h "compared to 12 months back HH atleast one adult worse health"
label variable worse_h "worse health compared to 12 months back"
label define worse_h_i 1 "worse" 0 "better or same"
label values worse_h worse_h_i


***income

recode v302 (.= 0)

gen income_adult=0
replace income_adult= v302

gen income_a1= 0
replace income_a1= income_adult if (vline==1)
egen income_a1r= max (income_a1), by (uid)

gen income_a2= 0
replace income_a2= income_adult if (vline==2)
egen income_a2r= max (income_a2), by (uid)


gen income_a3= 0
replace income_a3= income_adult if (vline==3)
egen income_a3r= max (income_a3), by (uid)


gen income_a4= 0
replace income_a4= income_adult if (vline==4)
egen income_a4r= max (income_a4), by (uid)

gen income_a5= 0
replace income_a5= income_adult if (vline==5)
egen income_a5r= max (income_a5), by (uid)

gen income_a6= 0
replace income_a6= income_adult if (vline==6)
egen income_a6r= max (income_a6), by (uid)

gen income_a7= 0
replace income_a7= income_adult if (vline==7)
egen income_a7r= max (income_a7), by (uid)

gen income_a8= 0
replace income_a8= income_adult if (vline==8)
egen income_a8r= max (income_a8), by (uid)

gen income_a9= 0
replace income_a9= income_adult if (vline==9)
egen income_a9r= max (income_a9), by (uid)

gen income_a10= 0
replace income_a10= income_adult if (vline==10)
egen income_a10r= max (income_a10), by (uid)

gen income_a11= 0
replace income_a11= income_adult if (vline==11)
egen income_a11r= max (income_a11), by (uid)

gen income_a12= 0
replace income_a12= income_adult if (vline==12)
egen income_a12r= max (income_a12), by (uid)

gen income_a13= 0
replace income_a13= income_adult if (vline==13)
egen income_a13r= max (income_a13), by (uid)

gen income_a14= 0
replace income_a14= income_adult if (vline==14)
egen income_a14r= max (income_a14), by (uid)

gen income_a16= 0
replace income_a16= income_adult if (vline==16)
egen income_a16r= max (income_a16), by (uid)

gen income_a17= 0
replace income_a17= income_adult if (vline==17)
egen income_a17r= max (income_a17), by (uid)

gen income_a20= 0
replace income_a20= income_adult if (vline==20)
egen income_a20r= max (income_a20), by (uid)

egen row_total_income= rowtotal (income_a1r income_a2r income_a3r income_a4r income_a5r income_a6r income_a7r income_a8r income_a9r income_a10r income_a11r income_a12r income_a13r income_a14r income_a16r income_a17r income_a20r)
label variable row_total_income "max income of adult >60's income in the HH"

***contribution to household income

recode v304 (.=0)

gen contribute=0
replace contribute=1 if (v302 > 0 & v303==1)
label variable contribute "HH adult with income who contribute to HH exp"
label define contribute_i 1 "yes" 0 "no"
label values contribute contribute_i

egen contribute_max= max (contribute), by (uid)
label variable contribute_max "atleast one HH adult with income who contributes to HH exp"
label define contribute_max_i 1 "yes" 0 "no"
label values contribute_max contribute_max_i

****purpose of contribution
*day-to-day expenditure

gen daily_expense=0
replace daily_expense=1 if (v306a==1)
label variable daily_expense "contribute daily expense"
label define daily_expense_i 1 "yes" 0 "no"
label values daily_expense daily_expense_i

egen daily_expense_max= max (daily_expense), by (uid)
label variable daily_expense_max "at least one HH elderly contributes to HH daily expense"
label define daily_expense_max_i 1 "yes" 0 "no"
label values daily_expense_max daily_expense_max_i

*education expenditure

gen edu_expense=0
replace edu_expense=1 if (v306b==1)
label variable edu_expense "contribute to HH education"
label define edu_expense_i 1 "yes" 0 "no"
label values edu_expense edu_expense_i

egen edu_expense_max= max (edu_expense), by (uid)
label variable edu_expense_max "at least one HH elderly contributes to HH edu"
label define edu_expense_max_i 1 "yes" 0 "no"
label values edu_expense_max edu_expense_max_i

*medical expenditure

gen med_expense=0
replace med_expense=1 if (v306c==1)
label variable med_expense "contribute to med in HH"
label define med_expense_i 1 "yes" 0 "no"
label values med_expense med_expense_i

egen med_expense_max= max (med_expense), by (uid)
label variable med_expense_max "at least one HH elderly contributes to HH med"
label define med_expense_max_i 1 "yes" 0 "no"
label values med_expense_max med_expense_max_i


*medical expenditure

gen save_expense=0
replace save_expense=1 if (v306d==1)
label variable save_expense "contribute to savings in HH"
label define save_expense_i 1 "yes" 0 "no"
label values save_expense save_expense_i

egen save_expense_max= max (save_expense), by (uid)
label variable save_expense_max "at least one HH elderly contributes to HH savings"
label define save_expense_max_i 1 "yes" 0 "no"
label values save_expense_max save_expense_max_i

*loan payment

gen loan_expense=0
replace loan_expense=1 if (v306e==1)
label variable loan_expense "contribute to loan payment in HH"
label define loan_expense_i 1 "yes" 0 "no"
label values loan_expense loan_expense_i

egen loan_expense_max= max (loan_expense), by (uid)
label variable loan_expense_max "at least one HH elderly contributes to HH loan"
label define loan_expense_max_i 1 "yes" 0 "no"
label values loan_expense_max loan_expense_max_i

*social payment

gen soc_expense=0
replace soc_expense=1 if (v306f==1)
label variable soc_expense "contribute to social payment in HH"
label define soc_expense_i 1 "yes" 0 "no"
label values soc_expense soc_expense_i

egen soc_expense_max= max (soc_expense), by (uid)
label variable soc_expense_max "at least one HH elderly contributes to HH soc payment"
label define soc_expense_max_i 1 "yes" 0 "no"
label values soc_expense_max soc_expense_max_i

*social payment

gen other_expense=0
replace other_expense=1 if (v306g==1)
label variable other_expense "contribute to other HH payment"
label define other_expense_i 1 "yes" 0 "no"
label values other_expense other_expense_i

egen other_expense_max= max (other_expense), by (uid)
label variable other_expense_max "at least one HH elderly contributes to other HH payment"
label define other_expense_max_i 1 "yes" 0 "no"
label values other_expense_max other_expense_max_i

***total number of contributions

egen total_contribution= rowtotal (daily_expense edu_expense med_expense save_expense loan_expense soc_expense other_expense)
egen total_contribute= max (total_contribution), by (uid)
label variable total_contribute "total number of areas contributed by elderly"

*******Primary dependence on SPOUSE ********************************************************
gen spouse_depend=0
replace spouse_depend=1 if (v308aa==1 & v308ab==1)
label variable spouse_depend "primary dependence on spouse"
label define spouse_depend_i 1 "yes" 0 "no"
label values spouse_depend spouse_depend_i

egen sps_depend_mx= max (spouse_depend), by (uid)
label variable sps_depend_mx "At least one primaryly dependent on sps"

*gender of the person primary dependent on spouse (female)

gen spouse_depend_F=0
replace spouse_depend_F=1 if (spouse_depend==1 & v103==2 & v105>59)
label variable spouse_depend_F "Female elderly above age 59 dependent on spouse"
label define spouse_depend_F_i 1 "yes" 0 "no"
label values spouse_depend_F spouse_depend_F_i

egen spouse_dependF= max (spouse_depend_F), by (uid)
label variable spouse_dependF "Female elderly above age 59 dependent on spouse"
label define spouse_dependF_i 1 "yes" 0 "no"
label values spouse_dependF spouse_dependF_i

*Gender of the person primary dependent on spouse (Male)

gen spouse_depend_M=0
replace spouse_depend_M=1 if (spouse_depend==1 & v103==1 & v105>59)
label variable spouse_depend_M "Male elderly above age 59 dependent on spouse"
label define spouse_depend_M_i 1 "yes" 0 "no"
label values spouse_depend_M spouse_depend_M_i

egen spouse_dependM= max (spouse_depend_M), by (uid)
label variable spouse_dependM "Male elderly above age 59 dependent on spouse"
label define spouse_dependM_i 1 "yes" 0 "no"
label values spouse_dependM spouse_dependM_i

**secondary dependence on spouse
gen sps_depend_2=0
replace sps_depend_2= 1 if (v308aa==1 & v308ab >=2)
label variable sps_depend_2 "secondary dependence on spouse"
label define sps_depend_2_i 1 "yes" 0 "no"
label values sps_depend_2 sps_depend_2_i

egen sps_depend_2_mx= max (sps_depend_2), by (uid)
label variable sps_depend_2_mx "At least one secondary dependence on sps"
label define sps_depend_2_mx_i 1 "yes" 0 "no"
label values sps_depend_2_mx sps_depend_2_mx_i

*gender of the person secondary dependent on spouse (female)

gen spouse_2depend_F=0
replace spouse_2depend_F=1 if (sps_depend_2==1 & v103==2 & v105>59)
label variable spouse_2depend_F "Female elderly above age 59 secondary dependance on spouse"
label define spouse_2depend_F_i 1 "yes" 0 "no"
label values spouse_2depend_F spouse_2depend_F_i

egen spouse_depend_2F= max (spouse_2depend_F), by (uid)
label variable spouse_depend_2F "Female elderly above age 59 secondary dependent on spouse"
label define spouse_depend_2F_i 1 "yes" 0 "no"
label values spouse_depend_2F spouse_depend_2F_i

*Gender of the person secondary dependent on spouse (Male)

gen spouse_depend_2M=0
replace spouse_depend_2M=1 if (sps_depend_2==1 & v103==1 & v105>59)
label variable spouse_depend_2M "Male elderly above age 59 secondary dependent on spouse"
label define spouse_depend_2M_i 1 "yes" 0 "no"
label values spouse_depend_2M spouse_depend_2M_i

egen spouse_depend2M= max (spouse_depend_2M), by (uid)
label variable spouse_depend2M "Male elderly above age 59 secondary dependent on spouse"
label define spouse_depend2M_i 1 "yes" 0 "no"
label values spouse_depend2M spouse_depend2M_i

***********dependent on SON ***************************************************

gen depend_son=0
replace depend_son=1 if (v308ba==1 & v308bb==1)
label variable depend_son "primary dependence on son"
label define depend_son_i 1 "yes" 0 "no"
label values depend_son depend_son_i

egen depend_son_mx= max (depend_son), by (uid)
label variable depend_son_mx "At least one primaryly dependent on son"
label define depend_son_mx_i 1 "yes" 0 "no"
label values depend_son_mx depend_son_mx_i


*gender of the person primary dependent on son (female)

gen son_depend_F=0
replace son_depend_F=1 if (depend_son==1 & v103==2 & v105>59)
label variable son_depend_F "Female elderly above age 59 dependent on son"
label define son_depend_F_i 1 "yes" 0 "no"
label values son_depend_F son_depend_F_i

egen son_dependF= max (son_depend_F), by (uid)
label variable son_dependF "Female elderly above age 59 dependent on son"
label define son_dependF_i 1 "yes" 0 "no"
label values son_dependF son_dependF_i

*Gender of the person primary dependent on son (Male)

gen son_depend_M=0
replace son_depend_M=1 if (depend_son==1 & v103==1 & v105>59)
label variable son_depend_M "Male elderly above age 59 dependent on son"
label define son_depend_M_i 1 "yes" 0 "no"
label values son_depend_M son_depend_M_i

egen son_dependM= max (son_depend_M), by (uid)
label variable son_dependM "Male elderly above age 59 dependent on son"
label define son_dependM_i 1 "yes" 0 "no"
label values son_dependM son_dependM_i

**secondary dependence on SON**
gen son_depend_2=0
replace son_depend_2= 1 if (v308ba==1 & v308bb >=2)
label variable son_depend_2 "secondary dependence on son"
label define son_depend_2_i 1 "yes" 0 "no"
label values son_depend_2 son_depend_2_i

egen son_depend_2_mx= max (son_depend_2), by (uid)
label variable son_depend_2_mx "At least one secondary dependence on son"
label define son_depend_2_mx_i 1 "yes" 0 "no"
label values son_depend_2_mx son_depend_2_mx_i

*gender of the person secondary dependent on son (female)

gen son_2depend_F=0
replace son_2depend_F=1 if (son_depend_2==1 & v103==2 & v105>59)
label variable son_2depend_F "Female elderly above age 59 secondary dependance on son"
label define son_2depend_F_i 1 "yes" 0 "no"
label values son_2depend_F son_2depend_F_i

egen son_depend_2F= max (son_2depend_F), by (uid)
label variable son_depend_2F "Female elderly above age 59 secondary dependent on spouse"
label define son_depend_2F_i 1 "yes" 0 "no"
label values son_depend_2F son_depend_2F_i

*Gender of the person secondary dependent on son (Male)

gen son_depend_2M=0
replace son_depend_2M=1 if (son_depend_2==1 & v103==1 & v105>59)
label variable son_depend_2M "Male elderly above age 59 secondary dependent on son"
label define son_depend_2M_i 1 "yes" 0 "no"
label values son_depend_2M son_depend_2M_i

egen son_depend2M= max (son_depend_2M), by (uid)
label variable son_depend2M "Male elderly above age 59 secondary dependent on son"
label define son_depend2M_i 1 "yes" 0 "no"
label values son_depend2M son_depend2M_i

*************************dependence on DAUGHTER**********************************************

gen depend_daughter=0
replace depend_daughter=1 if (v308ca==1 & v308cb==1)
label variable depend_daughter "primary dependence on daughter"
label define depend_daughter_i 1 "yes" 0 "no"
label values depend_daughter depend_daughter_i

egen depend_daughter_mx= max (depend_daughter), by (uid)
label variable depend_daughter_mx "At least one primaryly dependent on daughter"
label define depend_daughter_mx_i 1 "yes" 0 "no"
label values depend_daughter_mx depend_daughter_mx_i


*gender of the perdaughter primary dependent on daughter (female)

gen daughter_depend_F=0
replace daughter_depend_F=1 if (depend_daughter==1 & v103==2 & v105>59)
label variable daughter_depend_F "Female elderly above age 59 dependent on daughter"
label define daughter_depend_F_i 1 "yes" 0 "no"
label values daughter_depend_F daughter_depend_F_i

egen daughter_dependF= max (daughter_depend_F), by (uid)
label variable daughter_dependF "Female elderly above age 59 dependent on daughter"
label define daughter_dependF_i 1 "yes" 0 "no"
label values daughter_dependF daughter_dependF_i

*Gender of the person primary dependent on daughter (Male)

gen daughter_depend_M=0
replace daughter_depend_M=1 if (depend_daughter==1 & v103==1 & v105>59)
label variable daughter_depend_M "Male elderly above age 59 dependent on daughter"
label define daughter_depend_M_i 1 "yes" 0 "no"
label values daughter_depend_M daughter_depend_M_i

egen daughter_dependM= max (daughter_depend_M), by (uid)
label variable daughter_dependM "Male elderly above age 59 dependent on daughter"
label define daughter_dependM_i 1 "yes" 0 "no"
label values daughter_dependM daughter_dependM_i

**secondary dependence on daughter**
gen daughter_depend_2=0
replace daughter_depend_2= 1 if (v308ca==1 & v308cb >=2)
label variable daughter_depend_2 "secondary dependence on daughter"
label define daughter_depend_2_i 1 "yes" 0 "no"
label values daughter_depend_2 daughter_depend_2_i

egen daughter_depend_2_mx= max (daughter_depend_2), by (uid)
label variable daughter_depend_2_mx "At least one secondary dependence on daughter"
label define daughter_depend_2_mx_i 1 "yes" 0 "no"
label values daughter_depend_2_mx daughter_depend_2_mx_i

*gender of the person secondary dependent on daughter (female)

gen daughter_2depend_F=0
replace daughter_2depend_F=1 if (daughter_depend_2==1 & v103==2 & v105>59)
label variable daughter_2depend_F "Female elderly above age 59 secondary dependance on daughter"
label define daughter_2depend_F_i 1 "yes" 0 "no"
label values daughter_2depend_F daughter_2depend_F_i

egen daughter_depend_2F= max (daughter_2depend_F), by (uid)
label variable daughter_depend_2F "Female elderly above age 59 secondary dependent on spouse"
label define daughter_depend_2F_i 1 "yes" 0 "no"
label values daughter_depend_2F daughter_depend_2F_i

*Gender of the person secondary dependent on daughter (Male)

gen daughter_depend_2M=0
replace daughter_depend_2M=1 if (daughter_depend_2==1 & v103==1 & v105>59)
label variable daughter_depend_2M "Male elderly above age 59 secondary dependent on daughter"
label define daughter_depend_2M_i 1 "yes" 0 "no"
label values daughter_depend_2M daughter_depend_2M_i

egen daughter_depend2M= max (daughter_depend_2M), by (uid)
label variable daughter_depend2M "Male elderly above age 59 secondary dependent on daughter"
label define daughter_depend2M_i 1 "yes" 0 "no"
label values daughter_depend2M daughter_depend2M_i


*********FINANCIAL DEPENDENCE ON CHILDREN ***************************************

gen depend_child=0
replace depend_child=1 if (depend_son==1 | depend_daughter==1)
label variable depend_child "primary dependence on children"
label define depend_child_i 1 "yes" 0 "no"
label values depend_child depend_child_i


egen depend_child_mx= max (depend_child), by (uid)
label variable depend_child_mx "At least one primaryly dependent on children"
label define depend_child_mx_i 1 "yes" 0 "no"
label values depend_child_mx depend_child_mx_i


**********************PRIMARY FINANCIAL DEPENDENCE ON OTHERS (SON-IN-LAW, DAUGHTER-IN-LAW, GRANDSON, GRAND-DAUGHTER, OTHER RELATIVE, FRIENDS, NGO, COMMUNITY, OTHER)

gen depend_soninlaw=0
replace depend_soninlaw=1 if (v308da==1 & v308db==1)

gen depend_daughinlaw=0
replace depend_daughinlaw=1 if (v308ea==1 & v308eb==1)

gen depend_grandson=0
replace depend_grandson=1 if (v308fa==1 & v308fb==1)

gen depend_granddaughter=0
replace depend_granddaughter=1 if (v308ga==1 & v308gb==1)

gen depend_otherrel=0
replace depend_otherrel=1 if (v308ha==1 & v308hb==1)

gen depend_friend=0
replace depend_friend=1 if (v308ia==1 & v308ib==1)

gen depend_ngo=0
replace depend_ngo=1 if (v308ja==1 & v308jb==1)

gen depend_community=0
replace depend_community=1 if (v308ka==1 & v308kb==1)

gen depend_other=0
replace depend_other=1 if (v308la==1 & v308lb==1)

egen dependence_other= rowtotal (depend_soninlaw depend_daughinlaw depend_grandson depend_granddaughter depend_otherrel depend_friend depend_community depend_other)
label variable dependence_other "# no of other people elderly >59 dependent finance"

egen dependence_other_mx= max (dependence_other), by (uid)
label variable dependence_other_mx "# no of other people elderly >59 dependent finance"

*************************************SECONDARY FINANCIAL DEPENDENCE ON OTHERS (SON-IN-LAW, DAUGHTER-IN-LAW, GRANDSON, GRAND-DAUGHTER, OTHER RELATIVE, FRIENDS, NGO, COMMUNITY, OTHER)

gen depend_soninlaw2=0
replace depend_soninlaw2=1 if (v308da==1 & v308db > 1)

gen depend_daughinlaw2=0
replace depend_daughinlaw2=1 if (v308ea==1 & v308eb >1)

gen depend_grandson2=0
replace depend_grandson2=1 if (v308fa==1 & v308fb>1)

gen depend_granddaughter2=0
replace depend_granddaughter2=1 if (v308ga==1 & v308gb>1)

gen depend_otherrel2=0
replace depend_otherrel2=1 if (v308ha==1 & v308hb>1)

gen depend_friend2=0
replace depend_friend2=1 if (v308ia==1 & v308ib>1)

gen depend_ngo2=0
replace depend_ngo2=1 if (v308ja==1 & v308jb>1)

gen depend_community2=0
replace depend_community2=1 if (v308ka==1 & v308kb>1)

gen depend_other2=0
replace depend_other2=1 if (v308la==1 & v308lb>1)

egen dependence_other2= rowtotal (depend_soninlaw2 depend_daughinlaw2 depend_grandson2 depend_granddaughter2 depend_otherrel2 depend_friend2 depend_community2 depend_other2)
label variable dependence_other2 "# no of other people elderly >59 SECOND dependent finance"

egen dependence_other2_mx= max (dependence_other2), by (uid)
label variable dependence_other2_mx "# no of other people elderly >59 SECOND dependent finance"


****PRIMARY DEPENDENCE ON OTHERS*****

gen other=0
replace other= 1 if (depend_soninlaw==1 | depend_daughinlaw==1 | depend_grandson==1 | depend_granddaughter==1 | depend_otherrel==1 | depend_friend==1 | depend_community==1 | depend_other==1)
label variable other "Elderly >59 primarily dependent on others financially"

egen other_max= max (other), by (uid)
label variable other_max "Elderly >59 primarily dependent on others financially"

******wealth & assets
gen v310_01r=.
replace v310_01r= 0 if (v310_01==3)
replace v310_01r= 0 if (v310_01==1)
replace v310_01r= 1 if (v310_01==2)

gen v310_02r=.
replace v310_02r= 0 if (v310_02==3)
replace v310_02r= 0 if (v310_02==1)
replace v310_02r= 1 if (v310_02==2)

gen v310_03r=.
replace v310_03r= 0 if (v310_03==3)
replace v310_03r= 0 if (v310_03==1)
replace v310_03r= 1 if (v310_03==2)

gen v310_04r=.
replace v310_04r= 0 if (v310_04==3)
replace v310_04r= 0 if (v310_04==1)
replace v310_04r= 1 if (v310_04==2)

gen v310_05r=.
replace v310_05r= 0 if (v310_05==3)
replace v310_05r= 0 if (v310_05==1)
replace v310_05r= 1 if (v310_05==2)

gen v310_06r=.
replace v310_06r= 0 if (v310_06==3)
replace v310_06r= 0 if (v310_06==1)
replace v310_06r= 1 if (v310_06==2)

gen v310_07r=.
replace v310_07r= 0 if (v310_07==3)
replace v310_07r= 0 if (v310_07==1)
replace v310_07r= 1 if (v310_07==2)

gen v310_08r=.
replace v310_08r= 0 if (v310_08==3)
replace v310_08r= 0 if (v310_08==1)
replace v310_08r= 1 if (v310_08==2)

gen v310_09r=.
replace v310_09r= 0 if (v310_09==3)
replace v310_09r= 0 if (v310_09==1)
replace v310_09r= 1 if (v310_09==2)

gen v310_10r=.
replace v310_10r= 0 if (v310_08==3)
replace v310_10r= 0 if (v310_08==1)
replace v310_10r= 1 if (v310_08==2)

gen own_asset=0
replace own_asset=1 if (v310_01r==1 | v310_02==1 | v310_03r==1 | v310_04r==1 | v310_05r==1 | v310_06r==1 | v310_07r==1 | v310_08r==1 | v310_09==1 | v310_10r==1)


**asset ownership by gender
gen own_asset_F=0
replace own_asset_F=1 if (own_asset==1 & v103==2 & v105>59)

egen own_asset_F_mx = max (own_asset_F), by (uid)
label variable own_asset_F_mx "Asset owned by elderly women in HH"
label define own_asset_F_mx_i 1 "yes" 0 "no"
label values own_asset_F_mx own_asset_F_mx_i

gen own_asset_M=0
replace own_asset_M=1 if (own_asset==1 & v103==1 & v105>59)

egen own_asset_M_mx = max (own_asset_M), by (uid)
label variable own_asset_M_mx "Asset owned by elderly men in HH"
label define own_asset_M_mx_i 1 "yes" 0 "no"
label values own_asset_M_mx own_asset_M_mx_i

******asset nominated
gen v312_01r=0
replace v312_01r= 1 if (v312_01==1)

gen v312_02r=0
replace v312_02r= 1 if (v312_02==1)

gen v312_03r=0
replace v312_03r= 1 if (v312_03==1)

gen v312_04r=0
replace v312_04r= 1 if (v312_04==1)

gen v312_05r=0
replace v312_05r= 1 if (v312_05==1)

gen v312_06r=0
replace v312_06r= 1 if (v312_06==1)

gen v312_07r=0
replace v312_07r= 1 if (v312_07==1)

gen v312_08r=0
replace v312_08r= 1 if (v312_08==1)

gen v312_09r=0
replace v312_09r= 1 if (v312_09==1)

gen v312_10r=0
replace v312_10r= 1 if (v312_10==1)

gen asset_nominate= 0
replace asset_nominate=1 if (v312_01r==1 | v312_02r==1 | v312_03r==1 | v312_04r==1 | v312_05r==1 | v312_06r==1 | v312_07r==1 | v312_08r==1 | v312_09r==1 | v312_10r==1)
label variable asset_nominate "Asset nominated"
label define asset_nominate_i 1 "yes" 0 "no"
label values asset_nominate asset_nominate_i

egen asset_nominate_mx= max (asset_nominate), by (uid)
label variable asset_nominate_mx "Asset nominated"
label define asset_nominate_mx_i 1 "yes" 0 "no"
label values asset_nominate_mx asset_nominate_mx_i

***gender of the person WHO nominated
gen asset_nominate_F=0
replace asset_nominate_F=1 if (asset_nominate==1 & v103==2 & v105>59)

egen asset_nominate_F_mx = max (asset_nominate_F), by (uid)
label variable asset_nominate_F_mx "Asset nominated by elderly women in HH"
label define asset_nominate_F_mx_i 1 "yes" 0 "no"
label values asset_nominate_F_mx asset_nominate_F_mx_i

gen asset_nominate_M=0
replace asset_nominate_M=1 if (asset_nominate==1 & v103==1 & v105>59)

egen asset_nominate_M_mx = max (asset_nominate_M), by (uid)
label variable asset_nominate_M_mx "Asset nominated by elderly men in HH"
label define asset_nominate_M_mx_i 1 "yes" 0 "no"
label values asset_nominate_M_mx asset_nominate_M_mx_i


******Whom asset nominated

gen nominate_sps=0
replace nominate_sps=1 if (v313_01==1 | v313_02==1 | v313_03==1 | v313_04==1 | v313_05==1 | v313_06==1 | v313_07==1 | v313_08==1 | v313_09==1 |v313_10==1)

egen nominate_sps_mx= max (nominate_sps), by (uid)
label variable nominate_sps_mx "Asset nominated to sps"
label define nominate_sps_mx_i 1 "yes" 0 "no"
label values nominate_sps_mx nominate_sps_mx_i

gen nominate_child=0
replace nominate_child=1 if (v313_01==2 | v313_02==2 | v313_03==2 | v313_04==2 | v313_05==2 | v313_06==2 | v313_07==2 | v313_08==2 | v313_09==2 |v313_10==2)

egen nominate_child_mx= max (nominate_child), by (uid)
label variable nominate_child_mx "Asset nominated to child"
label define nominate_child_mx_i 1 "yes" 0 "no"
label values nominate_child_mx nominate_child_mx_i


gen nominate_sps_child=0
replace nominate_sps_child=1 if (v313_01==4 | v313_02==4 | v313_03==4 | v313_04==4 | v313_05==4 | v313_06==4 | v313_07==4 | v313_08==4 | v313_09==4 |v313_10==4)

egen nominate_sps_child_mx= max (nominate_sps_child), by (uid)
label variable nominate_sps_child_mx "Asset nominated to sps & child"
label define nominate_sps_child_mx_i 1 "yes" 0 "no"
label values nominate_sps_child_mx nominate_sps_child_mx_i

gen nominate_sps_child_o=0
replace nominate_sps_child_o=1 if (v313_01==5 | v313_02==5 | v313_03==5 | v313_04==5 | v313_05==5 | v313_06==5 | v313_07==5 | v313_08==5 | v313_09==5 |v313_10==5)

egen nominate_sps_child_o_mx= max (nominate_sps_child_o), by (uid)
label variable nominate_sps_child_o_mx "Asset nominated to sps/ child/ other"
label define nominate_sps_child_o_mx_i 1 "yes" 0 "no"
label values nominate_sps_child_o_mx nominate_sps_child_o_mx_i


gen atleast_child=0
replace atleast_child=1 if (nominate_child==1 | nominate_sps_child==1 | nominate_sps_child_o==1)


egen atleast_child_mx= max (atleast_child), by (uid)
label variable atleast_child_mx "Asset nominated to child at least"
label define atleast_child_mx_i 1 "yes" 0 "no"
label values atleast_child_mx atleast_child_mx_i

*****asset trasferred
gen v314_01r=0
replace v314_01r= 1 if (v314_01==1)

gen v314_02r=0
replace v314_02r= 1 if (v314_02==1)

gen v314_03r=0
replace v314_03r= 1 if (v314_03==1)

gen v314_04r=0
replace v314_04r= 1 if (v314_04==1)

gen v314_05r=0
replace v314_05r= 1 if (v314_05==1)

gen v314_06r=0
replace v314_06r= 1 if (v314_06==1)

gen v314_07r=0
replace v314_07r= 1 if (v314_07==1)

gen v314_08r=0
replace v314_08r= 1 if (v314_08==1)

gen v314_09r=0
replace v314_09r= 1 if (v314_09==1)

gen v314_10r=0
replace v314_10r= 1 if (v314_10==1)

gen asset_transfer= 0
replace asset_transfer=1 if (v314_01r==1 | v314_02r==1 | v314_03r==1 | v314_04r==1 | v314_05r==1 | v314_06r==1 | v314_07r==1 | v314_08r==1 | v314_09r==1 | v314_10r==1)

egen asset_transfer_mx= max (asset_transfer), by (uid)
label variable asset_transfer_mx "Asset transferred"
label define asset_transfer_mx_i 1 "yes" 0 "no"
label values asset_transfer_mx asset_transfer_mx_i

*****whom asset transferred
gen transfer_sps=0
replace transfer_sps=1 if (v315_01==1 | v315_02==1 | v315_03==1 | v315_04==1 | v315_05==1 | v315_06==1 | v315_07==1 | v315_08==1 | v315_09==1 |v315_10==1)

egen transfer_sps_mx= max (transfer_sps), by (uid)
label variable transfer_sps_mx "Asset transferred to sps"
label define transfer_sps_mx_i 1 "yes" 0 "no"
label values transfer_sps_mx transfer_sps_mx_i

gen transfer_child=0
replace transfer_child=1 if (v315_01==2 | v315_01==3 | v315_02==2 | v315_02==3| v315_03==2 | v315_03==3 | v315_04==2 | v315_04==3 | v315_05==2 | v315_05==3 | v315_06==2 | v315_06== 3| v315_07==2 | v315_07==3 | v315_08==2 | v315_08==3 | v315_09==2 | v315_09==3 | v315_10==2 | v315_10==3)

egen transfer_child_mx= max (transfer_child), by (uid)
label variable transfer_child_mx "Asset transferred to child"
label define transfer_child_mx_i 1 "yes" 0 "no"
label values transfer_child_mx transfer_child_mx_i

*gen transfer_other=0
*replace transfer_other=1 if (v315_01 > 3 | v315_02 > 3 | v315_03 > 3 | v315_04 > 3 | v315_05 > 3 | v315_06 > 3 | v315_07 > 3 | v315_08 > 3 | v315_09 > 3 |v315_10 > 3)


*****disability****
gen vision=0
replace vision=1 if (v559_1==1 | v559_1==2)

gen hear=0
replace hear=1 if (v559_2==1 | v559_2==2)

gen walk=0
replace walk=1 if (v559_3==1 | v559_3==2)

gen chew=0
replace chew=1 if (v559_4==1 | v559_4==2)

gen speech=0
replace speech=1 if (v559_5==1 | v559_5==2)

gen memory=0
replace memory=1 if (v559_6==1 | v559_6==2)

egen total_disability= rowtotal (vision hear walk chew speech memory)

gen disability=0
replace disability= 1 if (total_disability >=1)

egen disability_mx= max (disability), by (uid)
label variable disability_mx "HH has atleast one adult with disability"
label define disability_mx_i 1 "yes" 0 "no"
label values disability_mx disability_mx_i

***gender of disb adult

gen disability_F=0
replace disability_F=1 if (disability==1 & v103==2 & v105>59)
egen disability_F_mx= max (disability_F), by (uid)
label variable disability_F_mx "HH female elderly with disability"
label define disability_F_mx_i 1 "yes" 0 "no"
label values disability_F_mx disability_F_mx_i

gen disability_M=0
replace disability_M=1 if (disability==1 & v103==1 & v105>59)
egen disability_M_mx= max (disability_M), by (uid)
label variable disability_M_mx "HH male elderly with disability"
label define disability_M_mx_i 1 "yes" 0 "no"
label values disability_M_mx disability_M_mx_i

gen both_disb=0
replace both_disb=1 if (disability_F_mx==1 & disability_M_mx==1)
label variable both_disb "HH elderly male and female both disb"
label define both_disb_i 1 "yes" 0 "no"
label values both_disb both_disb_i

gen either_disb=0
replace either_disb=1 if (disability_F_mx==1 | disability_M_mx==1)
label variable either_disb "Either HH elderly male or female disb"
label define either_disb_i 1 "yes" 0 "no"
label values either_disb either_disb_i


****caregiving


***HH elderly currently working 

gen work1=0
replace work1=1 if (hv112_01==1 & hv105_01>59)

gen work2=0
replace work2=1 if (hv112_02==1 & hv105_02>59)

*gen work3=0
*replace work3=1 if (hv112_03==1 & hv105_03>59)

gen work4=0
replace work4=1 if (hv112_04==1 & hv105_04>59)

gen work5=0
replace work5=1 if (hv112_05==1 & hv105_05>59)

gen work6=0
replace work6=1 if (hv112_06==1 & hv105_06>59)

gen work7=0
replace work7=1 if (hv112_07==1 & hv105_07>59)

gen work8=0
replace work8=1 if (hv112_08==1 & hv105_08>59)

gen work9=0
replace work9=1 if (hv112_09==1 & hv105_09>59)

gen work10=0
replace work10=1 if (hv112_10==1 & hv105_10>59)

gen work11=0
replace work11=1 if (hv112_11==1 & hv105_11>59)

gen work12=0
replace work12=1 if (hv112_12==1 & hv105_12>59)

gen work13=0
replace work13=1 if (hv112_13==1 & hv105_13>59)

gen work14=0
replace work14=1 if (hv112_14==1 & hv105_14>59)

gen work16=0
replace work16=1 if (hv112_16==1 & hv105_16>59)

gen work17=0
replace work17=1 if (hv112_17==1 & hv105_17>59)

gen work20=0
replace work20=1 if (hv112_20==1 & hv105_20>59)

egen total_work_adult= rowtotal (work1 work2 work4 work5 work6 work7 work8 work9 work10 work11 work12 work13 work14 work16 work17 work20)
egen total_work_adult_mx= max (total_work_adult), by (uid)
label variable total_work_adult "total number of elderly working in HH"

gen work_adult=0
replace work_adult=1 if (total_work_adult_mx>=1)
label variable work_adult "HH's with working elderly"
label define work_adult_i 1 "yes" 0 "no"
label values work_adult work_adult_i

****ADL

gen bath=0
replace bath=1 if (v505_1==2 | v505_1==3)
label variable bath "need assistance with bath"
label define bath_i 1 "yes" 0 "no"
label values bath bath_i

gen dress=0
replace dress=1 if (v505_2==2 | v505_2==3)
label variable dress "need assistance with dressing"
label define dress_i 1 "yes" 0 "no"
label values dress dress_i

gen toilet=0
replace toilet=1 if (v505_3==2 | v505_3==3)
label variable toilet "need assistance with toilet"
label define toilet_i 1 "yes" 0 "no"
label values toilet toilet_i

gen mobility=0
replace mobility=1 if (v505_4==2 | v505_4==3)
label variable mobility "need assistance with mobility"
label define mobility_i 1 "yes" 0 "no"
label values mobility mobility_i

gen continence=0
replace continence=1 if (v505_5==2 | v505_5==3)
label variable continence "need assistance with continence"
label define continence_i 1 "yes" 0 "no"
label values continence continence_i

gen feed=0
replace feed=1 if (v505_6==2 | v505_6==3)
label variable feed "need assistance with feeding"
label define feed_i 1 "yes" 0 "no"
label values feed feed_i

egen ADL= rowtotal (bath dress toilet mobility continence feed)

gen ADL_r=0
replace ADL_r=1 if (bath==1 | dress==1 | toilet==1 | mobility==1 | continence==1 | feed==1)

egen ADL_mx= max (ADL_r), by (uid)
label variable ADL_mx "atleast one adult with ADL needs"
label define ADL_mx_i 1 "yes" 0 "no"
label values ADL_mx ADL_mx_i

egen avg_ADL= mean (ADL), by (uid)
label variable avg_ADL "avg ADL needs of elderly in the HH"

**gender of ADL adult
gen ADL_F= 0
replace ADL_F= 1 if (ADL_r==1 & v103==2 & v105>59)

egen ADL_F_mx= max (ADL_F), by (uid)
label variable ADL_F_mx "ADL need by elderly female"
label define ADL_F_mx_i 1 "yes" 0 "no"
label values ADL_F_mx ADL_F_mx_i

gen ADL_Fr=0
replace ADL_Fr= ADL if (v103==2 & v105>59)
label variable ADL_Fr "female with IADL needs"

egen ADL_Fr_mx= max (ADL_Fr), by (uid)
label variable ADL_Fr_mx "Maximum ADL needs of females in the HH"


gen ADL_M= 0
replace ADL_M= 1 if (ADL_r==1 & v103==1 & v105>59)

egen ADL_M_mx= max (ADL_M), by (uid)
label variable ADL_M_mx "ADL need by elderly male"
label define ADL_M_mx_i 1 "yes" 0 "no"
label values ADL_M_mx ADL_M_mx_i

gen ADL_Mr=0
replace ADL_Mr= ADL if (v103==1 & v105>59)
label variable ADL_Mr "male with ADL needs"

egen ADL_Mr_mx= max (ADL_Mr), by (uid)
label variable ADL_Mr_mx "Maximum ADL needs of males in the HH"

***WHO provides care

gen sps_care=0
replace sps_care=1 if (v506_1==1 | v506_2==1 | v506_3==1 | v506_4==1 | v506_5==1 | v506_6==1)
egen sps_care_mx= max (sps_care), by (uid)
label variable sps_care_mx "sps caregiver"
label define sps_care_mx_i 1 "yes" 0 "no"
label values sps_care_mx sps_care_mx_i

gen sps_care_alt=0
replace sps_care_alt=1 if (v507_1==1 | v507_2==1 | v507_3==1 | v507_4==1 | v507_5==1 | v507_6==1)
egen sps_care_altmx= max (sps_care_alt), by (uid)
label variable sps_care_altmx "sps caregiver alternate"
label define sps_care_altmx_i 1 "yes" 0 "no"
label values sps_care_altmx sps_care_altmx_i

gen child_care=0
replace child_care=1 if (v506_1==2 | v506_1==3 | v506_2==2 | v506_2==3 | v506_3==2 | v506_3==3 | v506_4==2 | v506_4==3 | v506_5==2 | v506_5== 3 | v506_6==2 | v506_6==3)
egen child_care_mx= max (child_care), by (uid)
label variable child_care_mx "child caregiver"
label define child_care_mx_i 1 "yes" 0 "no"
label values child_care_mx child_care_mx_i

gen child_care_alt=0
replace child_care_alt=1 if (v507_1==2 | v507_1==3 | v507_2==2 | v507_2==3 | v507_3==2 | v507_3==3 | v507_4==2 | v507_4==3 | v507_5==2 | v507_5== 3 | v507_6==2 | v507_6==3)
egen child_care_alt_mx= max (child_care_alt), by (uid)
label variable child_care_alt_mx "child caregiver alternate"
label define child_care_alt_mx_i 1 "yes" 0 "no"
label values child_care_alt_mx child_care_alt_mx_i

gen sonDIL_care=0
replace sonDIL_care=1 if (v506_1==4 | v506_2==4 | v506_3==4 | v506_4==4 | v506_5==4 | v506_6==4)
egen sonDIL_care_mx= max (sonDIL_care), by (uid)
label variable sonDIL_care_mx "sonDIL caregiver"
label define sonDIL_care_mx_i 1 "yes" 0 "no"
label values sonDIL_care_mx sonDIL_care_mx_i

gen sonDIL_care_alt=0
replace sonDIL_care_alt=1 if (v507_1==4 | v507_2==4 | v507_3==4 | v507_4==4 | v507_5==4 | v507_6==4)
egen sonDIL_care_alt_mx= max (sonDIL_care), by (uid)
label variable sonDIL_care_alt_mx "sonDIL caregiver alternate"
label define sonDIL_care_alt_mx_i 1 "yes" 0 "no"
label values sonDIL_care_alt_mx sonDIL_care_alt_mx_i

gen child_sonfamily=0
replace child_sonfamily=1 if (child_care==1 | sonDIL_care==1)
egen child_sonfamily_mx= max (child_sonfamily), by (uid)
label variable child_sonfamily_mx "care provided by child and son's family"
label define child_sonfamily_mx_i 1 "yes" 0 "no"
label values child_sonfamily_mx child_sonfamily_mx_i

gen child_sonfamily_alt=0
replace child_sonfamily_alt=1 if (child_care_alt==1 | sonDIL_care_alt==1)
egen child_sonfamily_alt_mx= max (child_sonfamily_alt), by (uid)
label variable child_sonfamily_alt_mx "care provided by child and son's family-alternate"
label define child_sonfamily_alt_mx_i 1 "yes" 0 "no"
label values child_sonfamily_alt_mx child_sonfamily_alt_mx_i

gen otherservant_care=0
replace otherservant_care=1 if (v506_1==5 | v506_1==6 | v506_1==96 | v506_2==5 | v506_2==6 |v506_2==96 | v506_3==5 | v506_3==6 | v506_3==96 | v506_4==5 | v506_4==6 | v506_4==96 | v506_5==5 | v506_5== 6 | v506_5==96 | v506_6==5 | v506_6==6 | v506_6==96)
egen otherservant_care_mx= max (otherservant_care), by (uid)
label variable otherservant_care_mx "other servant caregiver"
label define otherservant_care_mx_i 1 "yes" 0 "no"
label values otherservant_care_mx otherservant_care_mx_i

gen otherservant_care_alt=0
replace otherservant_care_alt=1 if (v507_1==5 | v507_1==6 | v507_1==96 | v507_2==5 | v507_2==6 |v507_2==96 | v507_3==5 | v507_3==6 | v507_3==96 | v507_4==5 | v507_4==6 | v507_4==96 | v507_5==5 | v507_5== 6 | v507_5==96 | v507_6==5 | v507_6==6 | v507_6==96)


egen otherservant_care_alt_mx= max (otherservant_care_alt), by (uid)
label variable otherservant_care_alt_mx "other servant caregiver"
label define otherservant_care_alt_mx_i 1 "yes" 0 "no"
label values otherservant_care_alt_mx otherservant_care_alt_mx_i


*****IADL

gen telephone=0
replace telephone=1 if (v509==0)

gen shop=0
replace shop=1 if (v510==0)

gen food=0
replace food=1 if (v511==0)

gen housekeep=0
replace housekeep=1 if (v512==0)

gen laundry=0
replace laundry=1 if (v513==0)

gen transport=0
replace transport=1 if (v514==0)

gen medication=0
replace medication=1 if (v515==0)

gen finance=0
replace finance=1 if (v516==0)

egen IADL= rowtotal (telephone shop food housekeep laundry transport medication finance)

egen IADL_mx= max (IADL), by (uid)
label variable IADL_mx "max IADL needed by any adult in a HH"

egen avg_IADL= mean (IADL), by (uid)
label variable avg_IADL "avg IADL needs of elderly in the HH"


***gender of IADL

gen IADL_F=0
replace IADL_F= IADL if (v103==2 & v105>59)
label variable IADL_F "female with IADL needs"

egen IADL_F_mx= max (IADL_F), by (uid)
label variable IADL_F_mx "Maximum IADL needs of females in the HH"

gen IADL_M=0
replace IADL_M= IADL if (v103==1 & v105>59)
label variable IADL_M "male with IADL needs"

egen IADL_M_mx= max (IADL_M), by (uid)
label variable IADL_M_mx "Maximum IADL needs of males in the HH"



******EDUCATION VARIABLE OF THE ELDELRY

***maximum education
 egen education= max (v114), by (uid)
 label variable education "highest education of aging adult in HH"
 
 ***average education 
 egen edu_avg= mean (v114), by (uid)
 
 gen edu_avg_r=0
 replace edu_avg_r= edu_avg
 replace edu_avg_r = 0 if (edu_avg==.)
 label variable edu_avg_r "avg education of the elderly in the HH"
 
 ***total number of adults between ages 18 and 59 in the HH
gen age01r=0
replace age01r= 1 if (hv105_01 >17 & hv105_01 < 60)

recode hv105_02 (.= 0)
gen age02r=0
replace age02r= 1 if (hv105_02 >17 & hv105_02 < 60)

recode hv105_03 (.= 0)
gen age03r=0
replace age03r= 1 if (hv105_03 >17 & hv105_03 < 60)

recode hv105_04 (.= 0)
gen age04r=0
replace age04r= 1 if (hv105_04 >17 & hv105_04 < 60)

recode hv105_05 (.= 0)
gen age05r=0
replace age05r= 1 if (hv105_05 >17 & hv105_05 < 60)

recode hv105_06 (.= 0)
gen age06r=0
replace age06r= 1 if (hv105_06 >17 & hv105_06 < 60)

recode hv105_07 (.= 0)
gen age07r=0
replace age07r= 1 if (hv105_07 >17 & hv105_07 < 60)

recode hv105_08 (.= 0)
gen age08r=0
replace age08r= 1 if (hv105_08 >17 & hv105_08 < 60)

recode hv105_09 (.= 0)
gen age09r=0
replace age09r= 1 if (hv105_09 >17 & hv105_09 < 60)

recode hv105_10 (.= 0)
gen age10r=0
replace age10r= 1 if (hv105_10 >17 & hv105_10 < 60)

recode hv105_11 (.= 0)
gen age11r=0
replace age11r= 1 if (hv105_11 >17 & hv105_11 < 60)

recode hv105_12 (.= 0)
gen age12r=0
replace age12r= 1 if (hv105_12 >17 & hv105_12 < 60)

recode hv105_13 (.= 0)
gen age13r=0
replace age13r= 1 if (hv105_13 >17 & hv105_13 < 60)

recode hv105_14 (.= 0)
gen age14r=0
replace age14r= 1 if (hv105_14 >17 & hv105_14 < 60)

recode hv105_15 (.= 0)
gen age15r=0
replace age15r= 1 if (hv105_15 >17 & hv105_15 < 60)

recode hv105_16 (.= 0)
gen age16r=0
replace age16r= 1 if (hv105_16 >17 & hv105_16 < 60)

recode hv105_17 (.= 0)
gen age17r=0
replace age17r= 1 if (hv105_17 >17 & hv105_17 < 60)

recode hv105_18 (.= 0)
gen age18r=0
replace age18r= 1 if (hv105_18 >17 & hv105_18 < 60)

recode hv105_19 (.= 0)
gen age19r=0
replace age19r= 1 if (hv105_19 >17 & hv105_19 < 60)

recode hv105_20 (.= 0)
gen age20r=0
replace age20r= 1 if (hv105_20 >17 & hv105_20 < 60)

recode hv105_21 (.= 0)
gen age21r=0
replace age21r= 1 if (hv105_21 >17 & hv105_21 < 60)

recode hv105_22 (.= 0)
gen age22r=0
replace age22r= 1 if (hv105_22 >17 & hv105_22 < 60)

recode hv105_23 (.= 0)
gen age23r=0
replace age23r= 1 if (hv105_23 >17 & hv105_23 < 60)

recode hv105_24 (.= 0)
gen age24r=0
replace age24r= 1 if (hv105_24 >17 & hv105_24 < 60)

recode hv105_25 (.= 0)
gen age25r=0
replace age25r= 1 if (hv105_25 >17 & hv105_25 < 60)

recode hv105_26 (.= 0)
gen age26r=0
replace age26r= 1 if (hv105_26 >17 & hv105_26 < 60)

recode hv105_27 (.= 0)
gen age27r=0
replace age27r= 1 if (hv105_27 >17 & hv105_27 < 60)

egen adult_hh= rsum (age01r age02r age03r age04r age05r age06r age07r age08r age09r age10r age11r age12r age13r age14r age15r age16r age17r age18r age19r age20r age21r age22r age23r age24r age25r age26r age27r)
egen adult_hh_mx= max (adult_hh), by (uid)
label variable adult_hh "total number of adult >17 & <60 in HH"
 
*********EDUCATION OF OTHER ADULTS (SON's, DAUGHTERS, DIL & SIL etc in the HH)

gen edu1=0
replace edu1= hv111_01 if (hv105_01 >17 & hv105_01 < 60)
replace edu1 = 0 if (hv111_01==.)

gen edu2=0
replace edu2= hv111_02 if (hv105_02 >17 & hv105_02 < 60)
replace edu2 = 0 if (hv111_02==.)

gen edu3=0
replace edu3= hv111_03 if (hv105_03 >17 & hv105_03 < 60)
replace edu3 = 0 if (hv111_03==.)

gen edu4=0
replace edu4= hv111_04 if (hv105_04 >17 & hv105_04 < 60)
replace edu4 = 0 if (hv111_04==.)

gen edu5=0
replace edu5= hv111_05 if (hv105_05 >17 & hv105_05 < 60)
replace edu5 = 0 if (hv111_05==.)

gen edu6=0
replace edu6= hv111_06 if (hv105_06 >17 & hv105_06 < 60)
replace edu6 = 0 if (hv111_06==.)

gen edu7=0
replace edu7= hv111_07 if (hv105_07 >17 & hv105_07 < 60)
replace edu7 = 0 if (hv111_07==.)

gen edu8=0
replace edu8= hv111_08 if (hv105_08 >17 & hv105_08 < 60)
replace edu8 = 0 if (hv111_08==.)

gen edu9=0
replace edu9= hv111_09 if (hv105_09 >17 & hv105_09 < 60)
replace edu9 = 0 if (hv111_09==.)

gen edu10=0
replace edu10= hv111_10 if (hv105_10 >17 & hv105_10 < 60)
replace edu10 = 0 if (hv111_10==.)

gen edu11=0
replace edu11= hv111_11 if (hv105_11 >17 & hv105_11 < 60)
replace edu11 = 0 if (hv111_11==.)

gen edu12=0
replace edu12= hv111_12 if (hv105_12 >17 & hv105_12 < 60)
replace edu12 = 0 if (hv111_12==.)

gen edu13=0
replace edu13= hv111_13 if (hv105_13 >17 & hv105_13 < 60)
replace edu13 = 0 if (hv111_13==.)

gen edu14=0
replace edu14= hv111_14 if (hv105_14 >17 & hv105_14 < 60)
replace edu14 = 0 if (hv111_14==.)

gen edu15=0
replace edu15= hv111_15 if (hv105_15 >17 & hv105_15 < 60)
replace edu15 = 0 if (hv111_15==.)

gen edu16=0
replace edu16= hv111_16 if (hv105_16 >17 & hv105_16 < 60)
replace edu16 = 0 if (hv111_16==.)

gen edu17=0
replace edu17= hv111_17 if (hv105_17 >17 & hv105_17 < 60)
replace edu17 = 0 if (hv111_17==.)

gen edu18=0
replace edu18= hv111_18 if (hv105_18 >17 & hv105_18 < 60)
replace edu18 = 0 if (hv111_18==.)

gen edu19=0
replace edu19= hv111_19 if (hv105_19 >17 & hv105_19 < 60)
replace edu19 = 0 if (hv111_19==.)

gen edu20=0
replace edu20= hv111_20 if (hv105_20 >17 & hv105_20 < 60)
replace edu20 = 0 if (hv111_20==.)

gen edu21=0
replace edu21= hv111_21 if (hv105_21 >17 & hv105_21 < 60)
replace edu21 = 0 if (hv111_21==.)

gen edu22=0
replace edu22= hv111_22 if (hv105_22 >17 & hv105_22 < 60)
replace edu22 = 0 if (hv111_22==.)

gen edu23=0
replace edu23= hv111_23 if (hv105_23 >17 & hv105_23 < 60)
replace edu23 = 0 if (hv111_23==.)

gen edu24=0
replace edu24= hv111_24 if (hv105_24 >17 & hv105_24 < 60)
replace edu24 = 0 if (hv111_24==.)

gen edu25=0
replace edu25= hv111_25 if (hv105_25 >17 & hv105_25 < 60)
replace edu25 = 0 if (hv111_25==.)

gen edu26=0
replace edu26= hv111_26 if (hv105_26 >17 & hv105_26 < 60)
replace edu26 = 0 if (hv111_26==.)

gen edu27=0
replace edu27= hv111_27 if (hv105_27 >17 & hv105_27 < 60)
replace edu27 = 0 if (hv111_27==.)

**total education of adults in HH (>17 <60)
egen total_edu= rowtotal (edu1 edu2 edu3 edu4 edu5 edu6 edu7 edu8 edu9 edu10 edu11 edu12 edu13 edu14 edu15 edu16 edu17 edu18 edu19 edu20 edu21 edu22 edu23 edu24 edu25 edu26 edu27)
label variable total_edu "total years of edu of all adults betwene ages 18 and 59"

gen avg_edu_adult= total_edu/adult_hh
label variable avg_edu_adult "avg yrd edu adults >17 <60 in HH"


***HH adults (>17 <60) currently working 

gen work1r=0
replace work1r=1 if (hv112_01==1 & hv105_01 >17 & hv105_01 < 60)
replace work1r=0 if (work1r==.)

gen work2r=0
replace work2r=1 if (hv112_02==1 & hv105_02 >17 & hv105_02 < 60)
replace work2r=0 if (work2r==.)

*gen work3=0
*replace work3=1 if (hv112_03==1 & hv105_03>59)

gen work4r=0
replace work4r=1 if (hv112_04==1 & hv105_04 >17 & hv105_04 < 60)

gen work5r=0
replace work5r=1 if (hv112_05==1 & hv105_05 >17 & hv105_05 < 60)

gen work6r=0
replace work6r=1 if (hv112_06==1 & hv105_06 >17 & hv105_06 < 60)

gen work7r=0
replace work7r=1 if (hv112_07==1 & hv105_07 >17 & hv105_07 < 60)

gen work8r=0
replace work8r=1 if (hv112_08==1 & hv105_08 >17 & hv105_08 < 60)

gen work9r=0
replace work9r=1 if (hv112_09==1 & hv105_09 >17 & hv105_09 < 60)

gen work10r=0
replace work10r=1 if (hv112_10==1 & hv105_10 >17 & hv105_10 < 60)

gen work11r=0
replace work11r=1 if (hv112_11==1 & hv105_11 >17 & hv105_11 < 60)

gen work12r=0
replace work12r=1 if (hv112_12==1 & hv105_12 >17 & hv105_12 < 60)

gen work13r=0
replace work13r=1 if (hv112_13==1 & hv105_13 >17 & hv105_13 < 60)

gen work14r=0
replace work14r=1 if (hv112_14==1 & hv105_14 >17 & hv105_14 < 60)

gen work15r=0
replace work15r=1 if (hv112_15==1 & hv105_15 >17 & hv105_15 < 60)

gen work16r=0
replace work16r=1 if (hv112_16==1 & hv105_16 >17 & hv105_16 < 60)

gen work17r=0
replace work17r=1 if (hv112_17==1 & hv105_17 >17 & hv105_17 < 60)

gen work18r=0
replace work18r=1 if (hv112_18==1 & hv105_18 >17 & hv105_18 < 60)

gen work19r=0
replace work19r=1 if (hv112_19==1 & hv105_19 >17 & hv105_19 < 60)

gen work20r=0
replace work20r=1 if (hv112_20==1 & hv105_20 >17 & hv105_20 < 60)

gen work21r=0
replace work21r=1 if (hv112_21==1 & hv105_21 >17 & hv105_21 < 60)

gen work22r=0
replace work22r=1 if (hv112_22==1 & hv105_22 >17 & hv105_22 < 60)

gen work27r=0
replace work27r=1 if (hv112_27==1 & hv105_27 >17 & hv105_27 < 60)

egen total_work_adultR= rowtotal (work1r work2r work4r work5r work6r work7r work8r work9r work10r work11r work12r work13r work14r work15r work16r work17r work18r work19r work20r work21r work22r work27r)
egen total_work_adultR_mx= max (total_work_adultR), by (uid)
label variable total_work_adultR "total number of adult 17-59 working in HH"


***religion
recode v116 (1=1) (2=2) (3=3) (4=4) (6=5)(9=5), gen (religion)
label variable religion "religion"
label define religion_i 1 "hindu" 2 "muslim" 3 "christian" 4 "sikh" 5 "other"
label values religion religion_i

***caste
recode v118 (1=1) (2=2) (3=3) (4=4) (9=4) (.=4), gen (caste)
label variable caste "caste of the respondent"
label define caste_i 1 "SC" 2 "ST" 3 "OBC" 4 "other"
label values caste caste_i

****syntax to drop duplicate cases 
sort uid
duplicates drop uid, force
 
*outsheet using BKPAI.csv, comma
