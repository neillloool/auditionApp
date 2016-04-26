//
//  AuditionListViewController.swift
//  auditionApp
//
//  Created by Neill Chua on 4/15/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit



class AuditionListViewController: UITableViewController {
    
    var audition: Audition!
    var auditionStore: AuditionStore!
    
    
    /// have to add this before we connect to allow addAudition
    @IBAction func addAudition(sender: AnyObject) {
        let newAudition = Audition(name: "New Audition",decision: "Yes")
        auditionStore.addAudition(newAudition)
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem()
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        let item = auditionStore.allAuditions[indexPath.row]
        print(item.decision)
        print(cell.textLabel?.text)
        print(cell.detailTextLabel?.text)
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.decision)"
        print(cell.textLabel?.text)
        print(cell.detailTextLabel?.text)
        return cell
    }

   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return auditionStore.allAuditions.count
    }
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowAudition" {
                print(auditionStore.allAuditions.count)
                let auditionViewController = segue.destinationViewController as! AuditionViewController
                auditionViewController.audition = audition
                auditionViewController.auditionstore = auditionStore
            }

//        if segue.identifier == "ShowDetailAudition" {
//            if let row = tableView.indexPathForSelectedRow?.row {
//                let audition = auditionStore.allAuditions[row]
//                let auditionViewController = segue.destinationViewController as! AuditionViewController
//               auditionViewController.audition = audition
//           }
//        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    /*override func tableView(tableView:UITableView,commitEditingStyle editingStyle:UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete {
            let audition = AuditionStore.addAudition[indexPath.row]
            AuditionStore.removeItem(audition)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: <#T##UITableViewRowAnimation#>)
        }
    }*/
  
    
}