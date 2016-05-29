//
//  Room.swift
//  ITCSSApp
//
//  Created by Pankaj Singh on 5/26/16.
//  Copyright © 2016 Pankaj Singh. All rights reserved.
//

import Foundation

class Room
{
    var name: String
    var building: String
    var number: String
    var type: String
    init()
    {
        name = ""
        number = ""
        type = ""
        building = ""
    }
    init( building: String, name: String, number: String, type: String )
    {
        self.name = name
        self.number = number
        self.type = type
        self.building = building
    }
    init (dict: [String:AnyObject]){
        
        
        self.name = (dict["name"] as? String)!
        self.number = (dict["number"] as? String)!
        self.type = (dict["type"] as? String)!
        self.building = (dict["building"] as? String)!
    }

    func toJsonString() -> String {
        var jsonStr = ""
        let dict:[String : AnyObject] = ["Title": name, "Number": number , "type":type, "building":building]
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.PrettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            jsonStr = NSString(data: jsonData, encoding: NSUTF8StringEncoding)! as String
        } catch let error as NSError {
            print(error)
        }catch  {
            print("Error in converting objects to jsonString")
        }
        return jsonStr
    }
    
}
