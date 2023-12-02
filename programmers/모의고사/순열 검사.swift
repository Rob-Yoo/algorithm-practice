import Foundation

func solution(_ arr:[Int]) -> Bool {
    var answer = true

    for (i, num) in arr.sorted().enumerated() {
        if i + 1 != num {
            return false
        }
    }

    return answer
}