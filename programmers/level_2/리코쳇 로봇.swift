import Foundation

typealias Movement = (x: Int, y: Int, count: Int)

struct Queue<T> {
    var array = [T?]()
    var head = 0
    
    var count: Int { return array.count - head }
    var isEmpty: Bool { return count == 0 }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        if (head > 50) {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
}

func solution(_ board:[String]) -> Int {
    var board = board.map { $0.map { String($0) } }
    var initialPosition = (x: 0, y: 0, count: 0)
    var result: Int
    
    findInitialPostion(board, &initialPosition)
    result = findMinMovement(board, initialPosition)
    
    return result
}

func findInitialPostion(_ board: [[String]], _ initialPosition: inout Movement) {
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if (board[i][j] == "R") {
                initialPosition = (x: j, y: i, count: 0)
            }
        }
    }
}

func findMinMovement(_ board: [[String]], _ initialPosition: Movement) -> Int {
    var queue = Queue<Movement>()
    var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]

    queue.enqueue(initialPosition)
    while(!queue.isEmpty) {
        let object = queue.dequeue()!

        if (board[object.y][object.x] == "G") {
            return object.count
        }
        
        for (x, y) in zip(dx, dy) {
            var (willMoveX, willMoveY) = (object.x, object.y)
            var (nx, ny) = (object.x, object.y)

            while true {
                willMoveX += x
                willMoveY += y
                
                if (willMoveX < 0 || willMoveX >= board[0].count || willMoveY < 0 || willMoveY >= board.count || board[willMoveY][willMoveX] == "D") {
                    break
                }
                (nx, ny) = (willMoveX, willMoveY)
            }
            
            if (!visited[ny][nx]) {
                let newMove = (x: nx, y: ny, count: object.count + 1)
                
                visited[ny][nx] = true
                queue.enqueue(newMove)
            }
        }
    }
    
    return -1
}