
| pathlib操作             | os及os.path操作      | 功能描述                                                                       |
| ----------------------- | -------------------- | ------------------------------------------------------------------------------ |
| Path.resolve()          | os.path.abspath()    | 获得绝对路径                                                                   |
| Path.chmod()            | os.chmod()           | 修改文件权限和时间戳                                                           |
| Path.mkdir()            | os.mkdir()           | 创建目录                                                                       |
| Path.rename()           | os.rename()          | 文件或文件夹重命名，如果路径不同，会移动并重新命名                             |
| Path.replace()          | os.replace()         | 文件或文件夹重命名，如果路径不同，会移动并重新命名，如果存在，则破坏现有目标。 |
| Path.rmdir()            | os.rmdir()           | 删除目录                                                                       |
| Path.unlink()           | os.remove()          | 删除一个文件                                                                   |
| Path.unlink()           | os.unlink()          | 删除一个文件                                                                   |
| Path.cwd()              | os.getcwd()          | 获得当前工作目录                                                               |
| Path.exists()           | os.path.exists()     | 判断是否存在文件或目录name                                                     |
| Path.home()             | os.path.expanduser() | 返回电脑的用户目录                                                             |
| Path.is\_dir()          | os.path.isdir()      | 检验给出的路径是一个文件                                                       |
| Path.is\_file()         | os.path.isfile()     | 检验给出的路径是一个目录                                                       |
| Path.is\_symlink()      | os.path.islink()     | 检验给出的路径是一个符号链接                                                   |
| Path.stat()             | os.stat()            | 获得文件属性                                                                   |
| PurePath.is\_absolute() | os.path.isabs()      | 判断是否为绝对路径                                                             |
| PurePath.joinpath()     | os.path.join()       | 连接目录与文件名或目录                                                         |
| PurePath.name           | os.path.basename()   | 返回文件名                                                                     |
| PurePath.parent         | os.path.dirname()    | 返回文件路径                                                                   |
| Path.samefile()         | os.path.samefile()   | 判断两个路径是否相同                                                           |
| PurePath.suffix         | os.path.splitext()   | 分离文件名和扩展名                                                             |

在创建PurePath和Path时，既可以传入单个字符串，也可传入多个路径字符串，PurePath会将它们拼接成一个字符串。

```
from pathlib import *

PurePath('M工具箱','MTool工具/示例','info')

```

**获取目录**

- Path.cwd()，返回文件当前所在目录；
- Path.home()，返回电脑用户的目录。

```
from pathlib import *

Path.cwd()
# 结果： WindowsPath('D:/M工具箱')

Path.home()
# 结果： WindowsPath('C:/Users/okmfj')
```

**目录拼接**

拼接出Windows桌面路径，当前路径下的子目录或文件路径。

```
from pathlib import *

# 拼接出Windows桌面路径
Path(Path.home(), "Desktop")
# 结果： WindowsPath('C:/Users/okmfj/Desktop')

# 拼接出Windows桌面路径
Path.joinpath(Path.home(), "Desktop")
# 结果： WindowsPath('C:/Users/okmfj/Desktop')

# 拼接出当前路径下的“MTool工具”子文件夹路径
Path.cwd() / 'MTool工具'
# 结果： WindowsPath('D:/M工具箱/MTool工具')
```

### **2）路径处理**

获取路径的不同部分、或不同字段等内容，用于后续的路径处理，如拼接路径、修改文件名、更改文件后缀等。

```
from pathlib import *

input_path = r"C:\Users\okmfj\Desktop\MTool工具"

Path(input_path).name  # 返回文件名+文件后缀


Path(input_path).stem  # 返回文件名

Path(input_path).suffix  # 返回文件后缀

Path(input_path).suffixes  # 返回文件后缀列表


Path(input_path).root  # 返回根目录


Path(input_path).parts  # 返回文件

Path(input_path).anchor  # 返回根目录

Path(input_path).parent  # 返回父级目录

Path(input_path).parents  # 返回所有上级目录的列表
```

### 3）路径判断

- Path.exists()，判断 Path 路径是否是一个已存在的文件或文件夹；
- Path.is\_dir()，判断 Path 是否是一个文件夹；
- Path.is\_file()，判断 Path 是否是一个文件。

```
from pathlib import *

input_path = r"C:\Users\okmfj\Desktop\MTool工具"

if Path(input_path ).exists():
if Path(input_path ).is_file():
print("是文件！")
elif Path(input_path ).is_dar():
print("是文件夹！")
else:
print("路径有误，请检查!")
```

