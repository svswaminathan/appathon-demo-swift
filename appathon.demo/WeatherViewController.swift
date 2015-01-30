//
//  WeatherViewController.swift
//  appathon.demo
//
//  Created by Suthagar.P2 on 1/23/15.
//  Copyright (c) 2015 Suthagar.P2. All rights reserved.
//

import UIKit
import Foundation

class WeatherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    private var dataSource: Array<WeatherInfo> = Array<WeatherInfo>()
    
    let cellTableIdentifier = "CellTableIdentifier" //"SimpleTableIdentifier"
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return dataSource.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath) as? WeatherTableCellTableViewCell
            let currentRow = dataSource[indexPath.row]
            cell?.CityName = "  " + currentRow.Name
            cell?.Temperature = String.convertFromStringInterpolationSegment(currentRow.Main_Temp) + " ºC"
            cell?.MinTemperature = "Min  " + String.convertFromStringInterpolationSegment(currentRow.Main_TempMin)
            cell?.MaxTempearture = "Max  " + String.convertFromStringInterpolationSegment(currentRow.Main_TempMax)
            cell?.weatherImage.image = UIImage(named: currentRow.Weather_Icon)
            cell?.TemperatureDesc = currentRow.Weather_Description
            //cell?.WeatherImage = UIImage(named: currentRow.Weather_Icon)!
            return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.registerClass(WeatherTableCellTableViewCell.self, forCellReuseIdentifier: cellTableIdentifier)
        let nib = UINib(nibName: "WeatherTableCellView", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: cellTableIdentifier)
        
        getWeatherObject()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getWeatherObject() {
        var jsonStringAsArray = "{\"cnt\":2,\"list\":[{\"coord\":{\"lon\":77.6,\"lat\":12.98},\"sys\":{\"message\":0.0228,\"country\":\"IN\",\"sunrise\":1421975777,\"sunset\":1422017193},\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"main\":{\"temp\":26.21,\"temp_min\":26.211,\"temp_max\":26.211,\"pressure\":940.74,\"sea_level\":1024.01,\"grnd_level\":940.74,\"humidity\":48},\"wind\":{\"speed\":4.23,\"deg\":109.003},\"clouds\":{\"all\":76},\"dt\":1422010026,\"id\":1277333,\"name\":\"Bangalore\"},{\"coord\":{\"lon\":-93.26,\"lat\":44.98},\"sys\":{\"message\":0.0346,\"country\":\"US\",\"sunrise\":1422020482,\"sunset\":1422054519},\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04n\"}],\"main\":{\"temp\":-1.09,\"temp_min\":-1.089,\"temp_max\":-1.089,\"pressure\":991.4,\"sea_level\":1031.23,\"grnd_level\":991.4,\"humidity\":81},\"wind\":{\"speed\":6.38,\"deg\":225.003},\"clouds\":{\"all\":80},\"dt\":1422010548,\"id\":5037649,\"name\":\"Minneapolis\"}]}"
        
        var data = parseJSON(getJSON("http://api.openweathermap.org/data/2.5/group?id=1277333,5037649&units=metric"))
       
        var list = (data["list"] as NSArray)
        
        for li in list {
        
            var weatherInfo = WeatherInfo()
            
            weatherInfo.Id = (li["id"] as Int)
            weatherInfo.Dt = (li["dt"] as Int)
            weatherInfo.Name = (li["name"] as String)
            
            var coord = (li["coord"] as NSDictionary)
            weatherInfo.Coord_Lon = coord["lon"] as Float
            weatherInfo.Coord_Lat = coord["lat"] as Float
            
            var sys = (li["sys"] as NSDictionary)
            weatherInfo.Sys_Country = sys["country"] as String
            weatherInfo.Sys_Message = sys["message"] as Double
            weatherInfo.Sys_Sunrise = sys["sunrise"] as Int
            weatherInfo.Sys_Sunset = sys["sunset"] as Int
            
            var main = (li["main"] as NSDictionary)
            weatherInfo.Main_Temp = main["temp"] as Float
            weatherInfo.Main_TempMin = main["temp_min"] as Float
            weatherInfo.Main_TempMax = main["temp_max"] as Float
            weatherInfo.Main_Pressure = main["pressure"] as Float
            weatherInfo.Main_SeaLevel = main["sea_level"] as Float
            weatherInfo.Main_GrndLevel = main["grnd_level"] as Float
            weatherInfo.Main_Humidity = main["humidity"] as Float
            
            var wind = (li["wind"] as NSDictionary)
            weatherInfo.Wind_Speed = wind["speed"] as Float
            weatherInfo.Wind_Deg = wind["deg"] as Float
            
            var clouds = (li["clouds"] as NSDictionary)
            weatherInfo.Clouds_All = clouds["all"] as Int
            
            var weather = (li["weather"] as NSArray)[0] as NSDictionary
            weatherInfo.Weather_Id = weather["id"] as Int
            weatherInfo.Weather_Main = weather["main"] as String
            weatherInfo.Weather_Description = weather["description"] as String
            weatherInfo.Weather_Icon = weather["icon"] as String
            
            dataSource.append(weatherInfo)
        }
    }
    
    
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    
    func parseJSON(inputData: NSData) -> NSDictionary{
        var error: NSError?
        var boardsDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
        
        return boardsDictionary
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

class WeatherInfo {
    var Coord_Lon: Float = 0.0
    var Coord_Lat: Float = 0.0
    
    var Sys_Country: String = ""
    var Sys_Message: Double = 0.0
    var Sys_Sunrise: Int = 0
    var Sys_Sunset: Int = 0
    
    var Weather_Id: Int = 0
    var Weather_Main: String = ""
    var Weather_Description: String = ""
    var Weather_Icon: String = ""
    
    var Main_Temp: Float = 0.0
    var Main_TempMin: Float = 0.0
    var Main_TempMax: Float = 0.0
    var Main_Pressure: Float = 0.0
    var Main_SeaLevel: Float = 0.0
    var Main_GrndLevel: Float = 0.0
    var Main_Humidity: Float = 0.0
    
    var Wind_Speed: Float = 0.0
    var Wind_Deg: Float = 0.0
    
    var Clouds_All: Int = 0
    
    var Dt:Int = 0
    var Id:Int = 0
    var Name: String = ""
}
