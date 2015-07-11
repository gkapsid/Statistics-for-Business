mc<-read.csv("Business/Metadata_Country_v2.csv", encoding = "UTF-8")
mi<-read.csv("Business/Metadata_Indicator_v2.csv")
st<-read.csv("Business/st_int_rcpt_v2.csv", skip=4)

#not to be used...
#remove one row to equal the rows of two datasets
#st1<-subset(st, st$Country.Name !="World")
#st1$Region<-mc$Region

#merge two datasets and use certain columns of the second dataset
st1<- merge(x = st, y = mc[ , c("Country.Code", "Region")], by = "Country.Code", all.x=TRUE)

#find variable values according another's variable value
# find the region of Bangladesh
st1[st1$Country.Name=="Bangladesh",]$Region

# find the region of Sint Maarten (Dutch part)
st1[st1$Country.Name=="Sint Maarten (Dutch part)",]$Region

#Video 

