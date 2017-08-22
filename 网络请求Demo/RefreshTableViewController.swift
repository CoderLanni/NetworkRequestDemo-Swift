//
//  RefreshTableViewController.swift
//  网络请求Demo
//
//  Created by ZE KANG on 2017/8/22.
//  Copyright © 2017年 LRY. All rights reserved.
//

import UIKit

class RefreshTableViewController: UITableViewController {

    //新闻数组集合
//    var dataArray:[HanggeArticle] = [HanggeArticle]()
     var numRows = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        initUI();
        
        
    }
    
    func initUI() -> Void {
        self.tableView.refreshHeader = LCRefreshHeader.init(refreshBlock: {[unowned self] in
            print("header")
            self.perform(#selector(self.headerRefresh), with: nil, afterDelay: 2)
        })
        
        self.tableView.refreshFooter = LCRefreshFooter.init(refreshBlock: {[unowned self] in
            print("footer")
            self.perform(#selector(self.footerRefresh), with: nil, afterDelay: 2)
        })
        
        self.tableView.tableFooterView = UIView.init(frame: CGRect(x: 0, y: 0, width: 300, height: 5))
        headerRefresh();
    }
    
    
    func headerRefresh() {
        
        if self.tableView.isHeaderRefreshing() {
            self.tableView.endHeaderRefreshing()
        }
        
        numRows = 21
        self.tableView.reloadData()
        
        self.tableView.resetDataLoad()
    }
    
    func footerRefresh() {
        
        if self.tableView.isFooterRefreshing() {
            self.tableView.endFooterRefreshing()
        }
        
        numRows += 10
        self.tableView.reloadData()
        
        //截止符
        if numRows > 60 {
            self.tableView.setDataLoadover()
        }
    }
    

    
    
    
    
  
   /*
    func initUI() -> Void {
        self.title = "刷新"
        
        //初始化刷新
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.addTarget(self, action: #selector(refreshData),
                                       for: .valueChanged)
        self.refreshControl!.attributedTitle = NSAttributedString(string: "下拉刷新数据")
        refreshData()
    }
    
    // 刷新数据
    func refreshData() {
        //移除老数据
        self.dataArray.removeAll()
        //随机添加5条新数据（时间是当前时间）
        for _ in 0..<5 {
            let atricle = HanggeArticle(title: "新闻标题\(Int(arc4random()%1000))",
                createDate: Date())
            self.dataArray.append(atricle)
        }
        self.tableView.reloadData()
        self.refreshControl!.endRefreshing()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    // 返回单元格内容
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = UITableViewCell(style: UITableViewCellStyle.subtitle,
                                       reuseIdentifier: "myCell")
            //设置单元格标题
            let atricle: HanggeArticle = dataArray[indexPath.row] as HanggeArticle
            cell.textLabel?.text = atricle.title
            
            //设置单元格副标题
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let str = dateFormatter.string(from: atricle.createDate)
            cell.detailTextLabel?.text = str
            
            return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
*/
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView,  numberOfRowsInSection section: Int) -> Int {
        return numRows
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        cell.textLabel?.text = "label\(indexPath.row)"
        
        return cell
    }

    
    
    
    
   /*
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "reuseIdentifier");
        }
        // Configure the cell...
              cell?.textLabel?.text = "fdfd";
        return cell!
    }
//
 
 */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//新闻结构体
struct HanggeArticle {
    var title:String
    var createDate:Date
}




