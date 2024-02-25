import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var scores: [Int] = []
    var idx = m - 1
    var result = 0

    if (score.count <= idx) {
        return 0
    }

    scores = score.sorted { $0 > $1 }
    while (idx < scores.count) {
        let profit = scores[idx] * m
        result += profit
        idx += m
    }
    
    return result
}