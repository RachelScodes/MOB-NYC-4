//
//  LocationViewController.swift
//  Weather
//
//  Created by William Martin on 10/7/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit


// This View Controller is responsible for controlling the display of the information
// for a single Location instance.
class LocationViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var conditionsIcon: UIImageView!
    
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    // location is an "Implicitly unwrapped Optional" (note the !).
    //
    // This means that we don't have to provide a value a initialization time. Since
    // we're extending a UIViewController, we can't override init() and initialize our
    // properties. Thus, the ! means the property has a nil value at first, and we're
    // responsible for giving it a value before the first time we dot-access it.
    //
    // This property is given a value in the prepareForSegue method in the ViewController
    // class. Thus, when we dot-access it for the first time in viewDidLoad, it will
    // have a value. The ! at declaration time also means we don't have to unwrap the
    // value like a regular Optional; it's "implicitly unwrapped" or "automatically
    // unwrapped."
    var location : Location!

    // This method is called soon after the View Controller is instantiated and it has
    // read its view data from the storyboard file.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Take the name of the location and display it in the provided UILabel.
        self.locationLabel.text = self.location.name
        
        self.updateCurrentTemperature()
        self.updateWeatherConditions()
        self.updateHighTemperature()
        self.updateLowTemperature()
    }
    
    func updateCurrentTemperature() {
        if let _currentTemp = self.location.currentTemp {
            self.currentTempLabel.text = "Current: \(_currentTemp)"
        } else {
            self.currentTempLabel.text = "Current: -"
        }
    }
    
    func updateLowTemperature() {
        if let _lowTemp = self.location.lowTemp {
            self.lowTempLabel.text = "Low: \(_lowTemp)"
        } else {
            self.lowTempLabel.text = "Low: -"
        }
    }
    
    func updateHighTemperature() {
        if let _highTemp = self.location.highTemp {
            self.highTempLabel.text = "High: \(_highTemp)"
        } else {
            self.highTempLabel.text = "High: -"
        }
    }
    
    func updateWeatherConditions() {
        // Unwrap the currentConditions property.
        if let _conditions = self.location.currentConditions {
            
            if _conditions == .Raining {
                self.conditionsIcon.image = UIImage(named: "rain.png")
                
            } else if _conditions == .Snowy {
                self.conditionsIcon.image = UIImage(named: "snow.png")
                
            } else if _conditions == .Sunny {
                self.conditionsIcon.image = UIImage(named: "sun.png")
                
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
