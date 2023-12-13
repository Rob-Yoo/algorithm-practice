import Foundation

struct Stack<T> {
    var stack = [T]()
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    var count: Int {
        return stack.count
    }
    
    var top: T? {
        return stack.last
    }
    
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func pop() -> T? {
        return stack.popLast()
    }
}

func solution(_ numbers:[Int]) -> [Int] {
    var numberStack = Stack<(idx: Int, number: Int)>()
    var result = Array(repeating: -1, count: numbers.count)
    
    for (i, number) in numbers.enumerated() {
        if (numberStack.isEmpty || numberStack.top!.number >= number) {
            numberStack.push((idx: i, number: number))
        } else {
            var topData = numberStack.top

            while (topData != nil && topData!.number < number) {
                result[topData!.idx] = number
                numberStack.pop()
                topData = numberStack.top
            }
            numberStack.push((idx: i, number: number))
        }
    }

    return result
}