import Foundation

func solution(_ n:Int) -> [[Int]] {
    var result = [[Int]]()
    
    func hanoi(_ n: Int, _ start: Int, _ sub: Int, _ end: Int) {
        if (n == 1) {
            result.append([start, end])
        } else {
            hanoi(n - 1, start, end, sub)
            result.append([start, end])
            hanoi(n - 1, sub, start, end)
        }
    }
    hanoi(n, 1, 2, 3)
    return result
}