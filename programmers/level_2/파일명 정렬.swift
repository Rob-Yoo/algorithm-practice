import Foundation

func solution(_ files:[String]) -> [String] {
    var filesDictionary = [String: (idx: Int, head: String, number: String)]()
    var result = [String]()
    
    for (i, file) in files.enumerated() {
        // HEAD 구하기
        let borderIndexOfHeadAndNumber = file.firstIndex { $0.isNumber }!
        let head = file[file.startIndex..<borderIndexOfHeadAndNumber]
        // NUMBER 구하기
        let fileRemovedHead = file[borderIndexOfHeadAndNumber..<file.endIndex]
        let borderIndexOfNumberAndTail = fileRemovedHead.firstIndex { !$0.isNumber } ?? fileRemovedHead.endIndex
        let number = file[borderIndexOfHeadAndNumber..<borderIndexOfNumberAndTail]
        
        filesDictionary[file] = (idx: i, head: String(head).lowercased(), number: String(number))
    }
    
    let sortedFilesDictionary = filesDictionary.sorted { 
        if ($0.value.head == $1.value.head) {
            let num1 = Int($0.value.number)!
            let num2 = Int($1.value.number)!
            
            if (num1 == num2) {
                return $0.value.idx < $1.value.idx
            } else {
                return num1 < num2
            }
        } else {
            return $0.value.head < $1.value.head
        }
    }
    
    for (key, _) in sortedFilesDictionary {
        result.append(key)
    }

    return result
}