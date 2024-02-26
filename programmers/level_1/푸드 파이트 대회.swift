import Foundation

func solution(_ food:[Int]) -> String {
    var leftPlayer = [Int]()
    var rightPlayer = [Int]()
    var result = ""

    for foodNumber in 1..<food.count {
        let amountOfFood = food[foodNumber] / 2
        
        if (amountOfFood == 0) {
            continue
        } else {
            for _ in 1...amountOfFood {
                leftPlayer.append(foodNumber)
            }
        }
    }
    
    rightPlayer = leftPlayer.reversed()
    result = leftPlayer.reduce("") { "\($0)\($1)" } + "0" + rightPlayer.reduce("") { "\($0)\($1)" }
    
    return result
}