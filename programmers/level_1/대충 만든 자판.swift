import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var twoDimensionKeymap = keymap.map { $0.map { String($0) } }
    var twoDimensionTargets = targets.map { $0.map { String($0) } }
    var keymapDictionary = [String: Int]()
    var result = [Int]()
    
    for keys in twoDimensionKeymap {
        for (idx, key) in keys.enumerated() {
            guard let minTabCount = keymapDictionary[key] else { 
                keymapDictionary[key] = idx + 1
                continue 
            }
            
            keymapDictionary[key] = min(minTabCount, idx + 1)
        }
    }
    
    for target in twoDimensionTargets {
        var sum = 0
        var hasNotFound = false
        for key in target {
            guard let minTabCount = keymapDictionary[key] else {
                result.append(-1)
                hasNotFound = true
                break
            }
            
            sum = sum + minTabCount
        }
        if (!hasNotFound) {
            result.append(sum)
        }
    }
    return result
}