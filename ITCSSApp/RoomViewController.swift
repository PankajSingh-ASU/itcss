//
//  RoomViewController.swift
//  ITCSSApp
//
//  Created by Pankaj Singh on 5/26/16.
//  Copyright © 2016 Pankaj Singh. All rights reserved.
//

import UIKit

class RoomViewController : UITableViewController
{
    var campus: String = ""
    var building: String = ""
    var rooms:[Room] = [Room]()
    var reporter = ""
    var reportDetails:ReportDetails = ReportDetails()

    // MARK: - Table view data source
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("viewDidLoad in BuildingViewController view controller")
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true
        NSLog("Campus selected is: \(campus)")
        NSLog("Building selected is: \(building)")
        let collector : ListGetter = ListGetter()
        rooms = collector.getRoomList(campus,building: building)
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        NSLog("numberOfSectionsInTableView in BuildingViewController ")
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        NSLog("tableView in BuildingViewController view controller")
        return rooms.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCellWithIdentifier("roomCell", forIndexPath: indexPath)
        NSLog("Index is ::\(indexPath.row)")
        let room=rooms[indexPath.row]
        cell.textLabel?.text = room.name
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("Identifier is: \(segue.identifier)")
        if segue.identifier == "Tasks" {
            let viewController:ActionRunController = segue.destinationViewController as! ActionRunController
            
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            let selectedRoom=rooms[indexPath.row];
            NSLog("Selected index is: \(indexPath.row)")
            NSLog("Selected room is:\(selectedRoom.name)")
            // viewController.movies = self.movies
            viewController.shift  = "Afternoon"
            reportDetails.campus=self.campus
            reportDetails.building = self.building
            reportDetails.room = selectedRoom
            reportDetails.reporter = self.reporter
            viewController.reportDetails = reportDetails
        }
    }

}

