library(readxl)
library(dplyr)
library(writexl)

df <- read.csv("C:\\Users\\Julio Dylan\\Desktop\\R Programming\\supermarket_sales - Sheet1.csv")
View(df)

# Remove not used columns
df <- df[, !names(df) %in% "Invoice.ID"]
df <- df[, !names(df) %in% "Tax.5."]
df <- df[, !names(df) %in% "gross.margin.percentage"]
df <- df[, !names(df) %in% "gross.income"]
df <- df[, !names(df) %in% "Total"]
df <- df[, !names(df) %in% "Time"]

# Set date to first column
df <- df[, c("Date", setdiff(names(df), "Date"))]

# Rename Columns
colnames(df)[colnames(df) == "Customer.type"] <- "Customer Type"
colnames(df)[colnames(df) == "Product.line"] <- "Product Line"
colnames(df)[colnames(df) == "Unit.price"] <- "Unit Price"

# Change date datatype from text to date
df$Date <- as.Date(df$Date, format="%m/%d/%Y")

write_xlsx(df, "C:\\Users\\Julio Dylan\\Desktop\\R Programming\\supermarket_sales_updated.xlsx")
