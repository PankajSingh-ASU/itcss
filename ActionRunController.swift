//
//  ActionRun.swift
//  ITCSSApp
//
//  Created by Pankaj Singh on 6/4/16.
//  Copyright © 2016 Pankaj Singh. All rights reserved.
//

import Foundation
import UIKit

class ActionRunController: UITableViewController {
    var tasks:[ActionRun] = [ActionRun]()
    var tasksWithIssue :Set<Int> = Set<Int>()
    var shift: String=""
    let checkedColor = UIColor.greenColor()
    let issueColor = UIColor.redColor()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("viewDidLoad in ActionRunController view controller")
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true
        NSLog("Campus selected is: \(shift)")
        let collector : ActionRunsSet = ActionRunsSet()
        tasks = collector.getActionRuns(shift)
    }
    @IBAction func reporting(sender: UIBarButtonItem) {
       if tasksWithIssue.isEmpty
       {
        //Reporting without issue
        }
        else
       {
        //reporting with issue
        NSLog("Issue found for \(tasksWithIssue)")
        //mailing functionality
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        NSLog("numberOfSectionsInTableView in ActionRunController ")
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        NSLog("tableView in ActionRunController view controller")
        return tasks.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCellWithIdentifier("task", forIndexPath: indexPath)as! ActionRunViewCell
        NSLog("Index is ::\(indexPath.row)")
        let task: ActionRun=tasks[indexPath.row]
        cell.title.text = task.name
        cell.subTitle.text = task.description
        cell.issueButton.tag = indexPath.row
        cell.issueButton.addTarget(self, action: "issueFound:", forControlEvents: UIControlEvents.TouchUpInside)

        return cell
}
    func issueFound(sender:UIButton)
    {
        NSLog("\(sender.tag)")
        let task: ActionRun=tasks[sender.tag]
        NSLog("\(task.name)")
        task.issue = true
        tasksWithIssue.insert(sender.tag)
        //task.checked = true // not required
        
        //color coding in UI 
        let rowToSelect:NSIndexPath = NSIndexPath(forRow: sender.tag, inSection: 0);  //slecting 0th row with 0th section
        self.tableView.selectRowAtIndexPath(rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.None);
        
        self.tableView(self.tableView, didSelectRowAtIndexPath: rowToSelect);
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let task: ActionRun=tasks[indexPath.row]
        task.checked = true
        let selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        //selectedCell.backgroundColor = UIColor.greenColor()
        if task.issue
        {
           selectedCell.contentView.backgroundColor = self.issueColor
        }
        else
        {
        selectedCell.contentView.backgroundColor = checkedColor
        }
    }
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let task: ActionRun=tasks[indexPath.row]
        if task.issue
        {
            NSLog("\(tasksWithIssue)")
            task.issue = false
            tasksWithIssue.remove(indexPath.row)
        }
        task.checked = false
        
        task.issueDescription = ""
    }
}
