// Intro to Swift in class playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.
var name = "Travis"
var age = 28

// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"
print("Hello \(name), you are \(age) years old!")

// TODO: Print "You can drink" if the person is at least 21 years old. If he/she is at least 18, print "you can vote." If the user is at least 16, print "You can drive."
if age >= 21 {
    print("You can drink.")
}
if age >= 18 {
    print("You can vote.")
}
if age >= 16 {
    print("You can drive.")
}

// TODO: Print "you can drive" if the user is older than 16 but younger than 18. It should print, "You can drive and vote", if the user is at least 18 but younger than 21. If the user is at least 21, it should print, "You can drive, vote and drink (but not at the same time!)".
if age >= 21 {
    print("You can drive, vote and drink (but not at the same time).")
} else if age >= 18 {
    print("You can drive and vote.")
} else if age >= 16 {
    print("You can drive.")
}

// TODO: Print the first fifty multiples of seven minus one. (e.g. The first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20.)
for element in 1...50 {
    print("\((7 * element) - 1)")
}

// TODO: Create a constant called number.
let number = 11

// TODO: Compute whether the above number is even.
if number % 2 == 0 {
    print("number is even")
}

// TODO: Print "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use count().
print("Hello \(name), your name is \(name.characters.count) characters long!")

// TODO: Print the sum of one hundred random numbers. Use Int(rand()) to generate random numbers.
let myRandomNumber = Int(rand())

var sum = 0
for _ in 0..<10 {
    sum += Int(rand())
}
sum

// TODO: Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.

let limit = 100
for number in 1...limit {
    var result = "\(number)"
    if number % 5 == 0 && number % 3 == 0 {
        result = "FizzBuzz"
    } else if number % 5 == 0 {
        result = "Buzz"
    } else if number % 3 == 0 {
        result = "Fizz"
    }
    print("\(result)")
}


// TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below
let targetElement = 37
var a = 0
var b = 1
var c = a + b

for element in 3...targetElement {
    c = a + b
    a = b
    b = c
}
print("\(c)")


