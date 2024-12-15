//
//  한국이 그리울 땐 서버에 접속하지.swift
//  Baekjoon
//
//  Created by Jinyoung Yoo on 12/15/24.
//

//let N = Int(readLine()!)!
//let pattern = readLine()!.map { String($0) }
//var files = [[String]]()
//
//for _ in 0..<N {
//    let file = readLine()!.map { String($0) }
//    files.append(file)
//}
//
//func solution(_ file: [String]) {
//    let starIdx = pattern.firstIndex(of: "*")!
//    let patternPrefix = pattern.prefix(starIdx)
//    let patternSuffix = pattern.suffix((pattern.count - 1) - starIdx)
//    let filePrefix = file.prefix(starIdx)
//    let fileSuffix = file.suffix((pattern.count - 1) - starIdx)
//    
//    if (file.count < prefix.count + suffix.count) {
//        print("NE")
//    } else if (patternPrefix == filePrefix && patternSuffix == fileSuffix) {
//        print("DA")
//    } else {
//        print("NE")
//    }
//}
//
//files.forEach { solution($0) }
