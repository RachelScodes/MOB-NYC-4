import Foundation

// Functions accepting one parameter and returning a value.

func isFreezing(temp:Double) -> Bool {
    return temp <= 32
}

func isHot(temp:Double) -> Bool {
    return temp >= 80
}

if isFreezing(30) {
    print("It's like ice out here!")
}

isFreezing(32)

func whatToWear(temp:Double) -> String {
    if isFreezing(temp) {
        return "A big coat"
    } else if isHot(temp) {
        return "A t-shirt"
    } else {
        return "I don't know!"
    }
}
whatToWear(32)
whatToWear(82)


// Example: Defining variables and constants inside a function.

func convertLbsToKg(pounds:Double) -> Double {
    let poundsPerKg = 2.2
    return pounds / poundsPerKg
}
convertLbsToKg(125)


// PRACTICE: Write a function that converts Fahrenheit to Celsius.
// PRACTICE: Write another that converts Celsius to Fahrenheit.
// PRACTICE: Prove that you've written them correctly by calling one with the result of the other.

