//
//  BaseRequest.swift
//  cixiang_swift
//
//  Created by sallen on 2017/10/27.
//  Copyright © 2017年 sallen. All rights reserved.
//

import Foundation
import SnapKit
import SDWebImage

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

func __setCGRECT(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
}

let urlHead = "http://sallen.cc:8800";
