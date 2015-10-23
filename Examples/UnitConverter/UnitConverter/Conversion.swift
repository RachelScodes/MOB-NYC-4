//
//  Conversion.swift
//  UnitConverter
//
//  Created by William Martin on 5/21/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import Foundation


class Conversion {
    var imperialUnits : String = ""
    var metricUnits : String = ""
    
    init() {
        
    }
    
    func convertImperialToMetric(imperial:Double) -> Double {
        return 0.0
    }
    
    func convertMetricToImperial(metric:Double) -> Double {
        return 0.0
    }
}


class FahrenheitToCelsius : Conversion {
    override init() {
        super.init()
        self.imperialUnits = "°F"
        self.metricUnits = "°C"
    }
    
    override func convertImperialToMetric(imperial: Double) -> Double {
        let F = imperial
        let C = 5.0 * (F - 32.0) / 9.0
        return C
    }
    
    override func convertMetricToImperial(metric: Double) -> Double {
        let C = metric
        let F = C * 9.0 / 5.0 + 32.0
        return F
    }
}


class MilesToKilometers : Conversion {
    // Put your conversion here!
    override init() {
        super.init()
        self.imperialUnits = "mi"
        self.metricUnits = "km"
    }
    
    override func convertImperialToMetric(imperial: Double) -> Double {
        let miles = imperial
        let km = miles * 1.609344
        return km
    }
    
    override func convertMetricToImperial(metric: Double) -> Double {
        let km = metric
        let miles = km / 1.609344
        return miles
    }
}


class PoundsToKilograms : Conversion {
    override init() {
        super.init()
        self.imperialUnits = "lbs"
        self.metricUnits = "kg"
    }
    
    override func convertImperialToMetric(imperial: Double) -> Double {
        let pounds = imperial
        let kg = pounds * 0.453592
        return kg
    }
    
    override func convertMetricToImperial(metric: Double) -> Double {
        let kg = metric
        let pounds = kg * 2.20462
        return pounds
    }
}


class InchesToCentimeters : Conversion {
    override init() {
        super.init()
        self.imperialUnits = "in"
        self.metricUnits = "cm"
    }
    
    override func convertImperialToMetric(imperial: Double) -> Double {
        let inches = imperial
        let cm = inches * 2.54
        return cm
    }
    
    override func convertMetricToImperial(metric: Double) -> Double {
        let cm = metric
        let inches = cm / 2.54
        return inches
    }
}


class FeetToMeters : Conversion {
    override init() {
        super.init()
        self.imperialUnits = "ft"
        self.metricUnits = "m"
    }
    
    override func convertImperialToMetric(imperial: Double) -> Double {
        let feet = imperial
        let meters = feet / 3.2808
        return meters
    }
    
    override func convertMetricToImperial(metric: Double) -> Double {
        let meters = metric
        let feet = meters * 3.2808
        return feet
    }
}


class GallonsToLiters : Conversion {
    override init() {
        super.init()
        self.imperialUnits = "ga"
        self.metricUnits = "li"
    }
    
    override func convertImperialToMetric(imperial: Double) -> Double {
        let gallons = imperial
        let liters = gallons / 0.26417
        return liters
    }
    
    override func convertMetricToImperial(metric: Double) -> Double {
        let liters = metric
        let gallons = liters * 0.26417
        return gallons
    }
}








