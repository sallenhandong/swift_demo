//
//  NetworkViewController.swift
//  SwiftDemo
//
//  Created by 哲仁科技李海强 on 2017/11/17.
//  Copyright © 2017年 sallen. All rights reserved.
//

import UIKit

class NetworkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlStr = "/homeList"
        let dict = ["name" : "sallen"]
        BaseRequest.requestData(type: .post, baseUrl: urlHead, urlString: urlStr, parameters: dict, succeed: { (result, err) in
            
            print(result as Any)
            
            
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
