//
//  TableView.swift
//  Advanced iOS Spring 2017
//
//  Created by bb on 5/17/17.
//  Copyright © 2017 ___AdvancediOS___. All rights reserved.
//

import UIKit

class TableView: UITableViewController {

 var weatherArray = [Weather]()
  
  @IBAction func unwindToWeatherList(sender: UIStoryboardSegue){
    if let sourceViewController = sender.source as? AddCityController , let weather = sourceViewController.weather {
      let newIndexPath = IndexPath(row: weatherArray.count, section: 0)
      weatherArray.append(weather)
      tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      
      weatherArray.append(Weather(city: "La Paz", temperature: 26, picture: UIImage(named:"lapaz"))!)
      weatherArray.append(Weather(city: "Paris", temperature: 10, picture: UIImage(named:"paris"))!)
      weatherArray.append(Weather(city: "Osaka", temperature: -5, picture: UIImage(named:"osaka"))!)
      weatherArray.append(Weather(city: "Lima", temperature: -20, picture: UIImage(named:"lima"))!)
      weatherArray.append(Weather(city: "Ljubljana", temperature: 11, picture: UIImage(named:"ljubljana"))!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return weatherArray.count
    }

  
    // Reusage of cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as?
      WeatherTableViewCell else {
        fatalError("error")
      }

        // Configure the cell...
        cell.cityLabel.text = weatherArray[indexPath.row].city
        cell.tempLabel.text = "\(weatherArray[indexPath.row].temperature)"
        cell.imageContainer.image = weatherArray[indexPath.row].picture
        return cell
    }
 
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if (segue.identifier == "GoToDetailedView") {
            
            // Get the new view controller using segue.destinationViewController.
            // initialize new view controller and cast it as your view controller
            let vc = segue.destination as! WeatherViewController
            
            // Get index of selected cell row
            let index = tableView.indexPathForSelectedRow?.row
            
            // pass the selected weather object to view
            vc.weath = weatherArray[index!]

        }
    }
}
