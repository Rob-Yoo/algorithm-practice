import Foundation

var primeNumberSet = Set<Int>()
var visited = Array(repeating: false, count: 7)

extension Int {
    var isPrime: Bool {
        if (self < 2) { return false }

        let upperBound = Int(sqrt(Double(self)))
        for i in 1...upperBound {
            if (self % i == 0 && i != 1) {
                return false
            }
        }
        
        return true
    }
}

func solution(_ numbers:String) -> Int {
    let numbers = numbers.map { String($0) }
    
    findPrimeNumbers(numbers, "")
    return primeNumberSet.count
}

func findPrimeNumbers(_ numbers:[String], _ primeNumber: String) {
    var primeNumber = primeNumber

    if (primeNumber.count == numbers.count) {
        return
    }    
    for i in 0..<numbers.count {
        if (!visited[i]) {
            visited[i] = true
            primeNumber += numbers[i]
            if (Int(primeNumber)!.isPrime) {
                primeNumberSet.insert(Int(primeNumber)!)
            }
            findPrimeNumbers(numbers, primeNumber)
            visited[i] = false
            primeNumber.removeLast()
        }
    }
}