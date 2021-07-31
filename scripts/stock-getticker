#!/usr/bin/python3

#author:    elias nijs
#date:      2020-11-16

#   STOCKUPDATE


import sys
from bs4 import BeautifulSoup as bs
import requests
import re

    
stock = str(sys.argv[1])
soup = bs(requests.get('https://finance.yahoo.com/quote/' + stock + '?p=' + stock).content,"html.parser")
    
value = soup.body.find('span', {'data-reactid': '32'}).find(text=True)
daychange = soup.body.find('div', {'data-reactid':'30'}).find('span', {'data-reactid':'33'}).find(text=True)

print('value: ' + value + ' - daychange: ' + daychange)
