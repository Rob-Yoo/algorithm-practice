import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var k = k
    var answer = 0
    var visited = Array(repeating: false, count: 8)

    func explore(_ dungeon: [Int], _ depth: Int) {
        answer = max(answer, depth)
        
        for (i, dungeon) in dungeons.enumerated() {
            if (!visited[i] && k >= dungeon[0]) {
                visited[i] = true
                k -= dungeon[1]
                explore(dungeon, depth + 1)
                visited[i] = false
                k += dungeon[1]
            }
        }
    }

    explore([], 0)
    
    return answer
}