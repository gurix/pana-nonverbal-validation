# Read data
raw_data <- read.csv('data/201803291613.csv')
# Start with real data from id 36 on
raw_data <- subset(raw_data, id > 36)

# Questionary is completed when pan is filled out
completed <- subset(raw_data, pan20 > 0)