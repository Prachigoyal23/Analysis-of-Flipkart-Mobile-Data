# Analysis-of-Flipkart-Mobile-Data

## Project Overview

This project involves the development of a web scraping script to extract detailed product information about mobile phones from Flipkart, specifically for products priced under INR 50,000. The extracted data is then analyzed to understand pricing trends, customer reviews, and product specifications. The project demonstrates proficiency in Python scripting, web scraping, data handling, and SQL database operations.

## Technologies Used

- **Python**: For web scraping and data manipulation.
  - **BeautifulSoup**: For parsing HTML content.
  - **requests**: For sending HTTP requests.
  - **Pandas**: For data cleaning and manipulation.
- **SQL**: For data analysis and querying.
  

## Usage

1. **Run the web scraping script:**

    The provided Python script will scrape data from Flipkart and save it to a CSV file. Modify the `csv` path in the script as necessary.

2. **Analyze the data using SQL queries:**

    Load the `mobile_under_50000.csv` into your SQL database and use the following queries to analyze the data:
   
    -- Number of brands in the segment
   
    -- Count of SKUs per brand
   
    -- Relative ranking of brands based on the rank of the SKUs

    -- Relative rating of brands
   
    -- Price distribution of SKUs
   

## Data

The scraped data includes the following fields:
- **Brand Name**: The brand of the mobile phone.
- **Price**: The price of the mobile phone.
- **Rating**: The rating of the mobile phone.
- **Rating Count**: The number of ratings.
- **URL**: The URL to the product page on Flipkart.

## Contribution

Feel free to contribute to this project by:
- Reporting bugs.
- Suggesting improvements.
- Submitting pull requests.

## Contact

For any queries or feedback, please contact goyalprachi2324@gmail.com.
