import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var numberOfTangerineBySize = [Int: Int]()
    var k = k
    var result = 0
    
    tangerine.forEach {
        numberOfTangerineBySize[$0, default: 0] += 1
    }
    
    for tangerine in numberOfTangerineBySize.sorted { $0.value > $1.value } {
        let numberOfTangerine = tangerine.value
        
        if (k - numberOfTangerine > 0) {
            result += 1
            k -= numberOfTangerine
        } else {
            result += 1
            break
        }
    }
    
    return result
}