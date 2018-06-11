#!/bin/bash
#磁盘监控组

lsm_init() {
    a=0
}
#查询磁盘使用情况
disk_used_space () {
#local disk_used=`df -hx iso9660 | grep -v Filesystem |awk '{print 'NR',$1,int($5)}'` #带行号打印磁盘文件系统和使用量
local disk_value=`df -TPhx iso9660 | awk '+$6>80{print $1}'`#取超出阀值的磁盘文件系统
local disk_perc=`df -TPhx iso9660 | awk '+$6>80{print $6}'`#取超出阀值磁盘文件系统的百分比
local value=80
local caveat="磁盘文件系统${disk_value}已使用${disk_perc}"#警告话语

#日志
 date +%F/%H/M/S >> $lsm_log
 echo 磁盘空间使用获取值：${disk_value}{disk_perc} >> $lsm_log
 
 if [ $disk_perc -ge $value ];then
     echo $caveat
     echo $caveat >> $lsm_log
 fi
 echo >> $lsm_log #空格

}
