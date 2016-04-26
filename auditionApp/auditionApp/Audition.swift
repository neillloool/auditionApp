//
//  Audition.swift
//  auditionApp
//
//  Created by Neill Chua on 4/8/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import Foundation

class Audition:NSObject, NSCoding {
    //var count:Int
    var name: String!
    let itemKey: String
    
    init(name:String){
        print("Sam 3")
        self.name = name
        self.itemKey = NSUUID().UUIDString
        
        super.init()
    }
    
    convenience override init(){
        print("Sam 2")
        let blankName = ""
        self.init(name:blankName)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey:"name")
        aCoder.encodeObject(itemKey, forKey:"auditionKey")
        
    }
    
    required init(coder aDecoder: NSCoder){
        print("Sam 1")
        name = aDecoder.decodeObjectForKey("name") as! String
        itemKey = aDecoder.decodeObjectForKey("auditionKey") as! String
        super.init()
    }
    
}