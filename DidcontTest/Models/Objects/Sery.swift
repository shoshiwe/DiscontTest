//
//  Sery.swift
//  DidcontTest
//
//  Created by shoshi weinberg on 1/14/20.
//  Copyright © 2020 Weizmann. All rights reserved.
//
import SwiftyJSON
import Foundation
struct  Sery {
    var close : String!
    var high : String!
    var low : String!
    var open : String!
    var volume : String!
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        close = json["4. close"].stringValue
        high = json["2. high"].stringValue
        low = json["3. low"].stringValue
        open = json["1. open"].stringValue
        volume = json["5. volume"].stringValue
    }
    
}

