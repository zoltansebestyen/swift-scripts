#!/usr/bin/env swift

import Foundation

func isPrime(n: Int) -> Bool {
    if n < 2 {
            return false // are not primes
    }
        let limit = Int(sqrt(Float(n)))
            if limit < 2 {
                   return true // 2, 3 are primes
            }
        for i in 2...limit {
            if n % i == 0 {
                        return false
            }
        }
            return true

}

var primes: [Int] = []
for i in 2...100 {
    if isPrime(i) {
            primes.append(i)
    }

}
print(primes)

