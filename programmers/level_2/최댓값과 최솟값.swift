func solution(_ s:String) -> String {
    let s = s.components(separatedBy: " ").sorted { Int($0)! < Int($1)! }
    return s.first! + " " + s.last!
}