import Foundation

// Class definition
class Dog {
    var name : String
    
    init(name:String) {
        self.name = name
    }
    
    func bark() -> String {
        return "\(self.name) says woof!"
    }
}

// Instantiation
let myDog = Dog(name:"Toshi")

// Calling a method
myDog.bark()

// Accessing a property
myDog.name

// Creating a second instance
let mySistersDog = Dog(name:"Neeko")
mySistersDog.bark()


func prettyPrint(dog:Dog) -> String {
    return "I love \(dog.name)!"
}
prettyPrint(myDog)



// Extending a class
// Shiba is a "subclass" of Dog.
// Dog is a "superclass" of Shiba.
class Shiba : Dog {
    var temperament : String
    
    // Overriding the init method in order to initialize 'temperament'.
    override init(name:String) {
        self.temperament = "stubborn"
        super.init(name:name)  // init from Dog
    }
    
    // An example of "overriding" a function and in effect,
    // ensuring that Shibas have a different behavior from Dogs.
    override func bark() -> String {
        return "\(self.name) doesn't bark."
    }
}


var toshi = Shiba(name:"Toshi")
toshi.temperament

// Example of inheritance
toshi.name
toshi.bark()

// Example of polymorphism
// Since a Shiba is a Dog, we can pass Shibas wherever Dogs are needed.
prettyPrint(toshi)
prettyPrint(mySistersDog)


// Demonstrating an optional.
class Person {
    var name : String
    var nameLength : Int
    var age : Int?
    
    init(name:String) {
        self.name = name
        
        // Initialize nameLength to a computed quantity.
        self.nameLength = count(name)
    }
}

let eric = Person(name:"Eric")
eric.nameLength
// At this point, eric.age is nil.
eric.age

// TODO: Add a field to the Dog class that refers to the dog's owner.



// Another class example. Describes a point in 2D Cartesian space.
class Point {
    var x : Double
    var y : Double
    
    init(x:Double, y:Double) {
        self.x = x
        self.y = y
    }
}

let origin = Point(x:0.0, y:0.0)
origin.x
origin.y


// Using classes in other classes
class Line {
    var startPoint : Point
    var endPoint : Point
    
    init(startPoint:Point, endPoint:Point) {
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
}

let otherPoint = Point(x:40.0, y:30.0)

// Builds an axis from two points.
var xAxis = Line(startPoint:origin, endPoint:otherPoint)

// TODO: Add a method to Line that computes the Line's length.


