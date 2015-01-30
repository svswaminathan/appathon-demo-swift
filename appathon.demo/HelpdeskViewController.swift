//
//  HelpdeskViewController.swift
//  appathon.demo
//
//  Created by Suthagar.P2 on 1/23/15.
//  Copyright (c) 2015 Suthagar.P2. All rights reserved.
//

import UIKit

class HelpdeskViewController: UIViewController, UITableViewDataSource {

    let HelpdeskCellIdentifier: String = "HelpdeskCellIdentifier"
    var helpDeskNumbers: Array<HelpDesk> = Array<HelpDesk>()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        var helpDesk = HelpDesk()
        helpDesk.Name = "Call HelpDesk"
        helpDesk.Number = 0
        helpDeskNumbers.append(helpDesk)
        
        helpDesk = HelpDesk()
        helpDesk.Name = "Call RJU Reception"
        helpDesk.Number = 0
        helpDeskNumbers.append(helpDesk)
        
        helpDesk = HelpDesk()
        helpDesk.Name = "Call GWS Reception"
        helpDesk.Number = 0
        helpDeskNumbers.append(helpDesk)
        
        tableView.registerClass(HelpdeskTableViewCell.self, forCellReuseIdentifier: HelpdeskCellIdentifier)
        var nib = UINib(nibName: "HelpdeskTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: HelpdeskCellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helpDeskNumbers.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(HelpdeskCellIdentifier, forIndexPath: indexPath) as HelpdeskTableViewCell
        
        cell.callNumberLabel.text = helpDeskNumbers[indexPath.row].Name
        
        return cell
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
