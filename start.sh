#! /bin/bash
case "${1}" in
    #调用rad
    startrad)
    ./rad_engine/rad_linux_amd64 --target ${2}
    #./rad_engine/rad_linux_amd64 --target ${2} -http-proxy 127.0.0.1:7777
	;;
    
esac
