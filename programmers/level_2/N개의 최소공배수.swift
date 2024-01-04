func solution(_ arr:[Int]) -> Int {
    var sortedArr = arr.sorted(by: <)
    
    return sortedArr.reduce(1) { lcm($0, $1) }
}

func lcm(_ a : Int, _ b: Int) -> Int {
    return (a * b) / gcd(a, b)
}

func gcd(_ a: Int, _ b: Int) -> Int {
    var (a, b) = (a, b)
    
    while (b != 0) {
        var r = a % b
        a = b
        b = r
    }
    
    return a
}