//
//  TimeZoneViewController.swift
//  appathon.demo
//
//  Created by Suthagar.P2 on 1/23/15.
//  Copyright (c) 2015 Suthagar.P2. All rights reserved.
//

import UIKit
import Foundation

class TimeZoneViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource: Array<CountryTime> = Array<CountryTime>()
    let timeZoneViewCell: String = "timeZoneViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        let now = NSDate()
        
        var formatter = NSDateFormatter()
        formatter.timeZone = NSTimeZone(abbreviation: "CST")
        formatter.dateStyle = NSDateFormatterStyle.FullStyle
        formatter.timeStyle = NSDateFormatterStyle.MediumStyle
        var minneapolisTime = formatter.stringFromDate(now)

        var countryTime = CountryTime()
        countryTime.Country = "Minneapolis"
        countryTime.Time = minneapolisTime
        dataSource.append(countryTime)
        
        formatter.timeZone = NSTimeZone(abbreviation: "IST")
        var bangaloreTime = formatter.stringFromDate(now)
        
        countryTime = CountryTime()
        countryTime.Country = "Bangalore"
        countryTime.Time = bangaloreTime
        dataSource.append(countryTime)
        
        var formatter5 = NSDateFormatter()
        formatter5.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(timeZoneViewCell) as? UITableViewCell
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: timeZoneViewCell)
        }
        cell?.textLabel?.text = dataSource[indexPath.row].Country
        cell?.textLabel?.font = UIFont.boldSystemFontOfSize(20)
       
        cell?.detailTextLabel?.text = dataSource[indexPath.row].Time
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class CountryTime {
    var Country: String = ""
    var Time: String = ""
}
