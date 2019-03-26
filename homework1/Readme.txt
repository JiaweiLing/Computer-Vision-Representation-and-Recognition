Question 2
卷积函数在myImageFilter.m文件中编写， 可以读入一个图像文件（如Lenna.png），I代表图像矩阵，F代表滤波器。
在命令行窗口读入文件（例如Image = imread('Lenna.png');），然后输入卷积核（可以自定义），
然后在命令行键入myImageFilter(I, F)即可得到结果

Question 3.1
本道题是关于全局灰度直方图均衡化的题目, matlab代码在myGlobal.m中, 可以在matlab中全选代码按F9运行
在myGlobal.m中包含两个部分,
第一部分是将Lenna.png转换成灰度图, 输出Lenna.png的灰度直方图和累积分布函数图像
第二部分是在RGB色彩空间下将Lenna.png直方图均衡化
最后输出5张图片, 第一张是原图, 第二张是转换成灰度图的输出, 第三张是灰度直方图, 第四张是累积分布函数, 第五张是直方图均衡化的结果.

Question 3.2
本道题是关于局部灰度直方图均衡化的题目, matlab代码在myLocal.m中, 可以在matlab中全选代码按F9运行
代码有两个输出, 第一张图是将原图转换成灰度图的结果, 第二张图是将灰度图进行局部直方图均衡化后的结果