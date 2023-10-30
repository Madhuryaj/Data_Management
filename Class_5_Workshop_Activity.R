#Class 5. Workshop

######----------------------------------------------------------------#########
#Exercise 1: Reading Data from Files

#Reading a file (available in Canvas – Files – Class 5).
#Read the file ‘customer.xlsx’ into R - Done
library(dplyr)
#Try clicking on the data in the Environment tab to run View on it and open a graphical view of it.
View(customer_data)
#• Calculate the mean and sd of the column named EngagementPercent.
mean(customer_data$EngagementPercent) #o/p 59.88219
sd(customer_data$EngagementPercent) #o/p 24.11675
######----------------------------------------------------------------#########

######----------------------------------------------------------------#########

#Exercise 2: Filtering

#Part 1

#In the ‘small_file’ data:
#  Each of the lines below is a separate selection, you don’t need to combine them at this stage.
#• Extract all of the rows where the Category is "A".
filter(small_file, Category == "A")

#• Extract the data for samples with a Length of more than 80.
filter(small_file, Length >= 80)

#• Remove the Sample column to just keep Length and Category
small_file_updated_df <- subset(small_file, select = -Sample)


#PART 2

#In the ‘customer’ data:
#• Extract the rows where the employment (CHR) is in motor trade ("MT").
filter(customer_data, CHR == "MT")

#• Extract the customers who have an EngagementPercent of >= 70.
filter(customer_data, EngagementPercent >= 70)

#• Extract the customers with spending (QUAL) of exactly 200.
filter(customer_data, QUAL == 200)

#• Extract all customers that used IGFN1 promotion. Select an appropriate column based on the data.
filter(customer_data, PROMO == "IGFN1")

#• Remove the ENST and dbSNP columns
df <- subset(customer_data, select = -ENST)
df <- subset(df, select = -dbSNP)

######----------------------------------------------------------------#########

######----------------------------------------------------------------#########

#Exercise 3: Multi-Stage filtering and Selection

#Quality filtering
#Extract customers where all of the conditions below are true:
#• Spending (QUAL) is 200;
#• Coverage is more than 50;
#• EngagementPercent is more than 70.

customer_data %>%
  filter(QUAL == 200 & COVERAGE > 50 & EngagementPercent > 70) %>%
  select(CHR,
         POS,
         dbSNP,
         REF,
         ALT,
         QUAL,
         PROMO,
         ENST,
         Reads,
         COVERAGE,
         EngagementPercent)

#Positional Filtering
#• Remove all customers who are employed in the X, Y and MT sectors.

DF_REMOVE_1 <- subset(customer_data, CHR != "X")
DF_REMOVE_2 <- subset(DF_REMOVE_1, CHR != "Y")
DF_REMOVE_final <- subset(DF_REMOVE_2, CHR != "MT")

#Annotation filtering
#• Show only the employment (CHR) and position (POS) for customers who have a valid dbSNP ID’s

customer_data %>%
  filter(dbSNP != ".") %>%
  select(CHR, POS)