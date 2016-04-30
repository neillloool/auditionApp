//
//  Audition.swift
//  auditionApp
//
//  Created by Neill Chua on 4/8/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import Foundation

class Audition:NSObject{
    //var count:Int
    var name: String!
    var decision: String!
    var auditionNotes:String!
    
    init(name:String, decision: String, auditionNotes: String){
        print("Sam 3")
        print(decision)
        self.name = name
        self.decision = decision
        self.auditionNotes = auditionNotes
            
        super.init()
    }
    
    convenience override init(){
        let blankName = ""
        self.init(name:blankName, decision: "Yes", auditionNotes: "Notes")
    }


//    func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encodeObject(name, forKey:"name")
//        aCoder.encodeObject(itemKey, forKey:"auditionKey")
//        
//    }
//    
//    required init(coder aDecoder: NSCoder){
//        print("Sam 1")
//        name = aDecoder.decodeObjectForKey("name") as! String
//        itemKey = aDecoder.decodeObjectForKey("auditionKey") as! String
//        super.init()
//    }
    
}