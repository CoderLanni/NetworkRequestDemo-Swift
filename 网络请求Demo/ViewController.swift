//
//  ViewController.swift
//  网络请求Demo
//
//  Created by ZE KANG on 2017/8/18.
//  Copyright © 2017年 LRY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

