//
//  ViewController.swift
//  auditionApp
//
//  Created by Neill Chua on 4/5/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit

class AuditionViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var audition: Audition?
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
    
        if let audition = audition {
            
            auditionName.text = audition.name
            notes.text = audition.name
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func cancel(sender: UIBarButtonItem){
        dismissViewControllerAnimated(true, completion: nil)
        
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
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

//
//    override func viewWillDisappear(animated: Bool) {
//        super.viewWillDisappear(animated)
//        //audition.name = "Sam"
//        let nameValue = auditionName.text!
//        let decision = auditionDecision.titleForSegmentAtIndex(auditionDecision.selectedSegmentIndex)!
//        let auditionNotes = notes.text!
//        print(auditionDecision.titleForSegmentAtIndex(auditionDecision.selectedSegmentIndex)!)
//        let newAudition = Audition(name: nameValue, decision: decision, auditionNotes: auditionNotes)
//        auditionstore.addAudition(newAudition)
//        print(decision)
//        print(notes)
//        print(auditionstore.allAuditions.count)
//        print(audition.name)
    }
    


    
    


