//
//  ViewController.swift
//  SwiftDemo
//
//  Created by sallen on 2017/11/17.
//  Copyright © 2017年 sallen. All rights reserved.
//

import UIKit
private let sectionFirstData:Array<NSString> = ["Button","Label","ImageView","TextField"]
private let sectionSecondData:Array<NSString> = ["Tableview","CollectionView","仿微信弹框"]
private let sectionThirdData:Array<NSString> = ["网络请求"]
private let sectionFourthData:Array<NSString> = ["等待更新"]
//private let dataArray:[[[[String]]]] = [[[["Button","Label","ImageView","TextField"],["Tableview","轮播","DatePicker"],["网络请求"],["RxSwift"]]]]
private let adHeaders:Array<NSString> = ["常见UIKIT控件","高级UIKIT控件","Network数据交互","RXSwift"]
class ViewController: UIViewController {

    lazy var tableView:UITableView = {
        let table:UITableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: self.view.bounds.height), style: .grouped)
        table.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         title = "Swift示例合集 长期更新";
         view.addSubview(tableView);

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sectionFirstData.count
        }else if section == 1 {
            return sectionSecondData.count
        }else if section == 2{
            
            return sectionThirdData.count
        }else{
            
            return sectionFourthData.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        var str = "";
        if indexPath.section == 0 {
            
            str = sectionFirstData[indexPath.row] as String;
        }else if indexPath.section == 1{
            str = sectionSecondData[indexPath.row] as String;
        }else if indexPath.section == 2{
            
            str = sectionThirdData[indexPath.row] as String;
        }else{
            str = sectionFourthData[indexPath.row] as String;
            
        }
        
        cell.textLabel?.text = str
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return adHeaders.count
    }
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let titleLabel = UILabel()
        titleLabel.text = adHeaders[section] as String
        titleLabel.textColor = UIColor.black
        titleLabel.sizeToFit()
        titleLabel.font = UIFont.italicSystemFont(ofSize: 15);
        titleLabel.center = CGPoint(x: 100, y: 15)
        headerView.addSubview(titleLabel)
        return headerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {

        if indexPath.section == 0 {
            
            let vc = BaseUIKitViewController()
            vc.showIndex = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
            
        }else if indexPath.section == 1{
            if indexPath.row == 2{
            


                
            }else{
                
                let vc = HeightUIKitViewController()
                vc.selectIndex = indexPath.row
                navigationController?.pushViewController(vc, animated: true)
            }

            
        }else if indexPath.section == 2{
            
            let vc = NetworkViewController()
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
}

