import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var receivedCoke = (n / a) * b
    var notDrinkingCoke = n % a
    var result = 0
    
    while (receivedCoke != 0) {
				let emptyCoke = receivedCoke + notDrinkingCoke

        result += receivedCoke  
        receivedCoke = (emptyCoke / a) * b
        notDrinkingCoke = emptyCoke % a
    }
    
    return result
}