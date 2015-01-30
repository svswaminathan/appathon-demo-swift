//
//  HelpdeskTableViewCell.swift
//  appathon.demo
//
//  Created by Suthagar.P2 on 1/29/15.
//  Copyright (c) 2015 Suthagar.P2. All rights reserved.
//

import UIKit

class HelpdeskTableViewCell: UITableViewCell {

    @IBOutlet weak var callNumberLabel: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class HelpDesk {
    var Name: String = ""
    var Number: Int = 0
}