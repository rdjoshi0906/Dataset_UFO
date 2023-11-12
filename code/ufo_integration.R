#Ruchi Joshi
#11-11-2023
# Integrate monthly UFO data into a single file

rm(list = ls())

# Load libraries
library(readr)

getwd()
csv_files <- list.files(pattern = "\\.csv$")

# Specify the name of the different file
file_diff <- "ufo_sightings_month.csv"

# Initialize empty data frame for the files
combined_data <- data.frame()

for (file in csv_files) {
  if (file != file_diff) {
    # Read the file
    data <- tryCatch({
      read_csv(file)
    }, error = function(e) {
      cat("Error in file:", file, "\n", e$message, "\n")
      return(NULL)
    })
    
    if (!is.null(data)) {
      # Check if the structure matches the existing combined_data
      if (nrow(combined_data) == 0) {
        combined_data <- data
      } else {
        if (!all(names(data) == names(combined_data))) {
          cat("Column names do not match in file:", file, "\n")
        } else {
          combined_data <- rbind(combined_data, data)
        }
      }
    }
  }
}

write_csv(combined_data, "ufo_sightings_combined.csv", na = "NA")

combined_data <- read.csv("ufo_sightings_combined.csv")
View(combined_data)

# Read the combined data from the CSV file
combined_data <- read_csv("ufo_sightings_combined.csv")

# Check for duplicate rows
duplicates <- duplicated(combined_data)

# Count how many duplicates are there
num_duplicates <- sum(duplicates)
cat("Number of duplicate rows: ", num_duplicates, "\n")

# Remove duplicate rows
combined_data_unique <- combined_data[!duplicates, ]

# Save the data without duplicates back to a CSV file
write_csv(combined_data_unique, "ufo_combined_unique.csv", na = "NA")

Data_1 <- read.csv("ufo_combined_unique.csv")
View(Data_1)
write_csv(Data_1, "ufo_combined_unique_new.csv", na = "NA")

colnames(Data_1)[colnames(Data_1) == "image"] <- "month_count"

Data_2 <- read.csv("ufo_sightings_month.csv")
View(Data_2)

colnames(Data_2)[colnames(Data_2) == "year_month"] <- "date"
colnames(Data_2)[colnames(Data_2) == "month_url"] <- "details"

write_csv(Data_2, "ufo_combined_month_new.csv", na = "NA")

library(lubridate)

# Convert the date column to date-time and then reformat
Data_1$date <- format(mdy_hm(Data_1$date), "%m/%Y")

library(dplyr)
#Calculate the month count for Data_1
Data_1 <- Data_1 %>%
  group_by(date) %>%
  mutate(month_count = n()) %>%
  ungroup()

# Add missing columns from Data_1 to Data_2
for (col in setdiff(names(Data_1), names(Data_2))) {
  Data_2[[col]] <- NA
}

# Reorder columns so they are the same in both data frames
Data_1 <- Data_1[names(Data_2)]
New_Data <- rbind(Data_1, Data_2)
View(New_Data)

# Capture the names of all columns
col_names <- names(New_Data)

# Rearrange the column names
# Move the third column to the first position, the first to the second, and the second to the last
new_order <- c(col_names[3], col_names[1], col_names[-c(1, 2, 3)], col_names[2])

# Rearrange the columns in the data frame
New_Data <- New_Data[new_order]

write_csv(New_Data, "ufo_sightings.csv", na = "NA")