import Foundation

typealias Edge = (dest: Int, time: Int)

var graph = Array(repeating: [Edge](), count: 51)

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var visited = [Int: Bool]()
    var dijkstraTable = Array(repeating: Int.max, count: N + 1)
    var pq = [Edge]()
    
    makeGraph(road)
    dijkstraTable[1] = 0
    pq.enqueue((dest: 1, time: 0))
    while(!pq.isEmpty) {
        let road = pq.dequeue()!
        let (current, deliveryTime) = (road.dest, road.time)
        
        if (visited[current, default: false]) { continue }
        visited[current] = true
        
        for edge in graph[current] {
            let (next, time) = (edge.dest, edge.time)
            
            if (dijkstraTable[next] > deliveryTime + time) {
                dijkstraTable[next] = deliveryTime + time
                pq.enqueue((dest: next, time: dijkstraTable[next]))
            }
        }
    }
    
    return dijkstraTable.filter { $0 <= k }.count
}

func makeGraph(_ roads: [[Int]]) {
    for road in roads {
        let (from, to, time) = (road[0], road[1], road[2])
        
        graph[from].append((dest: to, time: time))
        graph[to].append((dest: from, time: time))
    }
}

extension Array where Element == Edge {
    mutating func enqueue(_ element: Edge) {
        if (self.isEmpty) {
            self.append(element)
        } else {
            var left = 0
            var right = self.count - 1
            
            while(left <= right) {
                let mid = (left + right) / 2
                
                if (self[mid].time > element.time) {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            
            self.insert(element, at: left)
        }
    }
    
    mutating func dequeue() -> Edge? {
        return self.popLast()
    }
}