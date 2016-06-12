//
//  ReportDetails.swift
//  ITCSSApp
//
//  Created by Pankaj Singh on 6/10/16.
//  Copyright © 2016 Pankaj Singh. All rights reserved.
//

import Foundation
class ReportDetails
{
    var reporter: String
    var campus: String
    var building: String
    var room: Room
    var tasksWithIssue:[ActionRun] = [ActionRun]()
    init()
    {
        reporter=""
        campus=""
        building=""
        room=Room()
    }
    
}