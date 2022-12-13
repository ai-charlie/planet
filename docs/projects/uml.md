# pyreverse-uml

> 使用pyreverse生成python项目的uml图
## 安装
### graphviz
[https://graphviz.org/download/](https://graphviz.org/download/)

#### ubuntu
```
sudo apt-get install graphviz*
```
## pyreverse
pyreverse能方便的生成uml类图，pylint里自带了pyreverse这个工具。使用pip安装pylint
```
pip install pylint
```
或
```
pip install pyreverse
```

## 开始使用
一般使用为：
```
pyreverse -ASmy -o png /path/main.py
```
**-ASmy**：为`pyreverse`选项参数，可以通过`pyreverse --help` 查看所有参数。`-ASmy`产生的结果最详细，甚至包括了类属性的结果解析。如果只需要类与类的uml图，建议不加`-ASmy`。

**-o** 指定输出文件格式，支持`png, svg, dot`等
path 为要解析的文件或文件夹