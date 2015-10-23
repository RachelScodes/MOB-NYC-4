//
//  Conversion.swift
//  Units
//
//  Created by William Martin on 10/21/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import Foundation


// This is our base class for all the available conversions. We use a class so we can bundle
// together related functionality and user subclassing to provide specific conversions.
//
// The object model needs the following information to represent a single unit conversion:
// - units that we're converting from
// - units we're converting to
// - an equation that does the actual converting
// - a user-friendly description that the user will read
//
class Conversion {
    // Hold the units as Strings.
    var inputUnits = ""
    var outputUnits = ""
    
    // Perform the conversion given a value a user will input.
    func convert(input:Double) -> Double {
        return 0.0
    }
    
    // Return a user-friendly String that relates to the user what the conversion is.
    func userFriendlyDescription() -> String {
        return "\(self.inputUnits) to \(self.outputUnits)"
    }
}

class FtoC : Conversion {
    override init() {
        super.init()
        self.inputUnits = "ºF"
        self.outputUnits = "ºC"
    }
    
    override func convert(input:Double) -> Double {
        let F = input
        let C = (F - 32.0) * 5.0 / 9.0
        return C
    }
}

class FeetToMeters : Conversion {
    override init() {
        super.init()
        self.inputUnits = "ft"
        self.outputUnits = "m"
    }
    
    override func convert(input:Double) -> Double {
        let ft = input
        let m = ft / 3.2808
        return m
    }
}

class MilesToKilometers : Conversion {
    override init() {
        super.init()
        self.inputUnits = "mi"
        self.outputUnits = "km"
    }
    
    override func convert(input:Double) -> Double {
        let mi = input
        let km = mi * 1.609344
        return km
    }
}




