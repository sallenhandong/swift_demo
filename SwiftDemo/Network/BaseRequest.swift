//
//  BaseRequest.swift
//  cixiang_swift
//
//  Created by sallen on 2017/10/27.
//  Copyright © 2017年 sallen. All rights reserved.
//

import UIKit
import Alamofire

//请求枚举
enum MethodType: String {
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

class BaseRequest: NSObject {

    var requestTime :TimeInterval?
    static let share = BaseRequest()
    
    static let defManager: SessionManager = {
        var defHeaders = Alamofire.SessionManager.default.session.configuration.httpAdditionalHeaders ?? [:]
        let defConf = URLSessionConfiguration.default
        defConf.timeoutIntervalForRequest = 10
        defConf.httpAdditionalHeaders = defHeaders
        return Alamofire.SessionManager(configuration: defConf)
        
    }()

}
// MARK: - 通用请求方法
extension BaseRequest {
    /// 通用请求方法
    /**
     - parameter type: 请求方式
     - parameter urlString: 请求网址
     - parameter parameters: 请求参数
     
     - parameter succeed: 请求成功回调
     - parameter failure: 请求失败回调
     - parameter error: 错误信息
     */
    /// 备注：通用请求方法,增加失败回调，参考系统闭包
    static func requestData(type: MethodType,baseUrl: String,urlString: String, parameters: [String : Any]? = nil ,succeed:@escaping ((_ result : Any?, _ error: Error?) -> Swift.Void), failure: @escaping ((_ error: Error?)  -> Swift.Void)) {
        
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        //自定义
        let headers: HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=="
        ]
        let apiUrl = baseUrl + urlString;
        // 2.发送网络数据请求
        BaseRequest.defManager.request(apiUrl, method: method, parameters: parameters, headers: headers).responseJSON { (response) in
            
            // 请求失败
            if response.result.isFailure {
                print(response.result.error)
                failure(response.result.error)
                return
            }
            
            // 请求成功
            if response.result.isSuccess {
                // 3.获取结果
                guard let result = response.result.value else {
                    succeed(nil, response.result.error)
                    return
                }
                
                
              guard let resultDict = result as? [String : Any] else { return }
                let message = resultDict["IsSuccess"] as! NSNumber;

                if (message == 0){
                    
                  //失败 弹出 框
                
                }else{
                    // 4.将结果回调出去
                    succeed(resultDict["Data"], nil)
                    
                }

              
            }
        }
    }
}
