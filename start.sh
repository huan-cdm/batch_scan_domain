#! /bin/bash
case "${1}" in
    #调用rad
    startrad)
    #./rad_engine/rad_linux_amd64 --target ${2}
    ./rad_engine/rad_linux_amd64 --target ${2} -http-proxy 127.0.0.1:7777
	;;
    
    #调用xray
    startxray)
    # 使用date命令生成当前的时间戳  
    TIMESTAMP=$(date +"%Y%m%d%H%M%S")  
    #拼接文件名  
    OUTPUT_FILE="./report/xray-testphp-${TIMESTAMP}.html" 
    ./xray_engine/xray_linux_amd64 webscan --listen 127.0.0.1:7777 --html-output "$OUTPUT_FILE"
    # 打印出生成的文件名  
    echo "HTML output saved to $OUTPUT_FILE"
    ;;

    #开启xray报告访问服务
    #本地开启127.0.0.1，利用nginx反向代理，映射到公网访问
    reportserver)
    cd /TIP/batch_scan_domain/report
    python3 -m http.server 8081 --bind 127.0.0.1 &
    ;;
esac
