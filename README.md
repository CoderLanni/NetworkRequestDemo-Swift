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

**<font size=4>前去下载最新的 &emsp; [Alamofire](https://github.com/Alamofire/Alamofire)  &emsp;第三方</font>

## part1: 导入工程:

### 1. 根据前面下载一个版本的 Alamofire  文件~
### 2. 新建一个工程~
<img src="http://img.blog.csdn.net/20170821190715489?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMTk2Nzg1Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast"  width=50% /> 
### 3.拷贝 Alamofire 文件到我们新建的工程中~
<img src="http://img.blog.csdn.net/20170821190509000?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMTk2Nzg1Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast"  width=50% />
### 4.添加文件到我们自己的工程中~
<img src="http://img.blog.csdn.net/20170821190919467?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMTk2Nzg1Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast"  width=50% /> &emsp;&emsp;
<img src="http://img.blog.csdn.net/20170821191225560?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMTk2Nzg1Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast"  width=50% />&emsp;&emsp;<img src="http://img.blog.csdn.net/20170821191331188?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMTk2Nzg1Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast"  width=50% title="3" />
### 5.检查一下我们静态库有没有加到工程~没有的话我们手动添加一下~
<img src="http://img.blog.csdn.net/20170821191812077?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMTk2Nzg1Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast"  width=50% />
结果应该是这样:
<img src="http://img.blog.csdn.net/20170821191917805?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMTk2Nzg1Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast"  width=50% />

### 6.导入头文件import Alamofire检查是否配置错误~这里可能没有提示~直接敲完~编译一下就OK了~

<img src="http://img.blog.csdn.net/20170821192100495?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMTk2Nzg1Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast"  width=50% />

----------
<tr>
<tr>

----------


## part2: 使用 Alamofire


```
 func methodForSwift() -> Void {
        //        let urlStr = "\(SERVICE_URL)type=\(TOP)&key=\(APPKEY)"
        let kUrl = "http://community.alllu.com/?api-threadList"
        let parameters = [
            "pag": "2",
            "id": "144f248abf9789911c8ab1e903ec0f10"
        ]
        Alamofire.request(kUrl, method: .post, parameters: parameters).responseJSON { (returnResult) in
            print("secondMethod --> 参数 --> returnResult = \(returnResult.value as Any)")
            
            
            //字典接收 JSon 数据
           let dataDict = returnResult.value as! [String : Any] ;
            //从字典中根据 key 提取 value 为数组的数据
            let dataArr = dataDict["data"] as! [Any];
            for dic in dataArr{
                print("title 数值: ",dic);
                //从数组中提取字典
                let anDict = dic as! [String : Any];
                //从字典中提值
                let userFaceStr = anDict["userFace"] as! String ;
                print("提取单个图片=地址: ",userFaceStr);
                let picStr = anDict["userFace"] as! String ;
                let titleStr = anDict["title"] as! String ;
                
                self.titleArr.append(titleStr);
                self.picArr.append(picStr);
            }
//             print("title 数租: ",self.titleArr);
			  //主线程刷新 UI
            DispatchQueue.main.async {
                 self.makeTable();
                 self.forInArrayHandel();
            }
        }
    }

```

----------
参考于:[笨笨编程](http://www.jianshu.com/p/42aa9b5b70a3)

