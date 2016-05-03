//
//  AuditionStore.swift
//  auditionApp
//
//  Created by Neill Chua on 4/15/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit

class AuditionStore {
    //www.raywenderlich.com/115695/getting-started-with-core-data-tutorial
    //developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CoreData/CreatingObjects.html
    init(){
        if let archivedAuditions = NSKeyedUnarchiver.unarchiveObjectWithFile(auditionArchiveURL.path!) as? [Audition] {
            allAuditions += archivedAuditions
        }
    }
    
    
    var allAuditions = [Audition]()
    
    
    func addAudition(newAudition: Audition) {
        allAuditions.append(newAudition)
    }
    
    let auditionArchiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("auditions.archive")
    }()
    
    func saveChanges() -> Bool {
        print("Saving items to : \(auditionArchiveURL.path!)")
        return NSKeyedArchiver.archiveRootObject(allAuditions, toFile: auditionArchiveURL.path!)
    }
    
}
