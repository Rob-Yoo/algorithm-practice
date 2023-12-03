import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var answer:Int = 0
    var table = board
    
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if (board[i][j] == 1) {
                if (i > 0 && j > 0) {
                    table[i][j] = min(table[i][j - 1], table[i - 1][j], table[i - 1][j - 1]) + 1                 
                }
                answer = max(answer, table[i][j])
            }
        }
    }

    return answer * answer
}