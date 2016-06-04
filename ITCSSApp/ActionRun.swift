//
//  ActionRun.swift
//  ITCSSApp
//
//  Created by Pankaj Singh on 6/4/16.
//  Copyright © 2016 Pankaj Singh. All rights reserved.
//

import Foundation
class ActionRun
{
    var name : String
    var description : String
    var checked : Bool
    var issue : Bool
    var issueDescription: String
    init()
    {
        self.name = ""
        self.description = ""
        self.checked = false
        self.issue = false
        self.issueDescription = ""
    }
    
    init(name:String, description: String)
    {
        self.name = name
        self.description = description
        self.checked = false
        self.issue = false
        self.issueDescription = ""
    }
}
