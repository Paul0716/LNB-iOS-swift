//
//  File.swift
//  lnb_app
//
//  Created by Paul Ku on 2016/8/15.
//  Copyright © 2016年 Paul Ku. All rights reserved.
//

import Foundation
import Alamofire

class Loans{
    
    // MARK: -init
    init(){
        
    }
    
    // get lists data
    func getLists(index: Int,amount: Int, completed: (data: [[String:AnyObject]]) -> Void) {
        Alamofire
            .request(.GET, "https://lnb.com.tw/api/market-place?page=\(index)&per_page=\(amount)=1&sendback=1")
            .responseJSON { response in
                if let JSON = response.result.value as? Dictionary<String,AnyObject> {
                    let loanData = JSON["data"] as! [[String:AnyObject]]
                    completed(data: loanData)
                }
        }
//        return;
    }
    
    
    
}
