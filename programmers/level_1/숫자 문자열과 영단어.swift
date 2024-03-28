import Foundation

func solution(_ s:String) -> Int {
    var s = s
    let vocabList = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
    
    for i in vocabList.indices {
        s = s.replacingOccurrences(of: vocabList[i], with: String(i))
    }
    
    return Int(s)!
}