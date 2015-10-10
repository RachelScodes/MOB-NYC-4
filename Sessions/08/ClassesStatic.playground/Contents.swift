import Foundation

// This playground helps describe how to use the "static" keyword
// for classes.

// "static" can be used to qualify a property or method of a class so that
// the property or method will be accessible at the "class level," that is
// by using the class name instead of an instance.

// This enables you to set data and methods that describe something about
// the entire class, instead of just an instance.



class Human {
    // A static property
    static var species = "homo sapiens"
    
    // A static method
    static func getSubspecies() -> String {
        return species + " sapiens"
    }
    
    // An instance property
    var name : String
    
    
    init(name:String) {
        self.name = name
    }
    
    func sayIntro() -> String {
        return "Hello, my name is \(self.name). Are you a \(Human.species), too?"
    }
}

// You can access "species" from the class itself:
Human.species

// You can also access "getSubspecies" from the class:
Human.getSubspecies()

// Since all humans have the species "homo sapiens," then this usage should
// make sense. Unless we're starting to evolve, this property applies to 
// all instances of Human we would create.


// Let's make some instances:
let me = Human(name: "John")
let you = Human(name: "Jane")

// This is how we normally use properties and methods:
me.sayIntro()
you.name


// -------------------------------------------------------------------
// What can't you do?

// You cannot access instance properties or methods from the class.
// Human.sayIntro()

// You cannot access "species" from an instance, however.
// me.species



// -------------------------------------------------------------------
// ADVANCED STUFF

// You also can't override "static" methods when you make a subclass.

// BUT! If you use "class" instead of "static" on a method, that will
// indeed allow you to override the method.

class Wolf {
    static let species : String = "canis lupus"
    
    // Note how we use "class" here instead of "static." The only reason
    // to do this is to allow subclasses to override these methods.
    class func getSubspecies() -> String {
        return Wolf.species + " lupus"
    }
    
    class func getCommonName() -> String {
        return "Eurasian Wolf"
    }
}

Wolf.species
Wolf.getSubspecies()
Wolf.getCommonName()


// Now, we make a subclass and override the two "class" methods.

class Dog : Wolf {
    override class func getSubspecies() -> String {
        // Note how Dog also has the static property "species" available.
        return Dog.species + " familiaris"
    }
    
    override class func getCommonName() -> String {
        return "Domestic Dog"
    }
}

Dog.species
Dog.getSubspecies()
Dog.getCommonName()


