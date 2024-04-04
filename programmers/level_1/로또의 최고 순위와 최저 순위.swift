import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var minCount = 0
    let zeroCount = lottos.filter { $0 == 0 }.count
    let rank = [6, 6, 5, 4, 3, 2, 1]

    lottos.forEach { if (win_nums.contains($0)) { minCount += 1 } }
    
    if (zeroCount == 0 && minCount != 0) {
        return [rank[minCount], rank[minCount]]
    }
    return [rank[minCount + zeroCount], rank[minCount]]
}