# CLScrollPageView
# 使用swift3.0 写的一个小demo,简单实现功能,后续会更新...

![](http://f.hiphotos.baidu.com/image/pic/item/5ab5c9ea15ce36d32808e2e832f33a87e850b1de.jpg)

#使用方法 :

###实例化pageView
```swift
//实例化
let pageView = CLScrollPageView(frame:CGRect(x: 0, y: 64, width: KScreenWidht, height: KScreenHeight),
titleArray: titleArray,
pageArray: vcArray)
``
###添加

```
view.addSubview(pageView)
``
