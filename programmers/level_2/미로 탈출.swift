import Foundation

typealias Position = (x: Int, y: Int, distance: Int)

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

func solution(_ maps:[String]) -> Int {
    let maps = maps.map { $0.map { String($0) } }
    var startPosition = (x: 0, y: 0, distance: 0)
    var leverPosition = (x: 0, y: 0, distance: 0)
    var path1: Int
    var path2: Int
    
    findStartAndLeverPosition(maps, &startPosition, &leverPosition)
    path1 = findMinDistance(startPosition, "L", maps)
    path2 = findMinDistance(leverPosition, "E", maps)
    
    if (path1 == -1 || path2 == -1) {
        return -1
    }
    
    return path1 + path2
}

func findStartAndLeverPosition(_ maps: [[String]], _ startPosition: inout Position, _ leverPosition: inout Position) {
    for i in 0..<maps.count {
        for j in 0..<maps[0].count {
            if (maps[i][j] == "S") {
                startPosition = (x: j, y: i, distance: 0)
            } else if (maps[i][j] == "L") {
                leverPosition = (x: j, y: i, distance: 0)
            }
        }
    }
}

func findMinDistance(_ start: Position, _ end: String, _ maps: [[String]]) -> Int {
    var queue = Queue<Position>()
    var visited = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]

    queue.enqueue(start)
    while (!queue.isEmpty) {
        let object = queue.dequeue()!
        
        if (maps[object.y][object.x] == end) {
            return object.distance
        }
        
        for (x, y) in zip(dx, dy) {
            let nx = object.x + x
            let ny = object.y + y
            
            if (0 <= nx && nx < maps[0].count && 0 <= ny && ny < maps.count && maps[ny][nx] != "X") {
                if (!visited[ny][nx]) {
                    let next = (x: nx, y: ny, distance: object.distance + 1)

                    visited[ny][nx] = true
                    queue.enqueue(next)
                }
            }
        }
    }
    
    return -1
}