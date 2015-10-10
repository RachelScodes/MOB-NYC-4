import Foundation


// This demonstrates a language construct called "enumerations."
//
// They enable readable code by providing the ability to write symbols
// as types that really stand for Integers or some other constant.

// This is an enumerated type called "WeatherConditions."
// It has multiple "cases" that represent the _values_ the type represents.

enum WeatherConditions {
    case Sunny
    case Cloudy
    case Raining
    case Snowy
    case Windy
    
    case Unknown
}

// Now we can declare variables and constants of this new enumerated type.

let current : WeatherConditions = WeatherConditions.Sunny
current == WeatherConditions.Cloudy

// If we know the type of the constant or variable, we can declare and compare
// without having to explicitly say the type, but just the dotted case instead.

var tomorrow : WeatherConditions = .Raining
tomorrow == .Raining


// Since enumerations behave as types, we can use them in the same way we use
// any other type. This simply makes our code more readable when we're dealing
// with discrete values.

// Here, we have a class that uses the enumeration as a type for its properties.

class WeatherEngine {
    var currentConditions : WeatherConditions
    var tomorrowsConditions : WeatherConditions
    
    init() {
        self.currentConditions = .Sunny
        self.tomorrowsConditions = .Unknown
    }
}

let engine = WeatherEngine()
engine.currentConditions == .Sunny

