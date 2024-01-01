import Foundation

func solution(_ n:Int) -> Int 
{
    var ans = 0
    var n = n
    
    while (n != 1) {
        let remainder = n % 2
        
        if (remainder == 1) {
            ans += 1
        }
        n /= 2
    }

    return ans + 1
}