// Optionals

// Strings can be concatenated like so:
let first = "John"
let last = "Doe"
first + " " + last

// Make this string an "Optional String."
var name : String?

// Use CMD + / to toggle this line. See how interpolation changes.
name = "Toshi"

// Note how this says nil, or Optional("Toshi") instead of just Toshi.
println("My  pup's name is \(name)")

// To "unwrap" the Optional properly, we have to use this if let syntax...
if let _name = name {
    // If the Optional holds a String, instead of nil, _name will equal
    // the value of that String.
    println("I know my pup's name!!! And it's " + _name)
} else {
    // Here, the Optional contained nil instead.
    println("Nope, it's nil.")
}

// To unwrap an Optional known to not be nil, use !.
let currentTemperature : Int?
currentTemperature = 60
currentTemperature!

