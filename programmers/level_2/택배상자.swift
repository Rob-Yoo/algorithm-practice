import Foundation

struct Stack {
    private var stack = [Int]()
    
    var count: Int { return stack.count }
    var isEmpty: Bool { return stack.isEmpty }
    var top: Int { 
        stack.isEmpty ? 0 : stack.last!
    }
    
    mutating func push(_ element: Int) {
        stack.append(element)
    }
    
    mutating func pop() -> Int? {
        return stack.popLast()
    }
}

func solution(_ order:[Int]) -> Int {
    var subBelt = Stack()
    var mainBeltPackage = 1
    var result = 0
    
    for orderPackage in order {
        while (mainBeltPackage <= orderPackage) {
            subBelt.push(mainBeltPackage)
            mainBeltPackage += 1
        }

        if (subBelt.top == orderPackage) {
            let _ = subBelt.pop()
            result += 1
        } else {
            break
        }
    }
    return result
}