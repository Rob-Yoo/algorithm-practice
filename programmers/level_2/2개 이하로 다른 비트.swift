import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var result = [Int64]()

    for number in numbers {
        if (number % 2 == 0) { 
            result.append(number + 1) 
        } else {
            var binaryNumber = ["0"] + String(number, radix: 2).map { String($0) }
            
            for i in stride(from: binaryNumber.count - 1, through: 0, by: -1) {
                if (binaryNumber[i] == "0") {
                    binaryNumber.swapAt(i, i + 1)
                    break
                }
            }
            result.append(Int64(binaryNumber.joined(), radix: 2)!)
        }
    }
    return result
}