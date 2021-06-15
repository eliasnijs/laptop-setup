#!/usr/bin/python3

#author: elias nijs
#date: nov. 16 2020


#   STOCKUPDATE
#-------------------

import sys
from bs4 import BeautifulSoup as bs
import requests
import re

def stockupdate():
    
    stock = str(sys.argv[1])
    site = 'https://finance.yahoo.com/quote/' + stock + '?p=' + stock
    r = requests.get(site)
    soup = bs(r.content,"html.parser")
    
    value = soup.body.find('span', {'data-reactid': '32'}).find(text=True)
    daychange = soup.body.find('div', {'data-reactid':'30'}).find('span', {'data-reactid':'33'}).find(text=True)

    print('value: ' + value + ' - daychange: ' + daychange)

stockupdate()
