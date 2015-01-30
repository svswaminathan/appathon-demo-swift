//
//  WeatherTableCellTableViewCell.swift
//  appathon.demo
//
//  Created by Suthagar.P2 on 1/24/15.
//  Copyright (c) 2015 Suthagar.P2. All rights reserved.
//

import UIKit

class WeatherTableCellTableViewCell: UITableViewCell {
    
    var CityName: String = "" {
            didSet {
                if(CityName != oldValue) {
                    cityNameLabel.text = CityName
                }
            }
    }
    
    var Temperature: String = "" {
        didSet {
            if(Temperature != oldValue) {
                tempLabel.text = Temperature
            }
        }
    }
    
    var TemperatureDesc: String = "" {
        didSet {
            if(TemperatureDesc != oldValue) {
                tempDescLabel.text = TemperatureDesc
            }
        }
    }
    
    var MaxTempearture: String = "" {
        didSet {
            if(MaxTempearture != oldValue) {
                maxTempLabel.text = MaxTempearture
            }
        }
    }
    
    var MinTemperature: String = "" {
        didSet {
            if(MinTemperature != oldValue) {
                minTempLabel.text = MinTemperature
            }
        }
    }
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempDescLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cityNameLabel.font = UIFont.boldSystemFontOfSize(20)
        tempLabel.font = UIFont.boldSystemFontOfSize(20)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
