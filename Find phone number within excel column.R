library(readxl)
library(dplyr)


check_phone_numbers <- function(data, text_column) {
  data <- data %>%
    mutate(has_phone_number = grepl("(^|[^0-9])(370|86)\\d+", data[[text_column]], perl = TRUE, ignore.case = TRUE))
  
  return(data)
}

excel_file <- 'C:/Users/Astolfi/Documents/NUM.xlsx' # Path to file
sheet_name <- 'Sheet1'  # Update with the actual sheet name
text_data <- read_excel(excel_file, sheet = sheet_name)

text_column_name <- 'Complaints and medical history'  # Update with the column name

# Call the function to check phone numbers
result <- check_phone_numbers(text_data, text_column_name)

# Print the result
print(n=100, result) # Update n=numbers of rows in file

