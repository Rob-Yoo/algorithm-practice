import Foundation

typealias House = (numberOfPackage: Int, number: Int)

struct Stack {
    var array = [House]()
    
    var count: Int { return array.count }
    var isEmpty: Bool { return array.isEmpty }
    var top: House { 
        if (isEmpty) {
            return (numberOfPackage: 0, number: 0)
        } else {
            return array.last!
        }
    }
    
    mutating func push(_ element: House) { array.append(element) }
    mutating func pop() -> House? { return array.popLast() }
}

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var result: Int64 = 0
    var (dStack, pStack) = (Stack(), Stack())
    
    deliveries.enumerated().forEach { 
        if ($1 != 0) {
            dStack.push((numberOfPackage: $1, number: $0 + 1))
        }
    }
    pickups.enumerated().forEach {
        if ($1 != 0) {
            pStack.push((numberOfPackage: $1, number: $0 + 1))
        }
    }
    
    while(!dStack.isEmpty || !pStack.isEmpty) {
        let maxD = dStack.top.number
        let maxP = pStack.top.number
        let maxVal = max(maxD, maxP)
        
        result += Int64(maxVal) * 2
        
        var dCap = cap
        while(!dStack.isEmpty && dCap > 0) {
            let (packageCount, number) = dStack.pop()!
            
            dCap -= packageCount
            if (dCap < 0) {
                dStack.push((numberOfPackage: -dCap, number: number))
            }
        }
        
        var pCap = cap
        while(!pStack.isEmpty && pCap > 0) {
            let (packageCount, number) = pStack.pop()!
            
            pCap -= packageCount
            if (pCap < 0) {
                pStack.push((numberOfPackage: -pCap, number: number))
            }
        }
    }
    
    return result
}