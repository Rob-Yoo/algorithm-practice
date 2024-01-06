import Foundation

class Solution {
    var table = Array(repeating: 0, count: 1001)

    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        let topFloor = cost.count + 1

        table[1] = cost[0]
        for stair in 2..<topFloor {
            table[stair] = cost[stair - 1] + min(table[stair - 1], table[stair - 2])
        }

        return min(table[topFloor - 1], table[topFloor - 2])
    }
}