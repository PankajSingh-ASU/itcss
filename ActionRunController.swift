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
    var shift: String=""
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("viewDidLoad in ActionRunController view controller")
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true
        NSLog("Campus selected is: \(shift)")
        let collector : ActionRunsSet = ActionRunsSet()
        tasks = collector.getActionRuns(shift)
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
        let cell = tableView.dequeueReusableCellWithIdentifier("task", forIndexPath: indexPath)
        NSLog("Index is ::\(indexPath.row)")
        let task: ActionRun=tasks[indexPath.row]
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.description
        return cell
}
}
