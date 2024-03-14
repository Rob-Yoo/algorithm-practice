import Foundation

typealias Position = (x: Int, y: Int)
typealias Path = (pos: Position, object: String, time: Int)

var startPath = (pos: (x: 0, y: 0), object: "S", time: 0)
var leverPath = (pos: (x: 0, y: 0), object: "L", time: 0)

struct Queue {
    var array = [Path?]()
    var head = 0
    
    var count: Int { return array.count - head }
    var isEmpty: Bool { return count == 0 }
    
    mutating func enqueue(_ element: Path) {
        self.array.append(element)
    }
    
    mutating func dequeue() -> Path? {
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


func solution(_ maps:[String]) -> Int {
    let maps = maps.map { $0.map { String($0) } }
    let minPathToLever: Int
    let minPathToExit: Int
    
    findStartAndLeverPosition(maps)
    
    minPathToLever = getMinPath(startPath, "L", maps)
    if (minPathToLever == -1) { return -1 }
    
    minPathToExit = getMinPath(leverPath, "E", maps)
    if (minPathToExit == -1) { return -1 }
    
    return minPathToLever + minPathToExit
}


func findStartAndLeverPosition(_ maps: [[String]]) {
    for i in 0..<maps.count {
        for j in 0..<maps[i].count {
            if (maps[i][j] == "S") {
                startPath = (pos: (x: j, y:i), object: "S", time: 0)
            }
            
            if (maps[i][j] == "L") {
                leverPath = (pos: (x: j, y:i), object: "L", time: 0)
            }
        }
    }
}

func getMinPath(_ start: Path, _ end: String, _ maps: [[String]]) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
    var queue = Queue()
    let bound = (west: 0, north: 0, east: maps[0].count - 1, south: maps.count - 1)
    
    queue.enqueue(start)
    while(!queue.isEmpty) {
        let path = queue.dequeue()!
        let dx = [0, 0, 1, -1]
        let dy = [1, -1, 0, 0]
        
        if (path.object == end) {
            return path.time
        }
        
        for i in 0..<4 {
            let nx = path.pos.x + dx[i]
            let ny = path.pos.y + dy[i]
            
            if (nx < bound.west || nx > bound.east || ny < bound.north || ny > bound.south) { continue }
            if (maps[ny][nx] == "X") { continue }
            
            if(!visited[ny][nx]) {
                let nextPath = (pos: (x: nx, y: ny), object: maps[ny][nx], time: path.time + 1)
                
                visited[ny][nx] = true
                queue.enqueue(nextPath)
            }
        }
    }
    
    return -1
}
