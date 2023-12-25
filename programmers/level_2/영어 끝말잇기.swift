import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var result = [0, 0]
    var lastCharacter = words[0].last!
    var wordDictionary = [String: Bool]()

    wordDictionary[words[0]] = true

    for i in 1..<words.count {
        var word = words[i]
        var firstCharacter = word.first!
        var (order, round) = ( (i % n) + 1, (i / n) + 1 )
        
        if let isDuplicated = wordDictionary[word] {
            return [order, round]
        } else if (lastCharacter != firstCharacter) {
            return [order, round]
        } else {
            wordDictionary[word] = true
            lastCharacter = word.last!     
        }
    }
    
    return result
}