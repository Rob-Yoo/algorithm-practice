import Foundation

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    var (n, a, b) = (n, a, b)
    
    while (true) {
        
        if ((a.isEven && a - 1 == b) || (b.isEven && a + 1 == b) {
            answer += 1
            break
        }
        
        a = a / 2 + (a.isEven ? 0 : 1)
        b = b / 2 + (b.isEven ? 0 : 1)
        answer += 1
    }

    return answer
}