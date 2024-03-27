import Foundation

func solution(_ n:Int) -> Int {
    let three = String(n, radix: 3).map { String($0) }
    var result: Double = 0.0

    for i in 0..<three.count {
        let pw = Double(i)
        let num = Double(three[i])!
        result += num * pow(3.0, pw)
    }

    return Int(result)
}