### 4）路径建立、删除

- Path.mkdir()，创建文件夹；
- Path.rmdir()，删除文件夹，文件夹必须为空；
- Path.unlink()，删除文件。

```
from pathlib import *

input_path = r"C:\Users\okmfj\Desktop\MTool工具"

# 创建文件夹函数
def creat_dir(dir_path):
if Path(dir_path).exists():  # 如果已经存在，则跳过并提示
print("文件夹已经存在！")
else:
Path.mkdir(Path(dir_path))  # 创建文件夹

creat_dir(input_path )  # 调用函数

# 删除文件夹函数
def del_dir(dir_path):
if Path(dir_path).exists():  # 如果存在，则删除文件夹
Path.rmdir(Path(dir_path))
else:
print("文件夹不存在！")  # 文件夹不存在

del_dir(input_path )  # 调用函数

# 删除文件函数
def del_file(dir_path):
if Path(dir_path).exists():  # 如果存在，则删除文件
Path.unlink()(Path(dir_path))
else:
print("文件不存在！")  # 文件不存在

del_file(input_path )  # 调用函数
```

### 5）路径匹配查找（迭代）

- Path.iterdir()，查找文件夹下的所有文件，返回的是一个生成器类型；
- Path.glob(pattern)，查找文件夹下所有与 pattern 匹配的文件，返回的是一个生成器类型；
- Path.rglob(pattern)，查找文件夹下所有子文件夹中与 pattern 匹配的文件，返回的是一个生成器类型。

**iterdir方法**

```
from pathlib import *

input_path = r"C:\Users\okmfj\Desktop\MTool工具"

# 获取文件夹下所有文件，返回文件路径（字符）列表，采用iterdir方法
[str(f) for f in Path(x).iterdir() if Path(f).is_file()]

# 获取文件夹下所有文件类型，返回文件后缀的列表，采用iterdir方法
list(set([Path(f).suffix for f in Path(x).iterdir() if Path(f).is_file()]))
# 结果： ['.pdf', '.txt', '.docx']
```

**glob方法**

```
from pathlib import *

input_path = r"C:\Users\okmfj\Desktop\MTool工具"

# 获取文件夹下所有文件，返回文件路径（字符）列表，采用glog方法
[str(f) for f in Path(input_path).glob(f"*.*") if Path(f).is_file()]

# 获取文件夹下所有文件，返回文件路径（字符）列表，采用glog方法
[str(f) for f in Path(input_path).glob(f"**\*.*") if Path(f).is_file()]

# 获取文件夹下所有文件类型，返回文件后缀的列表，采用glog方法
list(set([Path(f).suffix for f in Path(input_path).glob(f"*.*") if Path(f).is_file()]))
# 结果： ['.pdf', '.txt', '.docx']

# 获取文件夹下（含子文件）所有文件类型，返回文件后缀的列表，采用glog方法
list(set([Path(f).suffix for f in Path(x).glob(f"**\*.*") if Path(f).is_file()]))
# 结果： ['.pdf', '.txt', '.docx']
```

**rglob方法**

```
from pathlib import *

input_path = r"C:\Users\okmfj\Desktop\MTool工具"

# 获取文件夹下（含子文件）所有文件，返回文件路径(字符)列表，采用rglog方法
[str(f) for f in Path(x).rglob(f"*.*") if Path(f).is_file()]

# 获取文件夹下（含子文件）所有文件类型，返回文件后缀的列表，采用rglog方法
list(set([Path(f).suffix for f in Path(x).rglob(f"*.*") if Path(f).is_file()]))
# 结果： ['.pdf', '.txt', '.docx']
```

### 6）读、写文件

- Path.open(mode='r')，以 "r" 格式打开 Path 路径下的文件，若文件不存在即创建后打开。
- Path.read\_bytes()，打开 Path 路径下的文件，以字节流格式读取文件内容，等同 open 操作文件的 "rb" 格式。
- Path.read\_text()，打开 Path 路径下的文件，以 str 格式读取文件内容，等同 open 操作文件的 "r" 格式。
- Path.write\_bytes()，对 Path 路径下的文件进行写操作，等同 open 操作文件的 "wb" 格式。
- Path.write\_text()，对 Path 路径下的文件进行写操作，等同 open 操作文件的 "w" 格式。

