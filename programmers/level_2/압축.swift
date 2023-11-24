import Foundation

func solution(_ msg:String) -> [Int] {
    var dictionary = [String: Int]()
    var msg = msg.map { String($0) }
    var result = [Int]()
    var stack = ""
    var idx = 0
    
    for i in 1...26 {
        let alphabet = String(UnicodeScalar(64 + i)!)

        dictionary[alphabet] = i
    }
    
    while (idx < msg.count) {
        let word = msg[idx]
        
        stack += word
        if (dictionary[stack, default: -1] == -1) {
            dictionary[stack] = dictionary.count + 1
            stack.removeLast()
            result.append(dictionary[stack]!)
            stack = ""
        } else {
            idx += 1
        }
    }
    
    result.append(dictionary[stack]!)
    return result
}