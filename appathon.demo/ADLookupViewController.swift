//
//  ADLookupViewController.swift
//  appathon.demo
//
//  Created by Suthagar.P2 on 1/23/15.
//  Copyright (c) 2015 Suthagar.P2. All rights reserved.
//

import UIKit

class ADLookupViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var searchText: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    var serviceAPI = "http://TBTTSMPE2D.hq.target.com/ADSearcherApi/api/ADSearch/getusers?groupName="
    
    var dataSource: Array<UserInfo> = Array<UserInfo>()
    let helpDeskViewCellIdentifier: String = "helpDeskViewCellIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //tableView.registerClass(self, forCellReuseIdentifier: helpDeskViewCellIdentifier)
        
        // Do any additional setup after loading the view.
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
       
    }

    @IBAction func buttonClicked(sender: UIButton) {
        var data = parseJSON(getJSON(serviceAPI + searchText.text))
        dataSource.removeAll(keepCapacity: false)
        for each in data
        {
            var userInfo = UserInfo()
            userInfo.DisplayName = each["DisplayName"] as? String
            userInfo.EmailAddress = each["EmailAddress"] as? String
            userInfo.EmployeeId = each["EmployeeId"] as? String
            userInfo.GivenName = each["GivenName"] as? String
            userInfo.Surname = each["Surname"] as? String
            userInfo.VoiceTelephoneNumber = each["VoiceTelephoneNumber"] as? String
            
            dataSource.append((userInfo))
        }
        
        tableView.reloadData()
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(helpDeskViewCellIdentifier) as? UITableViewCell
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: helpDeskViewCellIdentifier)
        }
        
        cell?.textLabel?.text = dataSource[indexPath.row].DisplayName!
        
        return cell!
    }
    
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    
    func parseJSON(inputData: NSData) -> NSArray{
        var error: NSError?
        var boardsDictionary: NSArray = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSArray
        
        return boardsDictionary
    }

}

class UserInfo {
    var DisplayName: String? = ""
    var GivenName: String? = ""
    var Surname: String? = ""
    var EmailAddress: String? = ""
    var VoiceTelephoneNumber: String? = ""
    var EmployeeId: String? = ""
}