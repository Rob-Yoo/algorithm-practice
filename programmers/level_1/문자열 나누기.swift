import Foundation

func solution(_ s:String) -> Int {
    var xCount = 0
    var nonXCount = 0
    var x = Character(" ")
    var result = 0
    
    for (idx, alph) in s.enumerated() {
        if (idx == s.count - 1) {
            result += 1

            continue
        }

        if (xCount == 0) {
            x = alph
            xCount = 1
            
            continue
        }
        
        if (alph == x) {
            xCount += 1
        } else {
            nonXCount += 1
            
            if (xCount == nonXCount) {
                result += 1
                xCount = 0
                nonXCount = 0
            }
        }
    }
    return result
}