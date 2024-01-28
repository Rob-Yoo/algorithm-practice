import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    
    var minX = 100
    var maxX = -1
    var minY = 100
    var maxY = -1
    
    for y in wallpaper.indices {
        let line = wallpaper[y].map { String($0) }
        for x in line.indices {
            if (line[x] == "#") {
                minX = min(minX, x)
                maxX = max(maxX, x)
                minY = min(minY, y)
                maxY = max(maxY, y)
            }
        }
    }
    
    return [minY, minX, maxY + 1, maxX + 1]
}