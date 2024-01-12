import Foundation

func solution(_ s:String) -> [Int] {
    var sDictionary = [Int: Int]()
    var result = [Int]()
    var number = ""
    
    for char in s {
        if (char.isNumber) {
            number += String(char)
        } else if (char == Character(",")) {
            sDictionary[Int(number)!, default: 0] += 1
            number = ""
        }
    }
     sDictionary[Int(number)!, default: 0] += 1
    
    
    for element in sDictionary.sorted { $0.value > $1.value } {
        result.append(element.key)
    }
    
    return result
}