import Foundation

struct Stack {
    private var array = [Int]()
    
    var count: Int { return array.count }
    var isEmtpy: Bool { return array.isEmpty }
    var top: Int? { return array.last }
    
    mutating func push(_ element: Int) {
        self.array.append(element)
    }
    
    mutating func pop() -> Int? {
        return self.array.popLast()
    }
}

var boards = Array(repeating: Stack(), count: 31)
var bucket = Stack()

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var result = 0

    parseBoard(board)
    for move in moves {
        guard let doll = boards[move].pop() else { continue }
        
        if let topOfBucket = bucket.top, topOfBucket == doll {
            let _ = bucket.pop()
            result += 2
            continue
        }
        
        bucket.push(doll)
    }
    return result
}
    

func parseBoard(_ board:[[Int]]) {
    for i in stride(from: board.count - 1, through: 0, by: -1) {
        for j in 0..<board[i].count {
            let boardNum = j + 1
            let doll = board[i][j]

            if (doll > 0) {
                boards[boardNum].push(doll)
            } 
        }
    }
}