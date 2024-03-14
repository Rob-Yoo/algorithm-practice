import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var count = 0
    var stack = [Int]()

    for move in moves {
        let doll = pickUpDoll(&board, move - 1)
        
        if (doll == 0 ) { continue }
        
        if (stack.isEmpty) {
            stack.append(doll)
        } else {
            let top = stack.last!
            
            if (top == doll) {
                stack.removeLast()
                count += 2
            } else {
                stack.append(doll)
            }
        }
    }
    
    return count
}

func pickUpDoll(_ board: inout [[Int]], _ row: Int) -> Int {
    for i in 0..<board.count {
        if (board[i][row] != 0) {
            let doll = board[i][row]
            
            board[i][row] = 0
            return doll 
        }
    }
    
    return 0
}