#### Preamble ####
# Purpose: Simulates Quiz 7 Q6 Scenario
# Author: Yuchao Niu
# Date: 27 February 2023 
# Contact: yc.niu@utoronto.ca


# Simulate for gender and vote

# Set seed for reproducibility
set.seed(123)  

# Number of observations
n <- 1000  

# Independent variables
race <- sample(c("White", "Black", "Hispanic", "Asian"), size = n, replace = TRUE)
gender <- sample(c("Male", "Female", "Non-binary"), 
                 prob = c(0.49, 0.5, 0.01), 
                 size = n, replace = TRUE)

# Dependent variable (vote preference) 
race_prob <- c('White' = 0.6, 'Black' = 0.7, 'Hispanic' = 0.5, 'Asian' = 0.4)

# Adjust probabilities based on gender
gender_adjust <- ifelse(gender == "Female", 0.05, -0.05)

# Calculate final probabilities
final_probs <- sapply(race, function(x) race_prob[x]) + gender_adjust

# Simulate vote preference based on the calculated probabilities
vote_preference <- runif(n) < final_probs

# Combining everything into a data frame
simulation_df <- data.frame(race, gender, vote_preference = as.numeric(vote_preference))

