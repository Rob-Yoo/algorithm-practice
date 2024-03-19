import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var result = ""
    var k = k

    for num in number.map { String($0) } {
        if (result.isEmpty) {
            result += num
        } else {
            var top = String(result.last!).integer
            let current = num.integer

            while (k > 0 && top < current) {
                result.removeLast()
                k -= 1
                if (result.isEmpty) { break }
                top = String(result.last!).integer
            }
            
            result += num
        }
    }
    result.removeLast(k)
    return result
}

extension String {
    var integer: Int {
        return Int(self)!
    }
}