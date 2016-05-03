//
//  Audition.swift
//  auditionApp
//
//  Created by Neill Chua on 4/8/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import Foundation

class Audition:NSObject{
    var name: String!
    var decision: String!
    var auditionNotes:String!
    let itemKey: String!
    
    //stackoverflow.com/questions/21722841/nsuuid-to-nsstring
    init(name:String, decision: String, auditionNotes: String){
        print(decision)
        self.name = name
        self.decision = decision
        self.auditionNotes = auditionNotes
        self.itemKey = NSUUID().UUIDString
            
        super.init()
    }
    
    convenience override init(){
        let blankName = ""
        self.init(name:blankName, decision: "Yes", auditionNotes: "Notes")
    }


    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey:"name")
        aCoder.encodeObject(decision, forKey:"decision")
        aCoder.encodeObject(itemKey, forKey:"itemKey")
        
    }
    
    //www.raywenderlich.com/115695/getting-started-with-core-data-tutorial
    required init(coder aDecoder: NSCoder){
        print("Sam 1")
        name = aDecoder.decodeObjectForKey("name") as! String
        decision = aDecoder.decodeObjectForKey("decision") as! String
        itemKey = aDecoder.decodeObjectForKey("auditionKey") as! String
        super.init()
    }
    
}