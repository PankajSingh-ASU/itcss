//
//  BuildingViewController.swift
//  ITCSSApp
//
//  Created by Pankaj Singh on 5/26/16.
//  Copyright © 2016 Pankaj Singh. All rights reserved.
//

import UIKit

class BuildingViewController : UITableViewController
{
    var campus: String = ""
     var names:[String] = [String]()
    // MARK: - Table view data source
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("viewDidLoad in BuildingViewController view controller")
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true
        NSLog("Campus selected is: \(campus)")
        let collector : ListGetter = ListGetter()
        names = collector.getBuildingList(campus)
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        NSLog("numberOfSectionsInTableView in BuildingViewController ")
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        NSLog("tableView in BuildingViewController view controller")
        return names.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCellWithIdentifier("buildingCell", forIndexPath: indexPath)
        NSLog("Index is ::\(indexPath.row)")
        let movieName=names[indexPath.row]
        cell.textLabel?.text = movieName
        return cell
    }
}
