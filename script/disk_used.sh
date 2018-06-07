#!/bin/bash
#磁盘监控组

#查询磁盘使用情况
disk_used_space () {
local disk_used=`df -hx iso9660 | grep -v Filesystem |awk '{print 'NR',$1,int($5)}'` #带行号打印磁盘文件系统和使用量
local disk_value=`df -hx iso9660 | grep -v Filesystem |awk '{print 'NR',$1,int($5)}'|awk '{if($3>80) print $2}'` #取超出阀值的磁盘文件系统
local value=80
local caveat=""

}
