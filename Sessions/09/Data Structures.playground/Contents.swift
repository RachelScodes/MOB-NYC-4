import Foundation


// Example of a function that returns multiple values using Tuples.
enum Decade {
    case Twenties
    case Thirties
}

func getAgeRange(range:Decade) -> (Int, Int) {
    switch range {
    case .Twenties:
        return (20, 29)
    case .Thirties:
        return (30, 39)
    }
}

getAgeRange(.Twenties)



// An Array of Doubles, implicitly typed.
let numbers = [3.14, 2.718, 1.618]
numbers

// An Array of Strings, also implicitly typed.
let words = ["hello", "doctor", "name", "continue", "yesterday", "tomorrow"]

// Index into the Array using "subscript notation" to get the first element.
// Note that Arrays are "zero-index," meaning the first element's index is 0.
words[0]

// Iterate over Arrays using for-in loops:
for word in words {
    print(word)
}

// Some properties of Arrays that you'll find quite useful.
words.count
words.last
words.first

// You can use Ranges to slice into an Array and retrieve a subset of the elements
// it contains.
words[0..<2]
words[2...4]

// Use indexOf to return the index for a given element. It's Optional, so it will
// return nil if the element is not found!
words.indexOf("doctor")



// To make an Array mutable (that is, so we can change it), use var like any other variable:
var shuttles = ["Columbia", "Discovery", "Challenger", "Endeavor", "Atlantis"]

// Add another element to the Array at the end of the Array.
shuttles.append("Enterprise")

// Actually sorts the "shuttles" Array by altering it. No need for another constant or variable.
shuttles.sortInPlace()
shuttles

// Empty Array of Strings.
let starships : [String] = []
// Use the isEmpty property to return whether it has no elements (i.e. is empty).
starships.isEmpty

// To iterate over an array but also get the index, use the .enumerate() method:
for (index, element) in shuttles.enumerate() {
    print(index)
}

// Use the .contains method to ask the Array whether it contains a given value:
shuttles.contains("Columbia")

// Use the .sort() method to produce a new Array with the order of the Array sorted according
// to the values' natural order.
let sortedShuttles = shuttles.sort()

// The .reverse() method does not return an Array, but an object that we can use to iterate
// over the Array in reverse order.
let reversedShuttles = sortedShuttles.reverse()
for shuttle in reversedShuttles {
    print(shuttle)
}

// To actually produce an Array in reverse order, construct it using the Array() constructor:
Array(reversedShuttles)



// An example using NASA probe names.
var probes = ["Voyager", "Cassini-Huygens", "Curiosity", "Galileo", "Juno"]

// Add another probe name at the end of the Array.
probes.append("New Horizons")
probes.first
probes.last
probes.count

// Inserts an element into the Array at index=0, i.e. the beginning of the Array.
probes.insert("Viking", atIndex:0)

// Remove the 2nd element of the Array.
probes.removeAtIndex(1)

// We can concatenate Arrays of the same type using + and +=. This adds 3 elements at once:
probes += ["Kepler", "Mariner", "Magellan"]
probes.count



// We'll be using this Dog class in the following examples about sorting and filtering.
enum Gender {
    case Male
    case Female
}

class Dog {
    var name : String
    var gender : Gender
    
    init(name:String, gender:Gender) {
        self.name = name
        self.gender = gender
    }
}

// An Array of Dog instances...
let dogs = [
    Dog(name:"Toshi", gender:.Male),
    Dog(name:"Layla", gender:.Female),
    Dog(name:"Neeko", gender:.Male)
]

// If you have an Array of non-basic types, say a class you've defined, then we have
// to do a bit more work to get them to sort.

// A "comparator" function that accepts two instances of the class in question and
// returns a Bool, true if the second comes after the first.
// 
// In this function, the order of the Dogs boils down to the names they're given, so
// we can just compare the names of the Dogs as raw strings, and that order will be
// reflected in the order of the Array of Dogs.
func sortByName(a:Dog, b:Dog) -> Bool {
    return a.name < b.name
}
// Pass the comparator function to the sort() method, and the Array sorts by the name!
dogs.sort(sortByName)


// Write a filter function that accepts a Dog element (the type contained by the Array)
// and returns a Bool. The value should be true if we want that element to show up in
// the filtered Array.
func isMale(dog:Dog) -> Bool {
    return dog.gender == .Male
}
// Use the .filter method and provide the filter function as the sole argument.
let maleDogs = dogs.filter(isMale)
// We should only get Dogs whose .gender method is .Male
maleDogs


// The .map function can transform an Array from an Array of X to an Array of Y, or can
// enable us to alter every element in an Array of X. All we have to do is provide a 
// function that accepts a single element and returns the new element (or the same element
// that has been changed in some way.
//
// This example takes a Dog and returns its name. Thus, we'll end up with an Array of
// Strings that represent the names of all the Dogs.
func getName(dog:Dog) -> String {
    return dog.name
}
// Just pass the function to .map, and it will iterate over all the Dogs for us, returning
// the resulting Array of Strings.
let dogNames = dogs.map(getName)

// One common operation we need to perform is to produce a single String that contains the
// contents of an Array, but separated by commas or some other punctuation.
//
// This returns a single String with all the names of the space shuttles, separated by commas:
shuttles.joinWithSeparator(", ")



// A Dictionary of String to Double:
var constants = ["e": 2.71828, "pi": 3.14159, "phi":1.618, "tau":6.283]

// Adds a new key-value pair to the Dictionary.
constants["c"] = 299_792_458.0

// Removes a key-value pair from the Dictionary.
constants.removeValueForKey("tau")
constants

// If we give the Dictionary a key it doesn't have, it returns nil.
constants["G"]









