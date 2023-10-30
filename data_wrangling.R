summary(small_file)
install.packages("tidyverse")
library(tidyverse)

median(log2(small_file$Length))

library(dplyr)
select(trumpton,FirstName,LastName,Weight)

#using position instead of columns

select(trumpton,2,4)
class(trumpton)
typeof(trumpton)
typeof(trumpton$Weight)
typeof(trumpton$FirstName)

#negative selections - use all expect one of them
#use slice function

select(trumpton,-LastName)
select(trumpton,-FirstName)
select(trumpton,-Age)
