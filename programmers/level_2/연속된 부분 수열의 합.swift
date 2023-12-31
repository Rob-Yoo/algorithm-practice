import Foundation

var result = [Int]()
var minDiff = Int.max

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var prefixSum = Array(repeating: 0, count: sequence.count + 1)
    var leftPointer = 0
    var rightPointer = 1
    
    for i in 1..<prefixSum.count {
        prefixSum[i] = prefixSum[i - 1] + sequence[i - 1]
    }
    
    while (leftPointer < prefixSum.count && rightPointer < prefixSum.count) {
        if (prefixSum[leftPointer] + k > prefixSum[rightPointer]) {
            rightPointer += 1
        } else if (prefixSum[leftPointer] + k < prefixSum[rightPointer]) {
            leftPointer += 1
        } else {
            updateResult(leftPointer, rightPointer - 1)
            leftPointer += 1
        }
    }
    
    return result
}

func updateResult(_ left: Int, _ right: Int) {
    let temp = minDiff

    minDiff = min(minDiff, right - left)
    if (temp != minDiff) { 
        result = [left, right] 
    }
}