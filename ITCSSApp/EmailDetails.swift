//
//  IssueReportDetails.swift
//  ITCSSApp
//
//  Created by Pankaj Singh on 6/10/16.
//  Copyright © 2016 Pankaj Singh. All rights reserved.
//

import Foundation
class EmailDetails{
    var toRecipient: String?
    var ccRecipient: String?
    var subject: String?
    var messageBody: String?
    func fillEmailDetails(report: ReportDetails)
    {
        NSLog("Inside fillEmailDetails")
        var myDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict {
            // Use your dict here
            toRecipient = dict["RecipientName"] as! String
        }
        subject = "Need Immediate assistance in \(report.building) Room# \(report.room.name)"
        NSLog("toRecipient is : \(toRecipient)")
        NSLog("Subject is :\(subject)")
        messageBody = createMessageBody(report)
    }
    func createMessageBody(report: ReportDetails) -> String
    {
        var body: String
        body = "Hi Team,\n\n Campus: \(report.campus) \n Building: \(report.building) \n Room: \(report.room.name) \n There are issues for the following action runs:"
        var i : Int=1
        for issue in report.tasksWithIssue
        {
            body += "\n \(i)."
            body += " \(issue.name) "
            body += " [\(issue.description)] "
            i += 1
        }
        body += "\n\n Regards, \n \(report.reporter)"
        NSLog("Message Body is: \(body)")
        return body
    }
    
}