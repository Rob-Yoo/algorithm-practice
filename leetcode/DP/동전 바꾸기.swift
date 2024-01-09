import Foundation

class Solution {
    var table = Array(repeating: 0, count: 10001)

    func coinChange(_ coins: [Int], _ amount: Int) -> Int {

        if (amount > 0) {
            for i in 1...amount {
                let minCoinCount = getMinCoinCount(coins, i)
                table[i] = minCoinCount + 1 // -1 or minCointCount + 1
            }
        }

        return table[amount]
    }

    func getMinCoinCount(_ coins: [Int], _ amount: Int) -> Int {
        var minCoinCount = Int.max

        for coin in coins {
            if (amount >= coin && table[amount - coin] != -1) {
                minCoinCount = min(minCoinCount, table[amount - coin])
            }
        }

        return minCoinCount == Int.max ? -2 : minCoinCount
    }
}