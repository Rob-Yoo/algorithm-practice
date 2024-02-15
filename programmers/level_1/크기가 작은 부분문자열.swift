import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var result = 0
    
    for idx in 0..<t.count - (p.count - 1) {
        let startIndex = t.index(t.startIndex, offsetBy: idx)
        let endIndex = t.index(startIndex, offsetBy: p.count)
        let substring = t[startIndex..<endIndex]
        
        if (Int(substring)! <= Int(p)!) {
            result += 1
        }
    }
    
    return result
}