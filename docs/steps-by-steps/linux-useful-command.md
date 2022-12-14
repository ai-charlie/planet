# Base-Usages
env:Ubuntu

### change passwd
```bash
passwd [user]
```

### system disk used
```bash
df -h
```

### current folder disk used
```bash
du -sh
```

### conda activate
```bash
source /opt/conda/bin/activate base
```
### system info  
```bash
uname -a # 查看内核/操作系统/CPU信息
cat /proc/cpuinfo # 查看CPU信息
hostname # 查看计算机名
lspci -tv # 列出所有PCI设备
lsusb -tv # 列出所有USB设备
lsmod # 列出加载的内核模块
env # 查看环境变量
modinfo softdog # 查看模块信息
```

### system resources

    
```bash
free -m # 查看内存使用量和交换区使用量
df -h # 查看各分区使用情况
du -sh <目录名> # 查看指定目录的大小
grep MemTotal /proc/meminfo # 查看内存总量
grep MemFree /proc/meminfo # 查看空闲内存量
uptime # 查看系统运行时间、用户数、负载
cat /proc/loadavg # 查看系统负载
```

### disk

```bash
mount | column -t # 查看挂接的分区状态
fdisk -l # 查看所有分区
swapon -s # 查看所有交换分区
hdparm -i /dev/hda # 查看磁盘参数(仅适用于IDE设备)
dmesg | grep IDE # 查看启动时IDE设备检测状况
```
### network
    
```bash
ifconfig # 查看所有网络接口的属性
route -n # 查看路由表
netstat # 查看所有监听端口和建立的连接
```

### process

    
```bash
ps -ef # 查看所有进程
top # 实时显示进程状态
```
### user
    
```bash
w # 查看活动用户
id <用户名> # 查看指定用户信息
last # 查看用户登录日志
cut -d: -f1 /etc/passwd # 查看系统所有用户
cut -d: -f1 /etc/group # 查看系统所有组
```
