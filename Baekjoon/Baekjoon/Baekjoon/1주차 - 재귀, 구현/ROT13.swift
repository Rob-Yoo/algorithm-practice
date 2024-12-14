//
//  ROT13.swift
//  Baekjoon
//
//  Created by Jinyoung Yoo on 12/14/24.
//

//let chars = readLine()!.map { $0 }
//var result = ""
//
//for char in chars {
//    if !char.isLetter {
//        result += String(char)
//    } else {
//        let ascii = Unicode.Scalar(String(char))!.value
//        let rot13Ascii = ascii + 13
//        let start = Unicode.Scalar(char.isLowercase ? "a" : "A").value
//        let end = Unicode.Scalar(char.isLowercase ? "z" : "Z").value
//        let final: String
//        
//        if (rot13Ascii > end) {
//            let diff = rot13Ascii - end
//            let finalAscii = start + diff - 1
//            final = String(Unicode.Scalar(finalAscii)!)
//        } else {
//            final = String(Unicode.Scalar(rot13Ascii)!)
//        }
//        result += final
//    }
//}
//
//print(result)
