import Foundation

func solution(_ babbling:[String]) -> Int {
    var availableWords = ["aya", "ye", "woo", "ma"]
    var count = 0

    for word in babbling {
        let wordArray = word.map{ String($0) }
        var lastWord = ""
        var stack = ""
        
        for alph in wordArray {
            stack += alph

            if (stack.count == 4) {
                break
            } else if (availableWords.contains(stack)) {
                if (lastWord == stack) { break }
                lastWord = stack
                stack = ""
            }
        }
        
        if (stack.isEmpty) {
            count += 1
        }
    }
    
    return count
}