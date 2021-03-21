install.packages("bigrquery") # Install package R Interface to Google BigQuery API  
library(bigrquery) # R Interface to Google BigQuery API  

# Define Project 
projectid<-'bi-2019-test'
# Define Dataset
datasetid<-'ad_hoc'
# Create Connection to BigQuery
bq_conn <-  dbConnect(bigquery(), 
                      project = projectid,
                      dataset = datasetid, 
                      use_legacy_sql = FALSE )

# Sql Query String 
#It is located in GutHub and it is name "Part I CAR Creation.sql"
sql_string <-   readChar("C:/Users/apsyk/Desktop/Efood/Part I CAR Creation.sql",nchars =50000)


#Store the results
Queryresults <- bq_project_query(projectid,sql_string)

##################################################################################################################################################
# The first time you run a BigQuery request from R, you will be prompted to authorise the session 
# and cache an authrisation token - follow the instructions as shown below,
# open the Web-URL link provided in a browser, and paste the token back into the R session to save the authorisation:
#   
# Use a local file ('.httr-oauth'), to cache OAuth access credentials between R sessions?
#   
# 1: Yes
# 2: No
# 
# Selection: 1
# Adding .httr-oauth to .gitignore
# httpuv not installed, defaulting to out-of-band authentication
# Enter authorization code: 4/1AY0e-g5av7mLPRx33T4f2eZqDwe2eKnzvGn6ETNicN9jkuVsFaTZ8EyIZr4
##################################################################################################################################################

# Extract the BigQuery result into an R data-frame
CAR <- bq_table_download(Queryresults, max_results = Inf)
# summary(CAR)

mydata <- as.data.frame(CAR)
# str(mydata)
# summary(mydata)


# 1b Convert all variables to Numeric ############################################################
#Convert to numeric
for(i in c(2:ncol(mydata))){
  mydata[ ,i]<-as.data.frame(sapply(mydata[ ,i],as.numeric))
}

# 1d Standardize results ##########################################################################
mydata[,c(2:ncol(mydata))] <-scale(mydata[,c(2:ncol(mydata))])




# Define Number of CLusters
kmean_withinss <- function(k) {
  # cluster <- kmeans(mydata[,c(2:ncol(mydata))], k)
  # cluster <- kmeans(mydata[,c(2:7,11:16,20:25,29:34,40:51)], k)
  cluster <- kmeans(mydata[,c(2:7,11,12:17,21,22:27,31,32:37,41,42:55)], k)
  return (cluster$tot.withinss)
}
# Set maximum cluster 
max_k <-20 
# Run algorithm over a range of k 
wss <- sapply(2:max_k, kmean_withinss)
# Create a data frame to plot the graph
elbow <-data.frame(2:max_k, wss)
# Plot the graph with gglop
ggplot(elbow, aes(x = X2.max_k, y = wss)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks = seq(1, 20, by = 1))




# colnames(mydata)[c(2:7,11,12:17,21,22:27,31,32:37,41,42:55)]
######################################################################
set.seed(1988)
# KmResult <- kmeans(mydata[,c(2:ncol(mydata))], centers = 6, nstart = 50)
KmResult <- kmeans(mydata[,c(2:7,11,12:17,21,22:27,31,32:37,41,42:55)], centers = 6, nstart = 50)
KmResult$size
# Save the cluster number in the dataset as column 'ClusterResult'
# mydata$ClusterResult <- as.factor(k2$cluster)
CAR$ClusterResult <- as.factor(KmResult$cluster)
#####################################################################
write.csv(x = CAR,file = paste0(getwd(),"/ClusteringResult.csv"))






