//
//  ViewController.swift
//  网络请求Demo
//
//  Created by ZE KANG on 2017/8/18.
//  Copyright © 2017年 LRY. All rights reserved.
//

import UIKit

import Alamofire


let SERVICE_URL     = "http://v.juhe.cn/toutiao/index?"     // 请求地址
let APPKEY          = "ad2908cae6020addf38ffdb5e2255c06"    // 应用 APPKEY
let TOP             = "top"                                 // 参数：头条



class ViewController: UIViewController {

    //定义一个全局的字典
    var dataDict = [String:Any]();
    
    var userFaceStr = String();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        methodForOC();
        methodForSwift();
       
    }
    //MARK:- OC方法的 AFNetworking
    func methodForOC() -> Void {
        //        let parameters = [
        //            "Id": "150529162646"
        //        ]
        
        let parameters = [
            "pag": "1",
            "id": "144f248abf9789911c8ab1e903ec0f10"
        ]
        
        
        WZYNetworkTool.shareInstance.request(requestType: .Get, url: kUrl, parameters: parameters, succeed: { (response) in
            guard let jsonData = response  else {
                return
            }
            print("第一数组: ",jsonData)
            
            //字典接收 JSon 数据
            self.dataDict = jsonData;
            //从字典中根据 key 提取 value 为数组的数据
            let dataArr = self.dataDict["data"] as! [Any];
            //从数组中提取字典
            let anDict = dataArr[0] as! [String : Any];
            //从字典中提值
            self.userFaceStr = anDict["userFace"] as! String ;
            self.getResult();
        }) { (error) in
            
            guard let error = error else {
                return
            }
            print(error)
        }

    }
    
    
    func getResult() {
        print("result数据: ",self.userFaceStr)
    }

    
    
    //MARK:- Swift 的 Alamofire
    func methodForSwift() -> Void {
//        let urlStr = "\(SERVICE_URL)type=\(TOP)&key=\(APPKEY)"
        
        let parameters = [
            "pag": "2",
            "id": "144f248abf9789911c8ab1e903ec0f10"
        ]
        Alamofire.request(kUrl, method: .post, parameters: parameters).responseJSON { (returnResult) in
            print("secondMethod --> 参数 --> returnResult = \(returnResult.value as Any)")
            
            
            //字典接收 JSon 数据
            self.dataDict = returnResult.value as! [String : Any] ;
            //从字典中根据 key 提取 value 为数组的数据
            let dataArr = self.dataDict["data"] as! [Any];
            //从数组中提取字典
            let anDict = dataArr[0] as! [String : Any];
            //从字典中提值
            self.userFaceStr = anDict["userFace"] as! String ;
            self.getResult();

            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    //MARK:- 跳转
    @IBAction func jumpToRefreshHandle(_ sender: Any) {
        print("跳转到刷新")
        
        self.navigationController!.pushViewController(RefreshVC(), animated: true);
        
        
        
    }
    
    
    
    
    
    
}


//MARK: - JSON 数据
/**

 {
 "result": 0,
 "msg": "",
 "data": [
 {
 "tid": "a8ddce0d0c24c8d6123585e3996b1ed840490d48",
 "userName": "你好",
 "userFace": "http://youlu.oss-cn-shenzhen.aliyuncs.com/tx/A30565F1-54F9-46E9-8953-143CA5507697.jpg",
 "title": "12",
 "pic": "",
 "time": 1500962117,
 "views": 14,
 "posts": 2
 },
 {
 "tid": "c9fda91e90f67bdfb393fa73402eadc6b37eacab",
 "userName": "你好",
 "userFace": "http://youlu.oss-cn-shenzhen.aliyuncs.com/tx/A30565F1-54F9-46E9-8953-143CA5507697.jpg",
 "title": "【政 策】国务院发布《关于加快电动汽车充电基础设施建设的指导意见》",
 "pic": "",
 "time": 1500694771,
 "views": 42,
 "posts": 2
 },
 {
 "tid": "5da93a134e4f35ece1a196b442bfeb7e25b6cfbf",
 "userName": "你好",
 "userFace": "http://youlu.oss-cn-shenzhen.aliyuncs.com/tx/A30565F1-54F9-46E9-8953-143CA5507697.jpg",
 "title": " 深圳音美特携手卓越星源共同为您筑音乐梦 ",
 "pic": "",
 "time": 1500694666,
 "views": 25,
 "posts": 1
 },
 {
 "tid": "d86695be40070128765f6554b340f3042e4147dc",
 "userName": "你好",
 "userFace": "http://youlu.oss-cn-shenzhen.aliyuncs.com/tx/A30565F1-54F9-46E9-8953-143CA5507697.jpg",
 "title": "低速电动车的安全之道",
 "pic": "http://imgread.alllu.com//bbs/1b458716-3d8c-444a-a4e8-75030db58ce3.jpg",
 "time": 1500694704,
 "views": 12,
 "posts": 1
 },
 {
 "tid": "d5c406efe696381d222bff45ec9deb088823d301",
 "userName": "Hello",
 "userFace": "http://youlu.oss-cn-shenzhen.aliyuncs.com/tx/3373756D-4CF6-4C6F-B548-7B41EE80D150.jpg",
 "title": "电动自行车，代步出行真方便",
 "pic": "",
 "time": 1500694955,
 "views": 10,
 "posts": 1
 },
 {
 "tid": "2d958c3e8c08c79d066b99ab122f82b9ee044c83",
 "userName": "Hello",
 "userFace": "http://youlu.oss-cn-shenzhen.aliyuncs.com/tx/3373756D-4CF6-4C6F-B548-7B41EE80D150.jpg",
 "title": "中秋节快乐",
 "pic": "http://imgread.alllu.com/bbs/300c6c49-e202-45b5-922a-550c30455c05.jpg",
 "time": 1500694922,
 "views": 19,
 "posts": 0
 }
 ],
 "url": ""
 }
 
 */


