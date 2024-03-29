import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var (losts, reserves) = (Set<Int>(), Set<Int>())
    var stack = [Int]()

    lost.filter { !reserve.contains($0) }.forEach { losts.insert($0) }
    reserve.filter { !lost.contains($0) }.forEach { reserves.insert($0) }
    
    for student in 1...n {
        if (stack.isEmpty) {
            stack.append(student)
        } else {
            let left = stack.last!
            
            if (losts.contains(student) && reserves.contains(left)) {
                losts.remove(student)
                reserves.remove(left)
            } else if (losts.contains(left)) {
                if (reserves.contains(student)) {
                    losts.remove(left)
                    reserves.remove(student)
                } else {
                    stack.removeLast()
                }
            }
            
            stack.append(student)
        }
    }
    
    
    return losts.contains(stack.last!) ? stack.count - 1 : stack.count
}