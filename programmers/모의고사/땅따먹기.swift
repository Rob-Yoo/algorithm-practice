import Foundation

func solution(_ land:[[Int]]) -> Int{
    var answer = 0
    var table = land
    
    for col in 1..<table.count {
        for row in 0..<4 {
            var maxVal = -1
            
            for i in 0..<4 {
                if (i != row) {
                    maxVal = max(maxVal, table[col - 1][i])
                }
            }
            
            table[col][row] = land[col][row] + maxVal
        }
    }

    return table[table.count - 1].max()!
}