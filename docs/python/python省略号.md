# python 中省略号（...）

省略号（...）在Python有着广泛的应用，尤其是一些底层代码中，经常能看到大量的省略号（...）。

## 省略号（...）是什么？

省略号（...）的底层代码很简单，如下所示。`@final`装饰器的意思是该类不允许被继承。

```python
# Actually the type of Ellipsis is <type 'ellipsis'>, but since it's
# not exposed anywhere under that name, we make it private here.
@final
class ellipsis: ...

Ellipsis: ellipsis
```

而如下的代码的输出结果说明：**Ellipsis就是省略号（...），省略号（...）就是Ellipsis**。**而Ellipsis是ellipsis类的唯一实例（singleton object）**，这种唯一实例的模式也称为单例模式（singleton pattern）

```python
print(type(...))            # output: <class 'ellipsis'>
print(Ellipsis == ...)      # True
print(...)                  # Ellipsis
```

## python 中省略号（...）的作用
### 2.1 类型提示

关于Python中的类型提示（type hints）详见[【Python】作为动态语言，Python中的“类型声明”有什么用？](https://zhuanlan.zhihu.com/p/485613803)。省略号（...）在类型提示中经常被使用，如

```python
from typing import Callable, Tuple

Callable[..., int]  # 输入参数随意，返回值为int
Tuple[int, ...]     # int组成的元组
```

### 2.2 函数内部，相当于pass

以下两个写法没有太大区别

```python
def foo1(): pass
def foo2(): ...
```

### 2.3 numpy中的索引

```python
import numpy as np

arr = np.random.random((2,2,2))
print(arr)
print(arr[..., 0, 0])
```

## 参考

1.  python单例模式 [https://zhuanlan.zhihu.com/p/88400968](https://zhuanlan.zhihu.com/p/88400968)