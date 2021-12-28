import requests, csv
from bs4 import BeautifulSoup
from datetime import date
from openpyxl import Workbook

#Constant(s)
today=date.today()

# Define the stock symbols that we want to use, eventually with a separate file
fn = 'symbols.csv'
wb=Workbook()
ws=wb.active
wb.remove(ws)

with open(fn) as f:
    lines = csv.reader(f)
    idx=0
    for sym in lines:
        if sym=="":
            break
        elif sym[0]=="SYMBOLS":
            pass

        # Define stock symbol e.g. "AAPL"
        symbol=str(sym[0])   

        # Get basic Overview data     
        o_url = str(f"https://finance.yahoo.com/quote/{symbol}?p={symbol}")           
        r = requests.get(o_url)
        soup = BeautifulSoup(r.content, "html.parser")

        # Define variables for Overview
        results=soup.find(id="quote-summary")
        corp=(soup.find("h1", class_="D(ib) Fz(18px)")).text.strip()
        prev_close=(results.find("td", attrs={"data-test": "PREV_CLOSE-value"})).text.strip()
        open_value=(results.find("td", attrs={"data-test": "OPEN-value"})).text.strip()
        eps=(results.find("td", attrs={"data-test": "EPS_RATIO-value"})).text.strip()
        pe_ratio=(results.find("td", attrs={"data-test": "PE_RATIO-value"})).text.strip()
        dividend_and_yield=(results.find("td", attrs={"data-test": "DIVIDEND_AND_YIELD-value"})).text.strip()
        # stock_data=results.find_all("td", class_="Ta(end) Fw(600) Lh(14px)") << one way to get all the values more easily

       
        ws=wb.create_sheet(f"{symbol}")

        # Write the columns (cells can be fixed)
        ws.cell(row=1, column=1, value="Corp Name")
        ws.cell(row=1, column=2, value="Previous Close")
        ws.cell(row=1, column=3, value="Open Value")
        ws.cell(row=1, column=4, value="EPS Ratio")
        ws.cell(row=1, column=5, value="PE Ratio")
        ws.cell(row=1, column=6, value="Dividend & Yield")
        ws.cell(row=1, column=7, value="Date")
        
        # Write the basic values to each sheet
        ws.cell(row=2, column=1, value=corp)
        ws.cell(row=2, column=2, value=prev_close)
        ws.cell(row=2, column=3, value=open_value)
        ws.cell(row=2, column=4, value=eps)
        ws.cell(row=2, column=5, value=pe_ratio)
        ws.cell(row=2, column=6, value=dividend_and_yield)
        ws.cell(row=2, column=7, value=today)


wb.save('BasicReport.xlsx')
print(wb.sheetnames)