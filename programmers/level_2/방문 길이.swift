import Foundation

func solution(_ dirs:String) -> Int {
    let dirs = dirs.map { String($0) }
    var moveDictionary = [String: Bool]()
    var (x, y) = (0, 0)
    let boundary = (top: 5, bottom: -5, right: 5, left: -5)

    for dir in dirs {
        var (prevX, prevY) = (x, y)

        switch dir {
        case "U" where y < boundary.top:
            y += 1
        case "D" where y > boundary.bottom:
            y -= 1
        case "R" where x < boundary.right:
            x += 1+
        case "L" where x > boundary.left:
            x -= 1
        default:
            break
        }

        if (prevX == x && prevY == y) {
            continue
        } 
        if (!moveDictionary["\(prevX)\(prevY)\(x)\(y)", default: false]) {
            moveDictionary["\(prevX)\(prevY)\(x)\(y)"] = true
        }
        if (!moveDictionary["\(x)\(y)\(prevX)\(prevY)", default: false]) {
            moveDictionary["\(x)\(y)\(prevX)\(prevY)"] = true
        }
    }
    
    return moveDictionary.count / 2
}