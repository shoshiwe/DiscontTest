//
//	Bank.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class Bank : NSObject, NSCoding{

	var img : String!
	var name : String!
	var priority : String!
	var stk : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		img = json["img"].stringValue
		name = json["name"].stringValue
		priority = json["priority"].stringValue
		stk = json["stk"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if img != nil{
			dictionary["img"] = img
		}
		if name != nil{
			dictionary["name"] = name
		}
		if priority != nil{
			dictionary["priority"] = priority
		}
		if stk != nil{
			dictionary["stk"] = stk
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         img = aDecoder.decodeObject(forKey: "img") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         priority = aDecoder.decodeObject(forKey: "priority") as? String
         stk = aDecoder.decodeObject(forKey: "stk") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if img != nil{
			aCoder.encode(img, forKey: "img")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if priority != nil{
			aCoder.encode(priority, forKey: "priority")
		}
		if stk != nil{
			aCoder.encode(stk, forKey: "stk")
		}

	}

}
