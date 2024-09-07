import pandas as pd
import requests
from bs4 import BeautifulSoup
Brand_Name = []
Price = []
Rating = []
Rating_count = []
review_count = []
Ranking = []
URL = []

for i in range(2, 12):
 url = "https://www.flipkart.com/search?q=Mobile+under+50000&otracker=search&otracker1=search&marketplace=FLIPKART&as-show=on&as=off&page="+str(i)
r = requests.get(url)
#print(r)

soup = BeautifulSoup(r.text, "lxml")
box = soup.find("div", class_="DOjaWF gdgoEp")

names = box.find_all("div", class_="KzDlHZ")

for item in names:
 name = item.text
Brand_Name.append(name)
print(Brand_Name)

#def extract_first_name(Brand_Name):
 #   words = Brand_Name.split()
  #  return words[0]
#for item in Brand_Name:
 #   name= item.text
  #  Brand_Name.append(name)
   # print(Brand_Name)



Prices = box.find_all("div", class_="Nx9bqj _4b5DiR")

for item in Prices:
 name = item.text
Price.append(name)
print(Price)


Ratings = box.find_all("div", class_="XQDdHH")

for item in Ratings:
 name = item.text
Rating.append(name)
print(Rating)
RatingAndReview = box.find_all("span", class_="Wphh3N")
for item in RatingAndReview:
 name = item.text
 Rating_count.append(name)
 print(Rating_count)

Url = box.find_all("a", class_ ="CGtC98")
for item in Url:
            name = item.get("href")
            URL.append("https://www.flipkart.com" + name)
            print(URL)
#df = pd.DataFrame({"Brand Name": Brand_Name, "Price": Price, "Rating": Rating, "Rating Count": Rating_count, "URL": URL})
#print(df)

        #df.to_csv("D:/Mobile_Data/mobile_under_50000.csv")
