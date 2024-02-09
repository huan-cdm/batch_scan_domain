config.py 脚本配置文件
url.txt   待扫描目标放到这里（https://www.xxx.com/）
result.txt 通过第三方接口查询出的历史URL存到这里
radscan.py 脚本入口文件，python3 radscan.py，会先检查config.py配置
history_switch = 1  调用OTX查询历史URL，在调用rad扫描
history_switch = 0  用户输入URL，在调用rad扫描
scan_lib.py、url_lib.py 调用第三方接口