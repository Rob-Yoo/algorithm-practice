import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var number = number.map { String($0) }
    var k = k
    var stack = ""
    
    for i in number.indices {
        while (!stack.isEmpty && String(stack.last!) < number[i]) {
            if (k > 0) {
                stack.removeLast()
                k -= 1
            } else {
                break
            }
        }
        stack += number[i]
    }
    while (stack.count > number.count - k) {
        stack.removeLast()
    }
    
    return stack
}