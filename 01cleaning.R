mc<-read.csv("Business/Metadata_Country_v2.csv", encoding = "UTF-8")
mi<-read.csv("Business/Metadata_Indicator_v2.csv")
st<-read.csv("Business/st_int_rcpt_v2.csv", skip=4)

#merge two datasets and use certain columns of the second dataset
st1<- merge(x = st, y = mc[ , c("Country.Code", "Region")], by = "Country.Code", all.x=TRUE)

#find variable values according another's variable value
# find the region of Bangladesh
st1[st1$Country.Name=="Bangladesh",]$Region

# find the region of Sint Maarten (Dutch part)
st1[st1$Country.Name=="Sint Maarten (Dutch part)",]$Region

#Video 2 "Preparing data before analysis"
#Get aggregates
Aggregates<-st1[which(st1$Region==""),]

#st2 contains all countries with region not ""
st2<-st1[which(st1$Region!=""),]
#Get countries with insufficient data

#Get all countries with less than 16 years of data (1995:2010)
myvars <- paste("X", 1995:2010, sep="")
newdata <- st2[myvars]
cc<-complete.cases(newdata)

#Cleaned contains countries with 16 years of data
Cleaned<-st2[cc,]

ncc<-!complete.cases(newdata)
#Countries with insufficient or no data
insufNoData<-st2[ncc,]
insyears<-insufNoData[myvars]

#Countries with insufficient data
InsufData<-insufNoData[rowSums(is.na(insyears[,1:16]))<ncol(insyears),]
#Countries with no data
NoData<-insufNoData[rowSums(is.na(insyears[,1:16]))==ncol(insyears),]


