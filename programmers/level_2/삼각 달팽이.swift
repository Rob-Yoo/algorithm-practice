import Foundation

var number = 1
var snail = [[Int]]()

func solution(_ n:Int) -> [Int] {
    (1...n).forEach { snail.append(Array(repeating: 0, count: $0)) }
    for i in 0..<n {
        let round = i / 3 + 1

        if (i % 3 == 0) {
            // 왼쪽 채우기
            fillLeft(round - 1, (round - 1) * 2, n)
        } else if (i % 3 == 1) {
            // 아래 채우기
            fillBottom(n - round)
        } else {
            // 오른쪽 채우기
            fillRight(round, n - 1, (round - 1) * 2 + 1)
        }
    }
    return snail.flatMap { $0 }
}

func fillLeft(_ row: Int, _ start: Int, _ end: Int) {
    for col in start..<end {
        if (snail[col][row] == 0) {
            snail[col][row] = number
            number += 1
        }
    }
}

func fillBottom(_ col: Int) {
    let end = snail[col].count

    for row in 0..<end {
        if (snail[col][row] == 0) {
            snail[col][row] = number
            number += 1
        }
    }
}

func fillRight(_ round: Int, _ start: Int, _ end: Int) {
    for col in stride(from: start, through: end, by: -1) {
        let row = snail[col].count - round

        if (snail[col][row] == 0) {
            snail[col][row] = number
            number += 1
        }
    }
}