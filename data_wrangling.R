summary(small_file)
install.packages("tidyverse")
library(tidyverse)

median(log2(small_file$Length))

library(dplyr)
select(trumpton, FirstName, LastName, Weight)

#using position instead of columns

select(trumpton, 2, 4)
class(trumpton)
typeof(trumpton)
typeof(trumpton$Weight)
typeof(trumpton$FirstName)

#negative selections - use all expect one of them
#use slice function

select(trumpton, -LastName)
select(trumpton, -FirstName)
select(trumpton, -Age)

#FILTER Function

filter(trumpton, Height >= 170)

filter(trumpton, FirstName == "Chris")

#New file imported - Transform Data

filter(transform_data, difference > 5)
filter(transform_data, difference < -5)
filter(transform_data, abs(difference) > 5)

filter(trumpton, Height > 170) -> answer_1
filter(answer_1, FirstName == "Chris") -> answer_2
select(answer_2, Age, Weight)


select (trumpton, -LastName)
trumpton %>%
  select(-LastName)

#same as above line 37 to 39
trumpton %>%
  filter(Height >= 170) %>%
  filter(FirstName == "Chris") %>%
  select(Age, Weight)
#same as above
trumpton %>%
  filter(Height >= 170 & FirstName == "Chris") %>%
  select(Age, Weight)
