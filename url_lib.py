'''
Author:[huan666]
Date:[2024/01/12]
'''
import requests
import json
import time
from fake_useragent import UserAgent
from tqdm import tqdm

def urlinfo(domain_list):
    UA=UserAgent()
    print("域名："+str(domain_list))
    print("随机User-Agent："+UA.random)
    headers={
        'Cookie':'Hm_lvt_ecdd6f3afaa488ece3938bcdbb89e8da=1615729527; Hm_lvt_d39191a0b09bb1eb023933edaa468cd5=1617883004,1617934903,1618052897,1618228943; Hm_lpvt_d39191a0b09bb1eb023933edaa468cd5=1618567746',
        'Host':'otx.alienvault.com',
        'User-Agent':UA.random
    }
    
    for domain in tqdm(domain_list,desc="遍历域名"):
        time.sleep(5)
        url = "https://otx.alienvault.com/api/v1/indicators/domain/"+domain+"/url_list?limit=500&page=1"
        res = requests.get(url,headers=headers,allow_redirects=False)
        res.encoding='utf-8'
        restext = res.text
        resdic=json.loads(restext)
        data = resdic['url_list']
        for ii in data:
            print(ii['url'])