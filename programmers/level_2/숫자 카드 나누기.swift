import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let gcdOfA = arrayA.reduce(arrayA[0]) { gcd($0, $1) }
    let gcdOfB = arrayB.reduce(arrayB[0]) { gcd($0, $1) }
    let maxA = arrayB.allSatisfy { gcdOfA != 1 && $0 % gcdOfA != 0 } ? gcdOfA : 0
    let maxB = arrayA.allSatisfy { gcdOfB != 1 && $0 % gcdOfB != 0 } ? gcdOfB : 0
    
    return max(maxA, maxB)
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if (b == 0) { return a }
    return gcd(b, a % b)
}