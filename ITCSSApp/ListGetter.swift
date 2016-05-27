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
    
}