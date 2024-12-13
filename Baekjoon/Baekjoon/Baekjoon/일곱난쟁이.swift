//
//  일곱난쟁이.swift
//  Baekjoon
//
//  Created by Jinyoung Yoo on 12/13/24.
//

var heights = [Int]()

for _ in 1...9 {
    let input = Int(readLine()!)!
    heights.append(input)
}

let totalHeights = heights.reduce(0, +)
let overHeight = totalHeights - 100

func solve() {
    for i in 0..<(heights.count - 1) {
        for j in (i + 1)..<heights.count {
            if ((overHeight - heights[i]) == heights[j]) {
                heights.remove(at: i)
                heights.remove(at: j - 1)
                return
            }
        }
    }
}

solve()
heights.sorted().forEach { print($0) }
