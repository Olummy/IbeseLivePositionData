# python script to gather the live position

import requests


my_headers = {'Authorization' : 'Bearer {ad83ba33-986e-4c1f-95a5-7bf2b6c5098f}'}
response = requests.post('http://46.20.238.167/DataProvider_new/api/v1/vehicle/livepositions',
headers=my_headers)
