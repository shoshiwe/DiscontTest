//
//  Alphavantage.swift
//  DidcontTest
//
//  Created by shoshi weinberg on 1/14/20.
//  Copyright © 2020 Weizmann. All rights reserved.
//

import Foundation

import SwiftyJSON
struct Alphavantage {
    var timeSeries : TimeSeries!
    
    init(fromJson json: JSON! ,timeInterval:String){
        if json.isEmpty{
            return
        }
      
        let timeSeriesJson = json["Time Series (" + timeInterval + ")"]
        if !timeSeriesJson.isEmpty{
            timeSeries = TimeSeries(fromJson: timeSeriesJson)
        }
    }
}
