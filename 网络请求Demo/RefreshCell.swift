//
//  RefreshCell.swift
//  网络请求Demo
//
//  Created by ZE KANG on 2017/8/21.
//  Copyright © 2017年 LRY. All rights reserved.
//

import UIKit



class RefreshCell: UITableViewCell {

    
    
    
    
   

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var picImg: UIImageView!
    
    //MARK:- 没有创建xib 文件初始化方法
    /*
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super . init(style: style, reuseIdentifier: reuseIdentifier)
        
//        self.contentView .addSubview(self.titleLable)
    }
    
    //懒加载label
    lazy var  titleLable:UILabel = {
        let  titleLable =  UILabel(frame:CGRect.init(x: 100, y: 0, width: 100, height: 30))
        print("----------888")
        titleLable.backgroundColor = .green
        titleLable.textAlignment = NSTextAlignment.center
        return titleLable
        
    }( )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     */
    // MARK:- 创建了 xib 的所使用的方法
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //此处写 xib 的初始化代码
      
    }

    
    //懒加载label
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.picImg.backgroundColor = UIColor.yellow;
    }
    
}
