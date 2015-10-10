import Foundation

// Use dot-notation to access the various elements of a tuple by position.
// They are "zero-indexed," so the first one is the integer 0.
let simpleTuple = (1, 2, 3)
simpleTuple.0
simpleTuple.1
simpleTuple.2


// Tuples are used to carry small sets of values of potentially different types.
let manyTypes = ("janet", 23, true)
manyTypes.0
manyTypes.1
manyTypes.2


// Tuples can also have names attached to their elements, just as
// functions have names for their parameters:
var namedTuple = (name:"Jo", age:23, isFemale:true)

// You can then access those elements by name (as well as by position) using
// the same dot notation, but use the name instead:
namedTuple.name
namedTuple.age
namedTuple.isFemale
namedTuple.0

// Tuples' elements can be modified if the tuple is held by a variable:
namedTuple.name = "Joanna"
namedTuple.1 = 24
namedTuple


// The tuple type is declared using parentheses () and other type names:
let explicitlyTyped : (String, Int, Bool) = ("john", 32, false)

// These can also be classes that you've defined.
class Dog {
    var name : String
    init(name:String) {
        self.name = name
    }
}

let dogTuple : (Dog, String) = (Dog(name:"Toshi"), "shiba")


// Functions can use tuples to return several values. Note that we
// must declare the return type as a tuple and specify the types of
// that tuple's elements:
func getTwentiesAgeRange() -> (Int, Int) {
    return (20, 29)
}
getTwentiesAgeRange()


// There is no such thing as a one-element tuple in Swift:
let single = (3)
single

// But there is an empty tuple. "Void" means the same thing as "empty tuple."
let empty = ()
empty


