import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var answer = 0
    var board = board
    
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            let num = board[i][j]
            
            if (i == 0 || j == 0) { 
                answer = max(answer, num)
            } else if (num == 1) {
                let topLeft = board[i - 1][j - 1]
                let top = board[i - 1][j]
                let left = board[i][j - 1]
                let area = min(topLeft, top, left) + 1
                
                board[i][j] = area
                answer = max(answer, area)
            }
            
        }
    }

    return answer * answer
}