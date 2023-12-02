import Foundation

func solution(_ v: [[Int]]) -> [Int]
{
    var v = v.flatMap { $0 }
    var x = 0, y = 0

    for (i, j) in zip(stride(from: 0, to: v.count, by: 2), stride(from: 1, to: v.count, by: 2)){
        x ^= v[i]
        y ^= v[j]
    }

    return [x, y]
}