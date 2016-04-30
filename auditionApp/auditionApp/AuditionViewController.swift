//
//  ViewController.swift
//  auditionApp
//
//  Created by Neill Chua on 4/5/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit

class AuditionViewController: UIViewController {

    var audition: Audition!
    var auditionstore: AuditionStore!
    var decision: String!
   
    
    
    @IBOutlet var notes: UITextView!
    
    @IBOutlet var auditionDecision: UISegmentedControl!
    
    @IBOutlet var auditionName: UITextField!
   
    @IBOutlet var addAudition: UIButton!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       // print(audition.name)
//        if audition.name != "" {
//        auditionName!.text = audition.name
//        }
//
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //audition.name = "Sam"
        let nameValue = auditionName.text!
        let decision = auditionDecision.titleForSegmentAtIndex(auditionDecision.selectedSegmentIndex)!
        let auditionNotes = notes.text!
        print(auditionDecision.titleForSegmentAtIndex(auditionDecision.selectedSegmentIndex)!)
        let newAudition = Audition(name: nameValue, decision: decision, auditionNotes: auditionNotes)
        auditionstore.addAudition(newAudition)
//        print(decision)
//        print(notes)
//        print(auditionstore.allAuditions.count)
//        print(audition.name)
    }

    
}
    
    


