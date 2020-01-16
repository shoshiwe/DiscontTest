//
//  AlphavantageManager.swift
//  DidcontTest
//
//  Created by shoshi weinberg on 1/14/20.
//  Copyright © 2020 Weizmann. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class AlphavantageManager{
    
    static func getAlphavantageData(function:String,symbol:String,interval:String, completion: @escaping(_ response: Result<Any> ) -> Void) {
        let url = "https://www.alphavantage.co/query?function=" + function + "&symbol="+symbol+"&interval="+interval+"&apikey=Z8EW6CI3PHR9SUTK"
//"https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=BAC&interval=1min&apikey=Z8EW6CI3PHR9SUTK"
        Alamofire.request(url, method: .get, parameters: nil,  headers: nil).responseJSON { response in
            if (response.result.isSuccess) {
                let json = JSON(response.result.value as Any)
                let responseAlphavantage = Alphavantage(fromJson: json,timeInterval: interval)
                completion(Result.success(responseAlphavantage))
            }
            else{
                completion(Result.failure(response.result.error!))
            }

        }
    }
    static func sortTimeKeys(list:[String]) -> [String]{
        return list.sorted { $0.dateFromString(format: "yyyy-MM-dd HH:mm:ss") > $1.dateFromString(format: "yyyy-MM-dd HH:mm:ss") }
            
        
    }
       
}
