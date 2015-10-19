// Playground - noun: a place where people can play

import UIKit

/*
BASICS OF FUNCTIONS

Let's start with the basics, a function is a reusable block of code that does something
We generally use functions for actions we might need more than once

The easiest dumbest functions don't expect things (parameters) and give no things back
The way we call the most easy function is just it's function name followed by parentheses
Example:
knockknock()
Everytime we call the knockknock function like this it will be executed once
A function will ALWAYS have the parentheses

Within a function we can literally do whatever we want except create a new function within it
But we can create variables, constants, loops, if statements, call other functions and so on
To call another function within a function we do the same thing again
Example:
func doTheKnockKnock() {
knockknock()
}
Of course this example doesn't make any sense but just to show how that would work.


Functions can also accept parameters, from one to a lot of them, try to limit them though
To add a parameter to a function we first choose a name for that parameter followed by it's type
parameterName:parameterType
Example:
func driveToCity(cityName:String) {
println("I'm driving to \(cityName)")
}
Note that cityName can be name or destination instead, doesn't matter.
cityName will only be accesible and known to our code within the driveToCity block
To accept multiple parameters we comma seperate them
Example:
func calculateDistanceBetweenCities(departureCity:String, destinationCity:string) {
let magicalDistance = some magical formula to calculate the distance that returns an Int
println("The distance between \(departureCity) and \(destinationCity) is \(magicalDistance)")
}


And finally a function can return stuff to us that we can save or use
When we want our function to return something we have to indicate that using the "->" followed by the datatype
Example
func calculateDistanceBetweenCities(departureCity:String, destinationCity:String) -> Int {
return magicalDistance
}
We're telling Xcode this function will return an integer, you return something using the return keyword!

We can save the return value of a function into a var/let like this:
let distanceToCity = calculateDistanceBetweenCities("New York", "Washington DC")


Final note: don't be afraid to have long function names, they'll help you in big projects!!!
*/


// Create a function called "knockknock" that just prints the line "Who's there?"
// This function has no parameters nor a return value.
func knockknock() {
    print("Who's there?")
}


// That was fun! Let's joke around and knock a few times more.
// Write a function knockMultipleTimes that accepts one paramter.
// That parameter will be an int that let's us specify how many times we want to knock
// Within the function we have a loop that runs x ammount of times that calls the knock knock function.
func knockMultipleTimes(numberOfTimes: Int) {
    for _ in 1...numberOfTimes {
        knockknock()
    }
}

// HAHAHA, okay let's answer before the person behind the door goes nuts!
// We will write a replyWhoIsHere function that accepts 2 parameters.
// Parameter one will be a firstname (String), and parameter two will be the homeCountry (also String).
// The function will just print "It's me, {firstname}, from {homeCountry}".
func replyWhoIsHere(firstname: String, homeCountry: String) {
    print("It's me, \(firstname), from \(homeCountry)")
}

// Cool that worked! Let's say we want to reply with our age instead of home country!
// We'll create a function calculateAge that accepts one parameter that will be yearOfBirth (Int)
// The function will return the age (Int).
// Use this code to do the calculation, don't worry about the code itself for now if you don't want to.
// Just copy and paste it in your function.
/*
let currentDate = NSDate()
let currentCalendar = NSCalendar.currentCalendar()
let currentYear = currentCalendar.component(NSCalendarUnit.CalendarUnitYear, fromDate: currentDate)
let age = currentYear - yearOfBirth
*/
// Return the age at the end of the function
func calculateAge(yearOfBirth: Int) -> Int {
    let currentDate = NSDate()
    let currentCalendar = NSCalendar.currentCalendar()
    let currentYear = currentCalendar.component([.Year], fromDate: currentDate)
    let age = currentYear - yearOfBirth
    return age
}


// Create a function tellNameAndAge that has two parameters.
// Parameter one is the name (String), parameter two is the yearOfBirth(Int).
// The function will have one var: age, you will call the calculateAge function and store the return value in that var.
// After that you will print a line that states "{name}, my age is {age}", where {age} is the var of course!
func tellNameAndAge(name: String, yearOfBirth: Int) {
    let age = calculateAge(yearOfBirth)
    print("\(name), my age is \(age)")
}

// Call knock knock.
knockknock()

// Call knockMultipleTimes.
knockMultipleTimes(11)

// Call replyWhoIsHere.
replyWhoIsHere("travis", homeCountry: "US")

// Call tellNameAndAge.
tellNameAndAge("Travis", yearOfBirth: 1986)
