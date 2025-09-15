#Analyze the sales data for the US region for order and distribution
import pandas as pd
from datetime import datetime

#clean data set if needed
df = pd.read_csv("US_Sales.csv")

#drop any null values 
df.dropna(inplace = True)

#format procured date, order date, ship date, delivery date
dates = ["ProcuredDate", "OrderDate", "ShipDate", "DeliveryDate"]

for col in dates:
     df[col] = pd.to_datetime(df[col], dayfirst=True)
    
for col in dates:
     df[col] = df[col].dt.strftime('%m/%d/%y')

#remove dollar signs and commas from unit cost and prices mentioned 
dollar_amounts = df[["Unit_Cost", "Unit_Price"]]

for col in dollar_amounts:
     df[col] = df[col].str.replace("$","")
     df[col] = df[col].str.replace(",","")
     df[col] = df[col].str.strip()
     df[col] = df[col].astype("float")


#Calculate Profitability Metrics using Pandas Opeerations
df["Revenue"] = df["Order_Quantity"] * df["Unit_Price"] 
df["COGS"] = df["Order_Quantity"] * df["Unit_Cost"]
df["Total_Discount"] = df["Order_Quantity"] * df["Discount_Applied"]

df["Profit"] = df["Revenue"] - df["COGS"] - df["Total_Discount"]
df["Gross_Margin"] = df["Profit"]/df["Revenue"]

#Calculate Inventory Metrics not based on aggegation in SQL
output_filename = "Regional_Sales_Data.csv"
df.to_csv(output_filename, index=False) 

