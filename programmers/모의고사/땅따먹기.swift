import Foundation

func solution(_ land:[[Int]]) -> Int{
    var table = Array(repeating: Array(repeating: 0, count: 4), count: land.count)
    
    for i in 0..<4 {
        table[0][i] = land[0][i]
    }
    for i in 1..<land.count {
        for j in 0..<4 {
            for k in 0..<4 {
                if (j == k) { continue }
                var tableValue = table[i - 1][k]
                table[i][j] = max(table[i][j], land[i][j] + tableValue)
            }
        }
    }
    
    return table[land.count - 1].max()!
}