//
//  HeightUIKitViewController.swift
//  SwiftDemo
//
//  Created by sallen on 2017/11/17.
//  Copyright © 2017年 sallen. All rights reserved.
//

import UIKit
private let Identifier = "HeightUIKitCustomTableViewCell"
private let kCellID = "CollectionCellID"
class HeightUIKitViewController: UIViewController {
public var selectIndex = 0;

    //懒加载
    lazy var mainTabView:UITableView = {
        
        let mainTabView = UITableView.init(frame: __setCGRECT(x: 0, y:100, width: kScreenWidth, height: kScreenHeight), style: UITableViewStyle.grouped)
        mainTabView.delegate = self
        mainTabView.dataSource = self
        mainTabView.backgroundColor = UIColor.white
        mainTabView .register(UINib.init(nibName:"HeightUIKitTableViewCell", bundle: nil), forCellReuseIdentifier: "HeightUIKitTableViewCell")
        mainTabView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        return mainTabView
    }()

    fileprivate lazy var collectionView: UICollectionView = { [unowned self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 120)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(UINib(nibName: "HeightUIKitCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kCellID)
        return collectionView
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch selectIndex {
        case 0:
            addTableView();
            break;
        case 1:
            addCollectionView();
            break;
        default:
            break;
        }
    }
    
    func  addTableView(){
        //分段选项显示
        let items = ["加载xibView","加载自定义view"] as [Any]
        let segmentedControl = UISegmentedControl(items:items)
        segmentedControl.frame = __setCGRECT(x: kScreenWidth/2 - 100, y: 64, width: 200, height: 30)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: UIControlEvents.valueChanged)

        view.addSubview(segmentedControl)
        view.addSubview(mainTabView)
        
    }
    func addCollectionView(){
        
        view.addSubview(collectionView)
    }
    
    //选择点击后的事件
    @objc func segmentedControlChanged(sender:UISegmentedControl) {
        
        selectIndex = sender.selectedSegmentIndex
        mainTabView.reloadData()
     
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
extension HeightUIKitViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if selectIndex == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeightUIKitTableViewCell")
            return cell!
        }else{
            
            let cell:HeightUIKitCustomTableViewCell = HeightUIKitCustomTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: Identifier)
            
            let url = NSURL.init(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1510900808215&di=9966e34ead6f4c01fc9de7fe567384cb&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201507%2F05%2F20150705181541_eyNmG.thumb.224_0.png")
            cell.headImage.sd_setImage(with: url! as URL)
            
            return cell
        }
    
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
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

extension HeightUIKitViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellID, for: indexPath) as! HeightUIKitCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
}




