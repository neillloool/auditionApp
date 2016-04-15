//
//  Audition.swift
//  auditionApp
//
//  Created by Neill Chua on 4/8/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import Foundation

class Audition:NSObject, NSCoding {
    var count:Int
    var name: String?
    let itemKey: String
    
    init(name:String){
        self.count = 0
        self.name = name
        self.itemKey = NSUUID().UUIDString
        super.init()
    }
    
    convenience override init(){
        let blankName = ""
        self.init(name:blankName)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey:"name")
        aCoder.encodeObject(itemKey, forKey:"auditionKey")
        aCoder.encodeInteger(count, forKey: "count")
        
    }
    
    required init(coder aDecoder: NSCoder){
        name = aDecoder.decodeObjectForKey("name") as! String
        itemKey = aDecoder.decodeObjectForKey("auditionKey") as! String
        count = aDecoder.decodeIntegerForKey("count")
        super.init()
    }
    
}