import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var result: Int64 = 0

    for x in stride(from: 0, through: d, by: k) {
        let maxY = Int64(sqrt(pow(Double(d), 2) - pow(Double(x), 2)))
        let yCnt = maxY / Int64(k)
        result += (yCnt + 1)
    }
    return result
}