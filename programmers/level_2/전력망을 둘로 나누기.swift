import Foundation

var tree = [[Int]]()

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var result = Int.max

    makeTree(n, wires)
    for wire in wires {
        result = min(result, getResult(n, wire))
    }
    return result
}

func makeTree(_ n: Int, _ wires: [[Int]]) {
    tree = Array(repeating: [Int](), count: n + 1)
    for wire in wires {
        let v1 = wire[0]
        let v2 = wire[1]
        
        tree[v1].append(v2)
        tree[v2].append(v1)
    }
}

func getResult(_ n: Int, _ removedWire: [Int]) -> Int {
    let v1 = removedWire[0]
    let v2 = removedWire[1]
    let numberOfVertex = getNumberOfVertex(v1, v2, n)
    
    return abs((n - numberOfVertex) - numberOfVertex)
}

func getNumberOfVertex(_ v1: Int, _ v2: Int, _ n: Int) -> Int {
    var numberOfVertex = 0
    var visited = Array(repeating: false, count: n + 1)

    func dfs(_ v: Int) {
        visited[v] = true
        numberOfVertex += 1
        
        for vertex in tree[v] {
            if (!visited[vertex] && vertex != v2) {
                dfs(vertex)
            }
        }
    }
    dfs(v1)
    
    return numberOfVertex 
}