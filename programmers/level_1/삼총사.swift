import Foundation

func solution(_ number:[Int]) -> Int {
    var count = 0
    for i in 0..<number.count-2{
        for j in i+1..<number.count-1{
           for p in j+1..<number.count{
               if number[i] + number[j] + number[p] == 0 {
                   count += 1
               }
           }
        }
    }
    return count
}