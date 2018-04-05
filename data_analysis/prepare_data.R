# Read data
raw_data <- read.csv('data/201804050932.csv')
# Start with real data from id 36 on
raw_data <- subset(raw_data, id > 36)

# Questionary is completed when pan is filled out
completed <- subset(raw_data, pan20 > 0)

# Calculate the speed in minutes
completed$duration <- as.numeric(difftime(as.POSIXct(strptime(completed$updated_at, "%Y-%m-%d %H:%M")), as.POSIXct(strptime(completed$started_at, "%Y-%m-%d %H:%M"))))

