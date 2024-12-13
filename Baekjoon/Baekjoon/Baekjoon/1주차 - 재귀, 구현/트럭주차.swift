//
//  트럭주차.swift
//  Baekjoon
//
//  Created by Jinyoung Yoo on 12/13/24.
//

let parkingFee = readLine()!.split(separator: " ").map { Int($0)! }
let (A, B, C) = (parkingFee[0], parkingFee[1], parkingFee[2])
var truckCountPerMinute = Array(repeating: 0, count: 101)
var result = 0

for _ in 1...3 {
    let timeInfo = readLine()!.split(separator: " ").map { Int($0)! }
    for time in (timeInfo[0] + 1)...timeInfo[1] {
        truckCountPerMinute[time] += 1
    }
}

for truckCount in truckCountPerMinute {
    if (truckCount == 1) {
        result += A
    } else if (truckCount == 2) {
        result += (B * 2)
    } else if (truckCount == 3) {
        result += (C * 3)
    }
}

print(result)
