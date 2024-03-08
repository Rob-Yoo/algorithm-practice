import Foundation

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var pq = [Int]()
    var n = n
    var enemies = enemy
    
    for (i, enemy) in enemies.enumerated() {
        pq.heappush(enemy)
        if (pq.count > k) {
            let killed = pq.popLast()!
            
            n -= killed
            if (n < 0) {
                return i
            }
        }
    }
    return enemies.count
}

extension Array where Element == Int {
    mutating func heappush(_ element: Int) {
        var left = 0
        var right = self.count - 1
        
        while (left <= right) {
            let mid = (left + right) / 2
            
            if (self[mid] > element) {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        self.insert(element, at: left)
    } 
}