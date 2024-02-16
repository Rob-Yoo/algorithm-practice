import Foundation

func solution(_ s:String) -> [Int] {
    var indexInfoDict: [Character: Int] = [:]
    var result: [Int] = []
    
    for idx in 0..<s.count {
        let strIdx =  String.Index(encodedOffset: idx)
        
        if let indexInfo = indexInfoDict[s[strIdx]] {
            result.append(idx - indexInfo)
            indexInfoDict[s[strIdx]] = idx
        } else {
            indexInfoDict[s[strIdx]] = idx
            result.append(-1)
        }
    }
    return result
}