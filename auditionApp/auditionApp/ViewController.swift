//
//  ViewController.swift
//  auditionApp
//
//  Created by Neill Chua on 4/5/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet var notes: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        notes.layer.borderWidth = 1
        notes.layer.borderColor = borderColor.CGColor
  
    }
    
}

