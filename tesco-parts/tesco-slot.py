import requests
from bs4 import BeautifulSoup
import pdb
import requests
import pandas as pd
import numpy as np
import tkinter as tk
from tkinter import messagebox
from datetime import datetime
import sys

root = tk.Tk()
root.withdraw()
keep = 0
min_price = 3.5 # GBP
neglect = 7 # 15:00 - 16:00
results = 0
## Input, the full path of the buffer html file
#print(sys.argv[1])
pagename = sys.argv[1]
with open(pagename, 'r') as pagefile:
    all_data = pagefile.read()

## Get the dataframe from pandas
try:
    tables = pd.read_html(pagename)
except:
    print("Check round finished at", datetime.now(),". In total", results, "slots avalable.")
    sys.exit(keep)


df = tables[0]
key = "£"

col_name = tables[0].columns

# Find the entry available
mask = df.apply(lambda x: x.str.contains(key, na=False))

masknp = mask.to_numpy()
found = np.argwhere(masknp)
results = found.shape[0]
# Check whether there are slots below a set price
print("Looking for slots as low as", min_price)
for row, col in found:
    info = df.iloc[row][col]
    if(row > neglect):
        continue
    if(float(info[-4:]) <= min_price):
        keep = 1
        messagebox.showwarning('alert title', info)
        print("Slots are found!")
        break
print("Check round finished at", datetime.now(), ". Neglecting slots after", df.iloc[neglect][0], ". In total", results, "slots avalable.")

sys.exit(keep)
