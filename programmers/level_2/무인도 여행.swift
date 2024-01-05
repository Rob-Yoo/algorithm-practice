import Foundation

var visited = Array(repeating: Array(repeating: false, count: 100), count: 100)

func solution(_ maps:[String]) -> [Int] {
    let maps = maps.map { $0.map { String($0) } }
    var result = [Int]()
    let boundary = (left: 0, right: maps[0].count - 1, top: 0, bottom: maps.count - 1)
    
    for i in 0..<maps.count {
        for j in 0..<maps[i].count where (!visited[i][j] && maps[i][j] != "X") {
            let currentLand = (x: j, y: i)
            let totalNumberOfFoodInIsland = computeTotalNumberOfFood(maps, currentLand, boundary)
            result.append(totalNumberOfFoodInIsland)
        }
    }
    
    if (result.isEmpty) {
        result.append(-1)
    }

    return result.sorted(by: <)
}

func computeTotalNumberOfFood(_ maps: [[String]], _ currentLand: (x: Int, y: Int), _ boundary: (left: Int, right: Int, top: Int, bottom: Int)) -> Int {
    var totalNumberOfFood = 0
    
    func searchingFood(_ currentLand: (x: Int, y: Int)) {
        if (currentLand.x < boundary.left || 
            currentLand.x > boundary.right || 
            currentLand.y < boundary.top || 
            currentLand.y > boundary.bottom) {
            return
        }
        if (maps[currentLand.y][currentLand.x] == "X" || visited[currentLand.y][currentLand.x]) {
            return
        }
        
        totalNumberOfFood += Int(maps[currentLand.y][currentLand.x])!
        visited[currentLand.y][currentLand.x] = true
        searchingFood((x: currentLand.x, y: currentLand.y + 1))
        searchingFood((x: currentLand.x, y: currentLand.y - 1))
        searchingFood((x: currentLand.x + 1, y: currentLand.y))
        searchingFood((x: currentLand.x - 1, y: currentLand.y))
    }
    searchingFood(currentLand)
    
    return totalNumberOfFood
}