import Foundation

func checkPrime(_ number: Int) -> Bool {
    let upperBound = Int(sqrt(Double(number)))
    var isPrime = true

    if (number == 1) {
        return false
    }

    for div in 1...upperBound {
        if (number % div == 0 && div != 1) {
            isPrime = false
            break
        }
    }
    
    return isPrime
}

func solution(_ n:Int, _ k:Int) -> Int {
    let convertedNum = String(n, radix: k)
    var stack = ""
    var count = 0

    for num in convertedNum {
        let strNum = String(num)
        
        if (strNum == "0") {
            if (!stack.isEmpty && checkPrime(Int(stack)!)) { 
                count += 1
            }
            stack = ""
        } else {
            stack += strNum
        }
    }
    
    if (!stack.isEmpty && checkPrime(Int(stack)!)) { count += 1 }
    
    return count
}