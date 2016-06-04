//
//  Buildings.swift
//  ITCSSApp
//
//  Created by Pankaj Singh on 5/26/16.
//  Copyright © 2016 Pankaj Singh. All rights reserved.
//

import Foundation
class ListGetter
{
    //var campus: String
     var list = [String]()
    init()
    {
        NSLog("init in ListGetter")
    }
   func  getBuildingList(campus : String) -> [String]
    {
        if( campus == "Polytechnic")
        {
            list = [
                    "Peralta",
                    "Santa Catalina",
                    "Santan",
                    "Tech"
            ]
        }
        if( campus == "West")
        {
            list = [
                "Sands",
                "CLCC",
                "FAB",
                "Fletcher Library"
            ]
        }
        if( campus == "Tempe")
        {
            list = [
                "Coors",
                "Computing Commons",
                "Payne Hall",
                "LL"
            ]
        }
        if( campus == "Downtown")
        {
            list = [
                "CROK",
                "UCB",
                "Post",
                "Mercado",
                "Nursing Health Institute"
            ]
        }
        return list
    }
    func getRoomList(campus : String ,building : String)-> [Room]
    {
        var list = [Room]()
        if( campus == "Polytechnic" && building == "Peralta")
        {
            var room1 : Room = Room(building: building, name: "PA150", number: "150", type: "Class")
            list.append(room1)
            room1 = Room(building: building, name: "PA210", number: "210", type: "Class")
            list.append(room1)
            room1 = Room(building: building, name: "PA213", number: "213", type: "Lab")
            list.append(room1)
            room1 = Room(building: building, name: "PA303", number: "303", type: "Class")
            list.append(room1)
           // room1 = Room(building: building, name: "Per150", number: "150", type: "Class")
            

        }
        NSLog("Number of rooms : \(list.count)")
        return list
    }
    
}