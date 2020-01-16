//
//  String+Extensions.swift
//  DidcontTest
//
//  Created by shoshi weinberg on 1/15/20.
//  Copyright © 2020 Weizmann. All rights reserved.
//

import Foundation
import UIKit

extension String{
    
    func dateFromString(format:String) -> Date {
         let dateFormatter = DateFormatter()
               dateFormatter.dateFormat = format
        
             return dateFormatter.date(from: self) ?? Date()
    }
    
    
   func dateConverter(incomingFormat: String, outGoingFormat: String) -> String {
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = incomingFormat
        //dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        let dt = dateFormatter.date(from: self)
        //dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = outGoingFormat
        
        return dateFormatter.string(from: dt ?? Date())
    }
}
