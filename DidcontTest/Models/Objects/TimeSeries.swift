//
//  TimeSeries .swift
//  DidcontTest
//
//  Created by shoshi weinberg on 1/14/20.
//  Copyright © 2020 Weizmann. All rights reserved.
//
import SwiftyJSON
import Foundation
struct TimeSeries {
    var series:[String:Sery]!
     
     init(fromJson json: JSON!){
     if json.isEmpty{
         return
     }
        series = [String:Sery]()
        if let dictonary_json = json.dictionary{
            let keys = dictonary_json.keys
            for key in keys{
                let oneJson = dictonary_json[key]
                series.updateValue(Sery.init(fromJson:oneJson!), forKey: key)
                 
            }
        }
    
     }
}
