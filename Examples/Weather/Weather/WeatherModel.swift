//
//  WeatherModel.swift
//  Weather
//
//  Created by William Martin on 10/7/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//


import Foundation


// The rest of this file represents our "data model," the set of classes that we're
// using to represent the data manipulated by our app and presented to the user.

// WeatherData is the top-level object that holds all our data.
//
// It is like a single database that will provide methods and properties for accessing
// all the app's data in one place.
class WeatherData {
    
    // We don't have data structures yet at this point in the course, so we're going to 
    // hold the information about these three locations as separate properties. It's a 
    // little clumsy, but it will work for this little app.
    var location0 : Location
    var location1 : Location
    var location2 : Location
    
    init() {
        self.location0 = Location(name:"New York")
        self.location1 = Location(name:"Montreal")
        self.location2 = Location(name:"San Francisco")
    }
    
    // This method populates the locations with some data. Pretend this is like requesting
    // the data from a remote server.
    func update() {
        self.location0.currentTemp = 70
        self.location0.highTemp = 72
        self.location0.lowTemp = 61
        self.location0.currentConditions = .Raining
        
        self.location1.currentConditions = .Snowy
        
        self.location2.currentConditions = .Sunny
    }
    
    // This enables the "Singleton" pattern. It means that whenever we use 
    // WeatherData.sharedInstance(), we'll always get the same instance of WeatherData.
    // We only need once instance, because we only have one set of app data.
    
    // The "static" keyword means we can dot-access onto the class itself, WeatherData,
    // instead of an instance of the class. This means that properties using "static"
    // only occur once. Instances can't have a different value for these properties.
    static var singleton : WeatherData?
    
    // This method returns an instance of WeatherData that is available everywhere in the
    // app. As opposed to instantiating WeatherData (using the () syntax), this method
    // always returns the *same* instance each time it's called. We want this because
    // we only want one source of data for the app.
    static func sharedInstance() -> WeatherData {
        
        // self.singleton is Optional, so we have to unwrap it.
        if let _singleton = self.singleton {
            // We have a non-nil value, so return it.
            return _singleton
        }
        
        // Otherwise, if it's nil, then instantiate the singleton instance, store it,
        // and return it. This initialization only happens once if we consistently use
        // WeatherData.sharedInstance()
        self.singleton = WeatherData()
        
        // Unwrap the value here, since we can't return an Optional (look at the return
        // type of sharedInstance above).
        return self.singleton!
    }
    
}

// Make some enumerated constants to help us describe the current weather conditions
// in a readable way.
enum Conditions {
    case Sunny
    case Cloudy
    case Raining
    case Snowy
    case Windy
}

// The Location class represents the weather data needed for a single city.
class Location {
    var name : String
    
    var currentTemp : Double?
    var highTemp : Double?
    var lowTemp : Double?
    
    var currentConditions : Conditions?
    
    init(name:String) {
        self.name = name
    }
}





