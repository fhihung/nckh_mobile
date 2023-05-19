from flask import requests
res = requests.post('http://127.0.0.1:9999', json={"day":"17"})
if res.ok:
    print(res.json())