df -hx iso9660 | grep -v Filesystem |awk '{print 'NR',$1,int($5)}' #取磁盘分区文件系统和使用量的值
