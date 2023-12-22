import Foundation

func solution(_ s:String) -> Int{
    var str = Array(s)
    var result: [Character] = []
    let s_len = str.count

    for i in 0..<s_len {
        if !result.isEmpty && result.last == str[i] {
            result.removeLast()
        } else {
            result.append(str[i])
        }
    }
    return result.isEmpty ? 1 : 0
}