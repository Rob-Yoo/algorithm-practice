import Foundation

func solution(_ s:String) -> Int {
    var count = 0

    for i in 0..<s.count {
        var stack = [Character]()
        let arr = Array(s)
        let rotated = arr[i..<s.count] + arr[0..<i]
        var isCorrect = true

        for ch in rotated {
            if ch == "(" || ch == "[" || ch == "{" {
                stack.append(ch)
            } else {
                if stack.isEmpty {
                    isCorrect = false
                    break
                }
                let last = stack.last!
                if (ch == ")" && last == "(") || (ch == "]" && last == "[") || (ch == "}" && last == "{") {
                    stack.removeLast()
                } else {
                    isCorrect = false
                    break
                }
            }
        }
        if stack.isEmpty && isCorrect {
            count += 1
        }
    }
    return count
}