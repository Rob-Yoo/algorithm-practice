import Foundation

typealias Edge = (dest: Int, cost: Int)

var graph = [[Edge]]()
var primTable = [Int]()

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    graph = Array(repeating: [Edge](), count: n)
    makeGraph(costs)
    
    primTable = Array(repeating: 0, count: n)
    prim()

    return primTable.reduce(0) { $0 + $1 }
}

func makeGraph(_ costs: [[Int]]) {
    for cost in costs {
        let (from, to, money) = (cost[0], cost[1], cost[2])
        
        graph[from].append((dest: to, cost: money))
        graph[to].append((dest: from, cost: money))
    }
}

func prim() {
    var visited = Array(repeating: false, count: primTable.count)
    var pq = [Edge]()
    
    pq.push((dest: 0, cost: 0))
    while (!pq.isEmpty) {
        let (current, cost) = pq.popLast()!

        if (visited[current]) { continue }
        
        visited[current] = true
        primTable[current] = cost
        for edge in graph[current] {
            pq.push(edge)
        }
    }
}

extension Array where Element == Edge {
    mutating func push(_ element: Edge) {
        if (self.isEmpty) {
            self.append(element)
        } else {
            var left = 0
            var right = self.count - 1
            
            while left <= right {
                let mid = (left + right) / 2
                
                if (self[mid].cost > element.cost) {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            self.insert(element, at: left)
        }
    }
}