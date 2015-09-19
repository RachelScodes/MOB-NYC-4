// Variables

// Declare and initialize. Implicitly typed as an Int.
var x = 1

// Declare and initialize a Double, implicitly.
var height = 1.76

// Declare and initialize a constant.
let pi = 3.14159

// Declare and initialize a constant as a Double with a type annotation.
let c : Double = 299792458

// A better name for the same constant:
let speedOfLight : Double = 299792458

// 4 different ways to increment x by 1.
x = x + 1
x += 1
x++
++x
println(x)

// Increment height by some value.
height += 0.1
println(height)


// Use multiple variables in an expression
var radius = 5.0
pi * radius * radius

// Assign the result to another variable.
var area = pi * radius * radius
println(area)

