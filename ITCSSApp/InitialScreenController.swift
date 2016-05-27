//
//  InitialScreenController.swift
//  ITCSSApp
//
//  Created by Pankaj Singh on 5/23/16.
//  Copyright © 2016 Pankaj Singh. All rights reserved.
//

import Foundation
import UIKit

class InitialScreenController: UICollectionViewController {

    let reuseIdentifier = "campus"
    var  cellDimension : CGSize?
    var campuses = [String]()
    var campuseImages = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Do any additional setup after loading the view.
        campuses = ["Downtown",
                    "Polytechnic",
                    "Tempe",
                     "West"
                     ]
        campuseImages = ["Downtown.jpg",
                    "Poly.jpg",
                    "Tempe.jpg",
                    "West.jpg"
        ]
    }
    override func numberOfSectionsInCollectionView(collectionView:
        UICollectionView!) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView!,
                                 numberOfItemsInSection section: Int) -> Int {
        return campuses.count
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier,
        forIndexPath: indexPath) as! InitialViewCell
        
        // Configure the cell
        let image = UIImage(named: campuseImages[indexPath.row])
        cell.imageView.image = image
        //cell.imageView.frame = CGRectMake(0,0,cellDimension!.height,cellDimension!.width)
        cell.name.text = campuses[indexPath.row]
        
        return cell
    }
    override func collectionView(collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                                                   atIndexPath indexPath: NSIndexPath)
        -> UICollectionReusableView {
            
            var header: InitialSupplimentaryView?
            
            if kind == UICollectionElementKindSectionHeader {
                header =
                    collectionView.dequeueReusableSupplementaryViewOfKind(kind,
                                                                          withReuseIdentifier: "initialHeader", forIndexPath: indexPath)
                    as? InitialSupplimentaryView
                
                header?.headerLabel.text = " Select Campus "
            }
            return header!
    }
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let picDimension = self.view.frame.size.width / 2
        //let picDimensionLength = self.view.frame.size.height / 3
        cellDimension = CGSizeMake(picDimension-10, picDimension)
        return cellDimension!
        //return CGSizeMake(picDimension-1, picDimension-1)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("Inside prepareForSegue")
        NSLog("Identifier is: \(segue.identifier)")
        if segue.identifier == "campusBuildings" {
           let viewController:BuildingViewController = segue.destinationViewController as! BuildingViewController

            if let indexPath = self.collectionView?.indexPathForCell(sender as! UICollectionViewCell) {
                
            let selectedCampus = campuses[(indexPath.row)]
            NSLog("selectedCampus \(selectedCampus)")
            viewController.campus = selectedCampus
        }

    }
}
    
}