![](https://pic4.zhimg.com/v2-6575c60a57fbf05cf64144b74d8f03ab_b.jpg)

读、写模式汇总表

```
from pathlib import *

input_path = r"C:\Users\okmfj\Desktop\MTool工具\1.txt"

with Path(input_path).open('w') as f:  # 创建并打开文件
f.write('M工具箱')  # 写入内容
f = open(input_path, 'r')  # 读取内容
print(f"读取的文件内容为：{f.read()}")
f.close()
```

### 7）属性和方法汇总

**PurePath 类属性和方法汇总**

![](https://pic3.zhimg.com/v2-dfcb4f5442973aa7f8058075f949660e_b.jpg)

PurePath 类属性和方法汇总表

**Path 类属性和方法汇总**

![](https://pic2.zhimg.com/v2-2983703aa2b4632016e25c4fe5a8b0d9_b.jpg)

Path 类属性和方法汇总表

## 4 应用实例

### 1）实例1：获取文件列表（函数）

通过函数，返回文件列表，为后续迭代处理做好准备。

**参数：**

- path：输入路径，支持文件路径和文件夹路径。
- sub\_dir：当为True时含子目录，为False时不含子目录
- suffix\_list：文件类型列表，按要求的列出全部符合条件的文件，为空时列出全部文件，如：\[".xlsx",".xls"\]

```
from pathlib import *

def file_list_handle(path, sub_dir=False, suffix_list=[]):
"""
path：输入路径，支持文件路径和文件夹路径
        sub_dir：当为True时含子目录，为False时不含子目录 
        suffix_list：文件类型列表，按要求的列出全部符合条件的文件，为空时列出全部文件，如：[".xlsx",".xls"]
"""
file_list = []
if not suffix_list:
if sub_dir:
[suffix_list.append(Path(f).suffix) for f in Path(path).glob(f"**\*.*") if Path(f).is_file()]
else:
[suffix_list.append(Path(f).suffix) for f in Path(path).glob(f"*.*") if Path(f).is_file()]
suffix_list = list(set(suffix_list))
# [print(i) for i in suffix_list]
if Path(path).exists():
# 目标为文件夹
if Path(path).is_dir():
if sub_dir:
for i in suffix_list:
[file_list.append(str(f)) for f in Path(path).glob(f"**\*{i}")]
else:
[file_list.append(str(f)) for f in Path(path).iterdir() if Path(f).is_file and f.suffix in suffix_list]
elif Path(path).is_file():
file_list = [path]

# 去除临时文件
file_list_temp = []
for y in file_list:
if "~$" in Path(y).stem:
continue
file_list_temp.append(y)
file_list = file_list_temp
return file_list
else:
print("输入有误！")
return []
```

### 2）实例2：定义文件路径

在输入文件路径的基础上，通过函数，构造输出文件路径，为后续处理、存储做好准备。

**参数：**

- in\_path：输入文件路径
- path\_str：文件路径构造字符
- file\_suffix：输出文件后缀

```
from pathlib import *
from datetime import datetime

input_path = r"C:\Users\hp\Desktop\MTool工具\1.txt"

def out_path_handle(in_path, path_str="", file_suffix=""):
"""
in_path：输入文件路径
        path_str：文件路径构造字符
        file_suffix：输出文件后缀
"""
if path_str == "":
path_str = str(datetime.now()).replace(":", "").replace(" ", "_").replace("-", "").replace(".", "_")[
           :22]
elif path_str[-1] == "_":
path_str = path_str + str(datetime.now()).replace(":", "").replace(" ", "_").replace("-", "").replace(
".", "_")[:22]
if file_suffix == "":
file_suffix = Path(in_path).suffix

if Path(in_path).exists():
if Path(in_path).is_dir():
path = Path(in_path).joinpath(path_str + file_suffix)
elif Path(in_path).is_file():
path = Path(in_path).parent.joinpath(Path(in_path).stem + "_" + path_str + file_suffix)
return path

else:
print("输入有误！")
return []

# 调用函数
out_path_handle(input_path,"已处理",".xlsx")
# 结果： WindowsPath('C:/Users/hp/Desktop/MTool工具/1_已处理.xlsx')

# 调用函数
out_path_handle(input_path,"_",".xlsx")
# 结果：WindowsPath('C:/Users/hp/Desktop/MTool工具/1_20220304_135344_003210.xlsx')
```

## 5 总结

以上详细介绍了Python中路径操作的标准模块：pathlib，鉴于pathlib的优势，建议在python中优先使用，可以使路径处理更简洁、路径处理错误更少、编程效率更高、代码更易读。

其他未尽情况，可参见官方文档：[pathlib - pathlib 1.0.1 documentation](https://link.zhihu.com/?target=https%3A//pathlib.readthedocs.io/en/pep428/)
