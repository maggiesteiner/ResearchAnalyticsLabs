# Load entire dataset (large)
latestdata<-read_csv('~/Desktop/Research/Research Analytics Class/New_Assignments/data/latestdata.csv')

# Subset to cases with a listed outcome (257 cases)
outcomes<-latestdata[which(!is.na(latestdata$outcome)),]

# Filter out unwanted columns & observations
outcomes<-outcomes[,c("ID","age","sex","chronic_disease_binary","country","travel_history_binary","outcome")]
outcomes$age<-floor(as.numeric(outcomes$age))
outcomes<-outcomes[complete.cases(outcomes),]
rownames(outcomes)<-outcomes[,1]
outcomes<-outcomes[,-1]

# Create binary outcome variable
outcomes$"died_binary"<-FALSE
outcomes[which(outcomes$outcome %in% c("dead","Dead","death","Death","Deceased","died","Died")),"died_binary"]<-TRUE
outcomes<-outcomes[complete.cases(outcomes),]
# Write to CSV file
write.csv(outcomes,"covid19_outcomes_data.csv",row.names = F)