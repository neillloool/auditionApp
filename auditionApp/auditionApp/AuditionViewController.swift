//
//  ViewController.swift
//  auditionApp
//
//  Created by Neill Chua on 4/5/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit

class AuditionViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var audition: Audition!
    var auditionstore: AuditionStore!
    var decision: String!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var cancel: UIBarButtonItem!
    @IBOutlet var notes: UITextView!
    
    @IBOutlet var auditionDecision: UISegmentedControl!
    
    @IBOutlet var auditionName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        auditionName.delegate = self
        
    // stackoverflow.com/questions/14494663/change-uisegmentedcontrol-selected-index-or-value-programatically
    // figure out the segment controls
        if let audition = audition {
            auditionName.text = audition.name
            notes.text = audition.auditionNotes
            print(audition.decision)
            if(audition.decision == "Yes") {
                auditionDecision.selectedSegmentIndex=0
            } else if(audition.decision == "Maybe") {
                auditionDecision.selectedSegmentIndex=1
            } else if(audition.decision == "No") {
                auditionDecision.selectedSegmentIndex=2
            }
    }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        navigationItem.title = textField.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func cancel(sender: UIBarButtonItem){
        dismissViewControllerAnimated(true, completion: nil)
        
        let isPresentingInAddAuditionMode = presentingViewController is UINavigationController
        
        if isPresentingInAddAuditionMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }
    
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if saveButton === sender {
            let nameValue = auditionName.text ?? ""
            let decision = auditionDecision.titleForSegmentAtIndex(auditionDecision.selectedSegmentIndex)!
            let auditionNotes = notes.text!
      
            audition = Audition(name: nameValue, decision: decision, auditionNotes: auditionNotes)

        }
        
        
    }

    }