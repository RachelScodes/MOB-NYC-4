// Control Flow: conditionals

// A typical if-else statement. You can put as many "else if" clauses as you need.
// TODO:
// 1. Change temp to see how all the clauses execute.
// 2. Add an if-else clause for absolute zero.
var temp = 20
if temp <= 0 {
    println("freezing")
} else if temp >= 100 {
    println("boiling")
} else {
    println("water")
}


// A typical "while" loop.
var s = 0
while s < 10 {
    s = s + 1
}
println(s)

// A typical "for" loop.
var sum = 0
for var i = 0; i < 10; i++ {
    sum += i
}
println(sum)


// Check for prime numbers (in a very dumb way).
let toCheck = 289
for (var i=2; i<toCheck; i++) {
    println(i)
    if toCheck % i == 0 {
        println("composite!")
        break
    }
}
// Advanced students: try to make this more efficient. Use a while loop.

// Using continue:
for (var i=2; i<toCheck; i++) {
    if i % 2 == 0 { continue }
    println(i)
    if toCheck % i == 0 {
        println("composite!")
        break
    }
}


