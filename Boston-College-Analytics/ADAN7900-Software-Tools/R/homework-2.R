library(ggplot2)
library(tidyr)
library(plotly)
library(dplyr)

# Load data
data <- read.csv("historical_spending.csv")

# Reshape for stacked bars
data_long <- data %>%
  pivot_longer(
    cols = Candy:GiftCards,
    names_to = "Category",
    values_to = "Spending"
  )

# Total spending
total <- data[, c("Year", "PerPerson")]

# Plot
p <- ggplot() +
  geom_bar(data = data_long, aes(x = Year, y = Spending, fill = Category), stat = "identity") +
  geom_line(data = total, aes(x = Year, y = PerPerson), color = "black", linewidth = 1.5) +
  geom_point(data = total, aes(x = Year, y = PerPerson), color = "black", size = 2) +
  labs(title = "Valentine's Day Spending by Category and Total",
       x = "Year", y = "Spending per Person") +
  theme_minimal()

# Make interactive
ggplotly(p)

# Save PNG
ggsave("myplot.png", plot = p, width = 10, height = 6)
