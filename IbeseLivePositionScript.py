# load modules
from dotenv import load_dotenv
import requests
import json
import datetime as dt
import os
load_dotenv()

# read token from env file
token = os.environ.get('token')

# setup bearer token
bearerToken = str('Bearer' + ' ' + '{' + token + '}')

# header authentication
my_headers = {'Authorization' : bearerToken}

# post request
response = requests.post('http://46.20.238.167/DataProvider_new/api/v1/vehicle/livepositions',
headers=my_headers)

# save response body as an object - data
data = response.json()

if data["message"] == "operationÂ completedÂ successfully":
    # get the datetime object
    ct = dt.datetime.now().strftime('%Y-%m-%d %H-%M-%d-%f')
    # file name
    name = str('livePosition-' + ct)
    # file path
    path = ".\data"
    filepath = os.path.join(path, "")
    # file full path
    filename = str(filepath + name + ".json")
    # write  data object into the created path
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)


