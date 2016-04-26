//
//  ViewController.swift
//  auditionApp
//
//  Created by Neill Chua on 4/5/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit

class AuditionViewController: UIViewController {

    //var audition: Audition!
    var auditionstore: AuditionStore!
    
    @IBOutlet var notes: UITextView!
    
    @IBOutlet var auditionName: UITextField!
   
    @IBOutlet var addAudition: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(audition.name)
        //if audition.name != "" {
          //  auditionName!.text = audition.name
        //}
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //audition.name = "Sam"
        let nameValue = auditionName.text!
        let newAudition = Audition(name: nameValue)
        auditionstore.addAudition(newAudition)
        print(auditionName.text!)
        print(auditionstore.allAuditions.count)
        //print(audition.name)
    }

    
}
    
    


