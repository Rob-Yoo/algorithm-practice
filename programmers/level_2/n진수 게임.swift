import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var gameString = [String]()
    var result = ""
    var tubeTurnIdx = p - 1
    var t = t
    var number = 0
    
    while (t > 0) {
        while (tubeTurnIdx >= gameString.count) {
            gameString += String(number, radix: n, uppercase: true).map { String($0) }
            number += 1
        }

        result += gameString[tubeTurnIdx]
        t -= 1
        tubeTurnIdx += m
    }
    
    return result
}