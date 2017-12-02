# KRDrawLineView

## 1.Point 与 Pixel
iOS 中使用的坐标系统都是由Point来描述的。

1个point不等于 1 pixel,这样的做的好处是屏蔽屏幕的差异，在布局的时候不用关注是否Retina屏、x2、x3等屏幕信息。

point 与 pixel 的关系

```
在非Retina中：
1 point = 1 pixel

在iPhone 6、7、8中：
1 point = 2 pixel

在 iPhone Plus、iPhone X 中：
1 point = 3 pixel
```

具体通过 `[UIScreen mainScreen].scale` 获取缩放比例。`pixel = scale * point`

## 画一像素线

由上述关系我们知道了直接用point画一像素的线是不可行的，因此自然而然的想通过 **1/[UIScreen mainScreen].scale** 画一像素的线，但是在实际的使用过程中发现画出的线有些并不是一像素线具体原因可见 。
<https://developer.apple.com/library/content/documentation/2DDrawing/Conceptual/DrawingPrintingiOS/GraphicsDrawingOverview/GraphicsDrawingOverview.html>

在iOS绘图系统中使用`antialiasing(反锯齿)`技术.显示屏会有很多小单元格组成，可以理解为一个单元格就代表了一个像素。

如果一条线，正好落在一列或者一行单元内，将会渲染出标准的一像素线。

但是如果线落在**两行或者两列中间**的时候，就会不是一像素的线，这个时候系统就会做优化，使线都填充两个单元格，如图所示:

<img src="https://github.com/CoderCoderRK/KRDrawLineView/raw/master/images/pixel_alignment.png" width="320">

>Positions defined by whole-numbered points fall at the midpoint between pixels. For example, if you draw a one-pixel-wide vertical line from (1.0, 1.0) to (1.0, 10.0), you get a fuzzy grey line. If you draw a two-pixel-wide line, you get a solid black line because it fully covers two pixels (one on either side of the specified point). As a rule, lines that are an odd number of physical pixels wide appear softer than lines with widths measured in even numbers of physical pixels unless you adjust their position to make them cover pixels fully.

解决方法：

<img src="https://github.com/CoderCoderRK/KRDrawLineView/raw/master/images/regular_vs_retina.png" width="320">

>On a low-resolution display (with a scale factor of 1.0), a one-point-wide line is one pixel wide. To avoid antialiasing when you draw a one-point-wide horizontal or vertical line, if the line is an odd number of pixels in width, you must offset the position by 0.5 points to either side of a whole-numbered position. If the line is an even number of points in width, to avoid a fuzzy line, you must not do so.
On a high-resolution display (with a scale factor of 2.0), a line that is one point wide is not antialiased at all because it occupies two full pixels (from -0.5 to +0.5). To draw a line that covers only a single physical pixel, you would need to make it 0.5 points in thickness and offset its position by 0.25 points.

>在非高清屏上，一个Point对应一个像素。为了防止“antialiasing”导致的奇数像素的线渲染时出现失真，你需要设置偏移0.5 Point。
在高清屏幕上，要绘制一个像素的线，需要设置线宽为0.5个Point，同事设置偏移为0.25 Point。
如果线宽为偶数Point的话，则不要去设置偏移，否则线条也会失真。







