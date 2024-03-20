import Foundation


func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var psum = Array(repeating: 0, count: sequence.count + 1)
    var (start, end) = (0, 1)
    var minLen = Int.max
    var result = [Int]()
    
    sequence.enumerated().forEach { psum[$0 + 1] = psum[$0] + $1 }
    while (start < psum.count && end < psum.count) {
        let sum = psum[end] - psum[start]
        
        if (sum < k) {
            end += 1
        } else if (sum > k) {
            start += 1
        } else {
            if (minLen > (end - 1) - start) {
                minLen = (end - 1) - start
                result = [start, end - 1]
            }
            start += 1
        }
    }
    
    return result
}