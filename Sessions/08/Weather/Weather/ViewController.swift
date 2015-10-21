//
//  ViewController.swift
//  Weather
//
//  Created by William Martin on 10/7/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        WeatherData.sharedInstance().update()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //let button = sender as! UIButton
        //print(button.titleLabel?.text)
        //print(segue.identifier)
        
        
        // Get an instance of the LocationViewController we're going to.
        let locationController = segue.destinationViewController as! LocationViewController
        
        // Given the identifier of the segue (which correlates to the button the
        // user taps), load the proper Location from the WeatherData singleton.
        if segue.identifier == "location0" {
            locationController.location = WeatherData.sharedInstance().location0
            
        } else if segue.identifier == "location1" {
            locationController.location = WeatherData.sharedInstance().location1
            
        } else if segue.identifier == "location2" {
            locationController.location = WeatherData.sharedInstance().location2
            
        } else {
            locationController.location = Location(name:"Nowhere")
            
        }
        
    }
}














