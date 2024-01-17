import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var current: [Int] = []
    var obstacles: [[Int]] = []
    let boundary = (north: 0, south: park.count - 1, west: 0, east: park[0].count - 1)
    
    parsePark(park, &current, &obstacles)
    
    for route in routes {
        let routeArr = route.split(separator: " ").map { String($0) }
        let (direction, distance) = (routeArr[0], Int(routeArr[1])!)
        var willMovePos = current
        
        for _ in 1...distance {

            switch direction {
            case "E" where current[1] + distance <= boundary.east:
                willMovePos[1] += 1
            case "W" where current[1] - distance >= boundary.west:
                willMovePos[1] -= 1
            case "N" where current[0] - distance >= boundary.north:
                willMovePos[0] -= 1
            case "S" where current[0] + distance <= boundary.south:
                willMovePos[0] += 1
            default:
                break
            }

            if (obstacles.contains(willMovePos)) {
                willMovePos = current
                break
            }
        }

        current = willMovePos
    }
    return current
}

func parsePark(_ park: [String], _ current: inout [Int], _ obstacles: inout [[Int]]) {
    let parkMap = park.map { $0.map { String($0) } }
    
    for h in parkMap.indices {
        if let xPos = parkMap[h].firstIndex(where: { $0 == "S" }) {
            current = [h, xPos]
        }
        
        for w in parkMap[h].indices {
            if (parkMap[h][w] == "X") {
                obstacles.append([h, w])
            }
        }
    }
}