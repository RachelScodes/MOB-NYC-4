import Foundation

// Returns whether a given number n is prime or not.
func isPrime(n:Int) -> Bool {
    if n < 2 {
        return false
    } else if n == 2 {
        return true
    } else if n % 2 == 0 {
        return false
    }
    
    var i = 3
    while i * i <= n {
        if n % i == 0 {
            return false
        }
        i += 2
    }
    
    return true
}

isPrime(2)
isPrime(3)
isPrime(4)
isPrime(1009)

// Counts the number of prime numbers between 0 and the given number.
func countPrimes(n:Int) -> Int {
    var numberOfPrimes = 0
    for i in 0...n {
        if isPrime(i) {
            numberOfPrimes += 1
        }
    }
    return numberOfPrimes
}

countPrimes(1000)
