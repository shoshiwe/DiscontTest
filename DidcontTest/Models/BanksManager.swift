//
//  BanksManager.swift
//  DidcontTest
//
//  Created by shoshi weinberg on 1/14/20.
//  Copyright © 2020 Weizmann. All rights reserved.
//

import Foundation
import SwiftyJSON

class BanksManager{
    
    private static let bankJson:String = """
[
    { "name":"JPMorgan", "stk":"JPM", "img":"https://www.interbrand.com/assets/00000001535.png","priority":"100" },
    { "name":"Bank of America", "stk":"BAC", "img":"https://www.charlotteobserver.com/latest-news/uiy86c/picture6131838/alternates/FREE_1140/E8VhA.So.138.jpg","priority":"99" },
    { "name":"Citigroup", "stk":"C", "img":"https://pentagram-production.imgix.net/wp/592ca89f19a1d/ps-citibank-01.jpg","priority":"80" },
    { "name":"Wells Fargo", "stk":"IIS", "img":"https://motorsportsnewswire.com/wp-content/uploads/2019/08/Wells-Fargo-Company-logo-678.jpg","priority":"15" },
    { "name":"Morgan Stanley", "stk":"MS", "img":"https://www.spglobal.com/_assets/images/leveragedloan/2012/07/morgan-stanley-logo.jpg","priority":"15"
    }
]
"""
    static func getBanks() -> [Bank] {
        var listOfBanks = [Bank]()
        if let data = bankJson.data(using: .utf8) {
            let json = JSON(data)
            let jsonBanks = json.arrayValue
            for oneBank in jsonBanks {
                listOfBanks.append(Bank(fromJson: oneBank))
            }
        }
        return listOfBanks
    }
    static func sortBanksList(list:[Bank]) -> [Bank]{
        return list.sorted {Int($0.priority) ?? 0 > Int($1.priority) ?? 0 }
    }
}
