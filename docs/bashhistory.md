# bash history

> linux 保存操作记录以便复盘

## 常用操作

使用上一个命令的最后一个参数

```
[Command] !$
```

查看历史记录

```
history | grep [keyword]
```

查看近期操作n个操作中关于ping的操作

```
history | grep ping |tail -n
```

查看历史记录及其时间

```
export HISTTIMEFORMAT='%F, %T'
```

## 删除敏感操作

有时在系统中登录数据库时不小心明文输入了密码，为了保护隐私，需要将部分或者全部历史记录删除。

删除全部历史记录

```
history -c
```

不过在大多数情况下只需要清除部分命令即可
方法1.直接修改历史记录存储文件

```
vi ~/.bash_history
```

删除不希望其他人看到的命令并保存文件退出

```
history -r 
```

方法2.删除指定行的历史记录

```
history -d 指定行号
```
