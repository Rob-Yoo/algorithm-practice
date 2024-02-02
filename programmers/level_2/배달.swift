import Foundation

var graph = Array(repeating: Array(repeating: 500001, count: 51), count: 51)

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var floydTable: [[Int]]

    makeGraph(road)
    floydTable = getFloydTable()

    return floydTable[1].filter { $0 <= k }.count
}

func makeGraph(_ roads: [[Int]]) {
    for i in 0..<graph.count {
        graph[i][i] = 0
    }

    for road in roads {
        let (from, to, time) = (road[0], road[1], road[2])
        
        graph[from][to] = min(graph[from][to], time)
        graph[to][from] = graph[from][to]
    } 
}

func getFloydTable() -> [[Int]] {
    var floydTable = graph
    
    for k in 1..<floydTable.count {
        for i in 1..<floydTable.count {
            for j in 1..<floydTable.count {
                floydTable[i][j] = min(floydTable[i][j], floydTable[i][k] + floydTable[k][j])
            }
        }
    }
    
    return floydTable
}