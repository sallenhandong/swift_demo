//
//  NetworkViewController.swift
//  SwiftDemo
//
//  Created by 哲仁科技李海强 on 2017/11/17.
//  Copyright © 2017年 sallen. All rights reserved.
//

import UIKit
class NetworkViewController: UIViewController {
    
    var dataArray:Array<Any> = [];
    
    
    //懒加载
    lazy var mainTabView:UITableView = {
        
        let mainTabView = UITableView.init(frame: __setCGRECT(x: 0, y:100, width: kScreenWidth, height: kScreenHeight), style: UITableViewStyle.grouped)
        mainTabView.delegate = self
        mainTabView.dataSource = self
        mainTabView.backgroundColor = UIColor.white
        mainTabView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        return mainTabView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainTabView)
        let urlStr = "/homeList"
        let dict = ["name" : "sallen"]
        BaseRequest.requestData(type: .post, baseUrl: urlHead, urlString: urlStr, parameters: dict, succeed: { (result, err) in
            
            let array:NSArray = result as! NSArray;
            
            print(result as Any)
            for i in 0..<array.count{
                let model = TestModel();
                var dict:Dictionary<String,String> = array[i] as! Dictionary;
                model.author = dict["author"]!;
                model.content = dict["content"]!;
                model.imageUrl = dict["imageUrl"]!;
                self.dataArray.append(model);
            }
            self.mainTabView.reloadData()
        }) { (err) in
            
            
            
        }
        
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


extension NetworkViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
   
        
        let cell:HeightUIKitCustomTableViewCell = HeightUIKitCustomTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "CellID")
        let model = self.dataArray[indexPath.row] as! TestModel
        
        let url = NSURL.init(string: (model.imageUrl))
        cell.headImage.sd_setImage(with: url! as URL)
        cell.addressLabel.text? = model.content
        return cell
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
}


