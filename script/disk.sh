#!/bin/bash
#磁盘监控组

#查询硬盘i节点
disk_gen_i() {
    local dis_i=`df -Th | grep -w "/" | awk '{print $6}' | awk -F'%' '{print $1}'` #获取的值
    local value=15 #报警阀值
    local caveat="根目录节点超过${value}，当前获取值${dis_i}" #警告话语
    
    #日志
    date +%F/%H/%M/%S  >> $lsm_log
    echo 硬盘i节点获取1只：${dis_i} >> $lsm_log
    
    if [ $dis_i -ge $value ];then
        echo $caveat
    fi
}