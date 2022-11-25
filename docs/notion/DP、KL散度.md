# 分布

## 熵

其中 $H(P)$为熵 (entropy), $H(P, Q) $为 $P$ 和 $Q$的交叉熵 $(cross entropy)$。

在信息论中，熵 $H ( P )$ 表示对来自 $P $ 的随机变量进行编码所需的最小字节数，而交叉熵 $H(P,Q) $则表示使用基于$Q $的编码对来自$P$的变量进行编码所需的字节数。

因此，$KL $散度可认为是使用基于$ Q$的编码对来自 $P$的变量进行编码所需的 “额外” 字节数; 显然，额外字节数必然非负，当且仅当 $P=Q $时额外字节数为零。

## KL散度

又称相对熵或者信息散度，用于度量两个概率分布之间的差异

给定两个概率分布$P$和$Q$，$P$和$Q$之间的$KL$散度为

$$
KL(P||Q)=\int_{-\infty}^{\infty}p(x)log\frac{p(x)}{q(x)}dx
$$

$$
KL(P||Q)=\int_{-\infty}^{\infty}p(x)log{p(x)}dx-\int_{-\infty}^{\infty}p(x)log{q(x)}dx=-H(P)+H(P,Q)
$$

## 贝叶斯概率


## 高斯分布和混合高斯随机变量

连续型标量随机变量x的概率密度函数

$$
p(x)=\frac{1}{(2\pi\sigma^2)^\frac{1}{2}}exp[-\frac{1}{2}(\frac{x-\mu}{\sigma})^2]\approx\mathcal{N}(x;\mu,\sigma^2)
$$

服从高斯分布。

使用精度参数（r=方差的倒数=$\frac{1}{\sigma^2}$,$\sigma=\frac{1}{\sqrt{r}}$）代替方差后，

$$
p(x)=\sqrt{\frac{r}{2\pi}}exp[-\frac{r}{2}({x-\mu})^2]\approx\mathcal{N}(x;\mu,\sigma^2)
$$
