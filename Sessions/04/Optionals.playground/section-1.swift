// Optionals

// A sample options. Can be an Integer or nil.
var opt : Int?
opt

// Use CMD + / to toggle this line as a comment. Look how the conditional changes.
opt = 10

if let _opt = opt {
    // This is how we "interpolate" a value into a string.
    println("has a value: \(_opt)")
} else {
    println("still nil")
}

// Change opt = 10 to other values to see how the string interpolation works.
