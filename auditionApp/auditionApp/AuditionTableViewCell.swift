//
//  AuditionTableViewCell.swift
//  auditionApp
//
//  Created by Neill Chua on 5/1/16.
//  Copyright © 2016 Neill Chua. All rights reserved.
//

import UIKit

class AuditionTableViewCell: UITableViewCell {
    // MARK: Properties
 
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var decisionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
