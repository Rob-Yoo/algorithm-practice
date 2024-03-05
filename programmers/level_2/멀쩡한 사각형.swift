import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    
    return Int64(w) * Int64(h) - Int64(w + h - gcd(w, h)) 
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if (b == 0) { return a }
    return gcd(b, a % b)
}