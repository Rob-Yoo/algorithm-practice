import Foundation

func solution(_ n:Int) -> Int
{
    var answer = n + 1
    let binaryN = String(n, radix: 2)
    let oneCountOfBinaryN = binaryN.filter { $0 == "1" }.count

    while (true) {
        let binaryNextN = String(answer, radix: 2)
        let oneCountOfBinaryNextN = binaryNextN.filter { $0 == "1" }.count
        
        if (oneCountOfBinaryNextN == oneCountOfBinaryN) {
            break
        } else {
            answer = answer + 1
        }
    }
    
    return answer
}