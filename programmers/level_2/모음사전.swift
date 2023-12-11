import Foundation

func solution(_ word:String) -> Int {
    var result = 0
    var isFound = false

    func findOrder(_ str: String) {
        if (isFound) {
            return
        }
        
        if (!str.isEmpty) {
            result += 1
        }
        
        
        if (str == word) {
            isFound = true
            return
        } else if (str.count == 5) {
            return
        }
        
        findOrder(str + "A")
        findOrder(str + "E")
        findOrder(str + "I")
        findOrder(str + "O")
        findOrder(str + "U")
    }
    
    findOrder("")
    
    return result
}