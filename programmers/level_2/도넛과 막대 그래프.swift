import Foundation

var degreeInfo = [Int: [Int]]() // [indegree, outdegree]
var graph = Array(repeating: [Int](), count: 1000001)

func solution(_ edges:[[Int]]) -> [Int] {
    var (middleVertex, numberOfDonut, numberOfStick, numberOfEight) = (0, 0, 0, 0)
    
    makeGraph(edges)
    middleVertex = findMiddleVertex()
    for vertex in graph[middleVertex] {
        if (isStickGraph(vertex)) {
            numberOfStick += 1
        } else if (isEightGraph(vertex)) {
            numberOfEight += 1
        } else {
            numberOfDonut += 1
        }
    }
    return [middleVertex, numberOfDonut, numberOfStick, numberOfEight]
}

func makeGraph(_ edges:[[Int]]) {
    for edge in edges {
        let (from, to) = (edge[0], edge[1])
        
        graph[from].append(to)
        degreeInfo[from, default: [0, 0]][1] += 1 // out
        degreeInfo[to, default: [0, 0]][0] += 1  // in
    }
}

func findMiddleVertex() -> Int {
    for (vertex, degree) in degreeInfo {
        let (indegree, outdegree) = (degree[0], degree[1])
        
        if (indegree == 0 && outdegree > 1) {
            for next in graph[vertex] {
                degreeInfo[next]![0] -= 1 // 생성 정점 번호와 연결된 정점들의  indegree 감소
            }
            return vertex
        }
    }
    
    return 0
}

func isStickGraph(_ start: Int) -> Bool {
    var visited = [Int: Bool]()
    var result = false

    func dfs(_ v: Int) {
        visited[v] = true
        
        if (degreeInfo[v]![1] == 0) {
            // outdegree 0이 존재하면 막대 그래프
            result = true
            return
        }
        
        for next in graph[v] {
            if (!visited[next, default: false]) {
                dfs(next)
            }
        }
    }
    
    dfs(start)
    
    return result
}

func isEightGraph(_ start: Int) -> Bool {
    var visited = [Int: Bool]()
    var result = false
    
    func dfs(_ v: Int) {
        visited[v] = true
        
        if (degreeInfo[v]![0] == 2) {
            // indegree 2가 존재하면 막대 그래프
            result = true
            return
        }
        
        for next in graph[v] {
            if (!visited[next, default: false]) {
                dfs(next)
            }
        }
    }
    
    dfs(start)
    
    return result
}