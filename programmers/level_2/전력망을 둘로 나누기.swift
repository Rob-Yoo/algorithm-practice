import Foundation

var graph = Array(repeating: [Int](), count: 101)

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var result = Int.max

    makeGraph(wires)
    for wire in wires {
        let numberOfTowers = splitWire(n, wire)
        let numberOfOtherTowers = n - numberOfTowers
        
        result = min(result, abs(numberOfTowers - numberOfOtherTowers))
    }
    
    return result
}

func makeGraph(_ wires:[[Int]]) {
    for wire in wires {
        let (v1, v2) = (wire[0], wire[1])
        
        graph[v1].append(v2)
        graph[v2].append(v1)
    }
}

func splitWire(_ n: Int, _ wire: [Int]) -> Int {
    var count = 0
    var visited = Array(repeating: false, count: n + 1)
    let (from, to) = (wire[0], wire[1])
    
    func dfs(_ v: Int) {
        visited[v] = true
        count += 1
        
        for next in graph[v] {
            if (!visited[next] && next != to) {
                dfs(next)
            }
        }
    }
    
    dfs(from)
    
    return count
}