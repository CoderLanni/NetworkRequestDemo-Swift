//
//  RefreshVC.swift
//  网络请求Demo
//
//  Created by ZE KANG on 2017/8/21.
//  Copyright © 2017年 LRY. All rights reserved.
//

import UIKit

import Alamofire

var kSize=UIScreen.main.bounds;

var dataTable:UITableView!
var itemStringArr=["企划部","软件部","咨询部","人事部","后勤部","产品部"]


class RefreshVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var titleArr = Array<String>();
    var picArr = [String]();
    

    var page = 1;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//          methodForSwift(str: page);
        
        initUI();
      
       
    }
    
    func initUI() -> Void {
        self.title = "刷新"
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1);
        makeTable();
        
        dataTable.refreshHeader = LCRefreshHeader.init(refreshBlock: {[unowned self] in
            print("header")
            self.perform(#selector(self.headerRefresh), with: nil, afterDelay: 2)
        })
        
       dataTable.refreshFooter = LCRefreshFooter.init(refreshBlock: {[unowned self] in
            print("footer")
            self.perform(#selector(self.footerRefresh), with: nil, afterDelay: 2)
        })
        
        dataTable.tableFooterView = UIView.init(frame: CGRect(x: 0, y: 0, width: 300, height: 5))
        headerRefresh();

    }
    
    func headerRefresh() {
        
        if dataTable.isHeaderRefreshing() {
            self.titleArr.removeAll();
            self.picArr.removeAll();
            page = 1;
            methodForSwift(str: page);
            
            dataTable.reloadData()
            
            dataTable.resetDataLoad()
            dataTable.endHeaderRefreshing()
        }
        
        
    }
    
    func footerRefresh() {
        
        if dataTable.isFooterRefreshing() {
            page+=1;
            methodForSwift(str: page);
            dataTable.reloadData()
            

            dataTable.endFooterRefreshing()
        }
       //        //截止符
//        if numRows > 60 {
//            dataTable.setDataLoadover()
//        }
    }
    
    

    //MARK:- Networking
    /// Swift 的 Alamofire
    func methodForSwift(str:Int) -> Void {
        //        let urlStr = "\(SERVICE_URL)type=\(TOP)&key=\(APPKEY)"
        print("页数: ",str)
        let num:String = String(str);
        
        let parameters = [
            "pag": num,
            "id": "144f248abf9789911c8ab1e903ec0f10"
        ]
        Alamofire.request(kUrl, method: .post, parameters: parameters).responseJSON { (returnResult) in
//            print("secondMethod --> 参数 --> returnResult = \(returnResult.value as Any)")
            
            
            //字典接收 JSon 数据
           let dataDict = returnResult.value as! [String : Any] ;
            //从字典中根据 key 提取 value 为数组的数据
            let dataArr = dataDict["data"] as! [Any];
            for dic in dataArr{
//                print("title 数值: ",dic);
                //从数组中提取字典
                let anDict = dic as! [String : Any];
                //从字典中提值
                let picStr = anDict["userFace"] as! String ;
                let titleStr = anDict["title"] as! String ;
                
                self.titleArr.append(titleStr);
                self.picArr.append(picStr);
            }
//             print("title 数租: ",self.titleArr);
            //主线程刷新 UI
            DispatchQueue.main.async {

                 self.forInArrayHandel();
                dataTable.reloadData()
              
            }
        }
    }

   //MARK:- forIn 数组
    func forInArrayHandel() -> Void {
        for title in self.titleArr{
             print("title 数值: ",title);
        }
    }

    // MARK:- 创建table
    func makeTable (){
       
        dataTable=UITableView.init(frame: CGRect(x: 0.0, y:0, width: kSize.width, height: kSize.height), style:.plain)
        dataTable.backgroundColor = UIColor.groupTableViewBackground;
        dataTable.delegate=self;//实现代理
        dataTable.dataSource=self;//实现数据源
        dataTable.showsVerticalScrollIndicator = false
        dataTable.showsHorizontalScrollIndicator = false
        self.view.addSubview(dataTable)
        
        
        //tableFooter
        dataTable.tableFooterView = UIView.init()
        
        //MARK:注册 xib Cell(没有 xib)
//        dataTable .register(RefreshCell.classForCoder(), forCellReuseIdentifier: "identti")
        
        //MARK:注册 xib Cell(使用 xib)
        let cellNib = UINib(nibName: "RefreshCell", bundle: nil)
        dataTable.register(cellNib, forCellReuseIdentifier: "identti")
        
        methodForSwift(str: page)
    }
    
    // MARK: -table代理
    
    //段数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemStringArr.count
        return self.titleArr.count;
    }
    
    //行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 150
    }
    
    /*
     //头部高度
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     return 0.01
     }
     
     //底部高度
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
     return 0.01
     }
     */
    
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*
         let indentifier = "CellA"
         var cell:TableViewCellA! = tableView.dequeueReusableCell(withIdentifier: indentifier) as? TableViewCellA
         if cell == nil {
         cell=TableViewCellA(style: .default, reuseIdentifier: indentifier)
         }
         
         
         return cell!
         */
       
        //MARK: 没有创建 TabelViewCell 文件,直接在本 VC 中复用
        /*
        let identifier="identtifier";
        var cell=tableView.dequeueReusableCell(withIdentifier: identifier)
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier);
        }
        
       
          cell?.textLabel?.text = self.titleArr[indexPath.row];
        cell?.detailTextLabel?.text = "待添加内容";
        cell?.detailTextLabel?.font = UIFont .systemFont(ofSize: CGFloat(13))
        cell?.accessoryType=UITableViewCellAccessoryType.disclosureIndicator   //右边小箭头
        
        return cell!
         */
        
        //MARK:另外创建了 TabelViewCell 文件
        let cell:RefreshCell = tableView.dequeueReusableCell(withIdentifier: "identti", for: indexPath) as! RefreshCell
         cell.titleLabel?.text = self.titleArr[indexPath.row];
        //定义URL对象
        let url = URL(string:  self.picArr[indexPath.row])
        //从网络获取数据流
        let data = try! Data(contentsOf: url!)
        //通过数据流初始化图片
        let newImage = UIImage(data: data)
        cell.picImg.image = newImage;
        print("图片: ",self.picArr[indexPath.row])
        
        return cell;
    }
    
    //选中cell时触发这个代理
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("indexPath.row = SelectRow第\(indexPath.row)行")
    }
    
    //取消选中cell时，触发这个代理
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
        print("indexPath.row = DeselectRow第\(indexPath.row)行")
    }
    
    //允许编辑cell
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //右滑触发删除按钮
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.init(rawValue: 1)!
    }
    
    //点击删除cell时触发
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("indexPath.row = editingStyle第\(indexPath.row)行")
        
    }
    
    
}
