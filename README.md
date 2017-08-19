# NetworkRequestDemo-Swift

网络请求Demo--Swift





# 一.使用 AFNetworking 第三方(OC 混编)

## 1. 导入 AFNetworking 第三方

<img src="http://img.blog.csdn.net/20170818182804839?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMTk2Nzg1Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" width=30%/>

## 2. 建立 Swift 与 OC 的桥接头文件

[请点击前往,参考这篇文章建立桥接](http://blog.csdn.net/qq_19678579/article/details/77376571)

## 3. 在操作的 VC 中实现代码
在 viewDidLoad 方法中
```
 
        let parameters = [
            "Id": "150529162646"
        ]

        
        WZYNetworkTool.shareInstance.request(requestType: .Get, url: kUrl, parameters: parameters, succeed: { (response) in
            guard let dicArray = response  else {
                return
            }
            print(dicArray)
            
        }) { (error) in
            
            guard let error = error else {
                return
            }
            print(error)
        }
        

    }

```
- 1
  ![这里写图片描述](http://img.blog.csdn.net/20170818183522024?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMTk2Nzg1Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

- 2
  ![这里写图片描述](http://img.blog.csdn.net/20170818183926724?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMTk2Nzg1Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

- 3 
  ![这里写图片描述](http://img.blog.csdn.net/20170818184136791?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMTk2Nzg1Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

- 4 可能这种理解会有bug
  ![这里写图片描述](http://img.blog.csdn.net/20170818184812581?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMTk2Nzg1Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)


源码下载:



















----------

----------


<tr>
<tr>
<tr>
<tr>

# 二. 使用 Alamofire 第三方 ( Swift )

