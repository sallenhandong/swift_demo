//
//  BaseUIKitViewController.swift
//  SwiftDemo
//
//  Created by sallen on 2017/11/17.
//  Copyright © 2017年 sallen. All rights reserved.
//

import UIKit

class BaseUIKitViewController: UIViewController {
public var showIndex = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "常见控件";
       
        switch showIndex {
        case 0:
            addButton()
            break;
        case 1:
            addLabel()
            break;
        case 2:
            addImageView()
            break;
        case 3:
            addTextField()
            break;
        default:
            break;
        }
        
        
    }
    func addButton(){
        
        let button = UIButton(frame:CGRect(x:100, y:150, width:100, height:30))
        button.setTitle("普通状态", for:.normal) //普通状态下的文字
        button.setTitleShadowColor(UIColor.green, for:.normal) //普通状态下文字阴影的颜色
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action:#selector(tapped), for:.touchUpInside)
        view.addSubview(button)
       
    }
    @objc func tapped(){
        print("tapped")
    }
    func addLabel(){
        
        
        let contentLabel = UILabel(frame:CGRect(x:100,y:100,width:kScreenWidth - 40,height:200));
        let longString = """
         深爱的你
            未曾改变
        """
        contentLabel.text = longString;
        contentLabel.numberOfLines = 0;
        view.addSubview(contentLabel);
        
    }
    func addImageView(){
        
        let headimgView = UIImageView(image: UIImage(named: "weimei.jpg"))
        headimgView.frame = CGRect(x: 0, y: 64, width: kScreenWidth, height: 200);
        view.addSubview(headimgView);
        
    }
    func addTextField(){
        let textField = UITextField(frame: CGRect(x:100, y:100, width:200, height:30))
        //设置边框样式为圆角矩形
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.placeholder = "请输入用户名"
        textField.clearButtonMode = .whileEditing  //编辑时出现清除按钮
        textField.keyboardType = UIKeyboardType.numberPad
        view.addSubview(textField)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
