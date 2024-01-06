class Solution {
    var table = Array(repeating: 0, count: 46)
    func climbStairs(_ n: Int) -> Int {
        table[1] = 1
        table[2] = 2

        if (n >= 3) {
            for stair in 3...n {
                table[stair] = table[stair - 1] + table[stair - 2]
            }
        }

        return table[n]
    }
}