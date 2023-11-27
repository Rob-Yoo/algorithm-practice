import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0
    var sortedA = A.sorted { $0 < $1 }
    var sortedB = B.sorted { $0 > $1 }
    
    for i in sortedA.indices {
        ans += sortedA[i] * sortedB[i]
    }
    return ans
}