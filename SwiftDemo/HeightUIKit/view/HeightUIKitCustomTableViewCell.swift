//
//  HeightUIKitCustomTableViewCell.swift
//  SwiftDemo
//
//  Created by sallen on 2017/11/17.
//  Copyright © 2017年 sallen. All rights reserved.
//

import UIKit

class HeightUIKitCustomTableViewCell: UITableViewCell {

    
     var headImage = UIImageView()
     var addressLabel = UILabel()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() {
        
        addSubview(headImage)
        headImage.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        addSubview(addressLabel)
        
        addressLabel.font = UIFont.systemFont(ofSize: 15)
        addressLabel.text = "我在这里"
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headImage.snp.bottom)
            make.left.equalTo(10)
            make.height.equalTo(30)
            make.width.equalTo(100)
            
        }
        
        
        
    }
    

}
