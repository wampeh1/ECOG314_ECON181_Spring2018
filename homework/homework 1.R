# HOMEWORK 1 
# 
# DESCRIPTION: In this assignment we will use base R functions to work with 
# vectors. The end goals are to practice using R, to create a working program, 
# and to share the results with others. 
#
# INSTRUCTIONS: Read the instructions provided in the comments. Add your own
# code and comments in the space provided to complete the assignment. 
# Partial answers and useful comments are eligible for partial credit. 
# Complete as many exercises as possible. If things aren't working, seek
# assistance at the piazza site set up for the course.
# 
# TO SUBMIT: save your work in a .R file and email it to the instructor 
# before the deadline for credit.
#-------------------------------------------------------------------------------


#---------------#
# Load Packages #
#---------------#

# (NONE REQUIRED)



#------------#
# Load Data  #
#------------#

# (NONE REQUIRED)



#------------#
# Exercise 1 #
#------------#

# Part 1. If you have not already done so please create a Piazza account.

# (RESPOND ONLINE)


# Part 2. Post a brief introduction on Piazza with your name, your year, what 
#         you are studying and one fun fact in the introductions folder.

# (RESPOND ONLINE)


# Part 3. Post one question you might have about R, about the class, 
#         or about the homework on Piazza site.

# (RESPOND ONLINE)



#------------#
# Exercise 2 #
#------------#

# INSTRUCTIONS --------
#
#  Go to the main url for the course:
#      https://www.datacamp.com/courses/free-introduction-to-r
#
#  Click on "Start Course For Free"
#
#  Create a user account or log in (free)
#
#  For full credit, complete the following chapters:
#      (1) Intro to basics
#      (2) Vectors
#      (5) Data Frames
#
# For extra credit, complete additional chapters of your choice.
#
# TO SUBMIT --------
#
# In your browser, go back to the main url for the course (above). Your progress
# (% completed) in each chapter should be clearly visible. Print the page to a
# PDF file and submit it in the hw3 folder. Make sure you only share it with
# instructors or just with Damian. Additional instructions will be posted to
# the course page on piazza


#------------#
# Exercise 3 #
#------------#

# Part 1. Consider a simple accounting identity: Profit = Revenue - Cost. 
#         Use the c() function to create two vectors. Call one of these vectors
#         "revenue" and call the other "cost". Assign any 5 numeric values to 
#         each object

# (INSERT YOUR SOLUTION HERE)


# Part 3. Compute profits. Use the "-" operator the subtract the cost vector 
#         from the revenue vector. Assign the result to a new vector called 
#         "profit" and print the result. Use a function to confirm that the
#         profit vector has 5 elements     

# (INSERT YOUR SOLUTION HERE)
    

# Part 4. Compute net profits. Use the sum() function to compute the total of
#         the values in the profit vector. Assign the result to a new
#         vector called "net_profit" and print the result. It should be a 
#         single value.
    
# (INSERT YOUR SOLUTION HERE)




#------------#
# Exercise 4 #
#------------#

# Part 1. The vectors given below contain population data for Washington DC in 
#         selected years (year, total population, and the fraction of the total 
#         population that identifies as either black or white).
#
#         Use the names() function and the given vectors to associate each 
#         vector element with the appropriate year for the observation.
#         Print the result.

year          <- c(1970, 1980, 1990, 2000, 2010, 2014)
dc_white_frac <- c(0.277, 0.269, 0.296, 0.308, 0.402, 0.436)
dc_black_frac <- c(0.711, 0.703, 0.658, 0.60, 0.507, 0.49)
dc_pop        <- c(756510,638333, 606900, 572059, 601723, 672228)


# (INSERT YOUR SOLUTION HERE)

print(dc_white_frac)
print(dc_black_frac)
print(dc_pop)


# Part 2. Calculate the fraction of D.C. residents do not identify as black or 
#         white in each year. Use the vectors given above. Call the new vector
#         "dc_other_frac"

# (INSERT YOUR SOLUTION HERE)

print(dc_other_frac)


# Part 3. Calculate the number of white and black residents in D.C. in each 
#         year using the vectors given above. Call the new vectors "black_pop"
#         and "white_pop"

# (INSERT YOUR SOLUTION HERE)

print(black_pop)
print(white_pop)
