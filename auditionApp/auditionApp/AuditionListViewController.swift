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
    var auditionDecision: UISegmentedControl!
    var auditions = [Audition]()
    
    /// have to add this before we connect to allow addAudition
    @IBAction func addAudition(sender: AnyObject) {
        let newAudition = Audition(name: "Audition",decision: "Maybe", auditionNotes: "Notes")
        auditionStore.addAudition(newAudition)
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem()
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    
        return true
    }
    
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            auditions.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
        }
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        let item = auditions[indexPath.row]
     
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.decision)"
        
        //adding color to the row according to the decision
        if item.decision == "Yes" {
            cell.backgroundColor = UIColor.greenColor()}
        else if item.decision == "Maybe" {
            cell.backgroundColor = UIColor.yellowColor()}
        else if item.decision == "No" {
            cell.backgroundColor = UIColor.redColor()}
        
        
       
        return cell
    }

   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return auditions.count
    }
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowAudition" {
                let auditionViewController = segue.destinationViewController as! AuditionViewController
            
            if let selectedAuditionCell = sender as? AuditionTableViewCell{
                let indexPath = tableView.indexPathForCell(selectedAuditionCell)!
                let selectedAudition = auditions[indexPath.row]
                auditionViewController.audition = selectedAudition
            }
           
            
        }

            else if segue.identifier == "AddItem" {
                print("Adding new audition.")
            }
        
        
}


    @IBAction func unwindToAuditionList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? AuditionViewController, audition = sourceViewController.audition {
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                
                // Update an existing audition.
                
                auditions[selectedIndexPath.row] = audition
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)

            }
             
            else {
                
                // Add a new audition.
                
                let newIndexPath = NSIndexPath(forRow: auditions.count, inSection: 0)
                auditions.append(audition)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
                
                }
    
            }
        }
    
    
  
}

