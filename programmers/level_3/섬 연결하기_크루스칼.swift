import Foundation

var disjointSet = (0...99).map { $0 }

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var result = 0
    var costs = costs.sorted { $0[2] < $1[2] }
    
    for cost in costs {
        let (from, to, money) = (cost[0], cost[1], cost[2])
        let r1 = findRoot(from)
        let r2 = findRoot(to)
        
        if (r1 != r2) {
            union(r1, r2)
            result += money
        }
    }
    return result
}

func findRoot(_ vertex: Int) -> Int {
    var root = vertex
    
    while disjointSet[root] != root {
        root = disjointSet[root]
    }
    
    return root
}

func union(_ v1: Int, _ v2: Int) {
    if (v1 < v2) {
        disjointSet[v2] = v1
    } else {
        disjointSet[v1] = v2
    }
}