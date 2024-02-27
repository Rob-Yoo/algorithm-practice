import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var stack: [Int] = []
    var result = 0
    
    for ingr in ingredient {
        stack.append(ingr)
        
        if stack.count < 4 { continue }
        
        if (stack.suffix(4) == ArraySlice([1, 2, 3, 1])) {
            stack.removeLast(4)
            result += 1
        }
    }
    return result
}