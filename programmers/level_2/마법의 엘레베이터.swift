import Foundation

var result = Int.max

func solution(_ storey:Int) -> Int {
    magicElevator(storey)
    return result
}

func magicElevator(_ storey: Int) {
    func dfs(_ currFloor: Int, _ numberOfMagicStone: Int) {
        if (currFloor / 10 == 0) {
            result = min(result, currFloor + numberOfMagicStone, (10 - currFloor) + 1 + numberOfMagicStone)
            return
        }

        let digit = currFloor % 10
        dfs(currFloor / 10, digit + numberOfMagicStone)
        dfs(currFloor / 10 + 1, (10 - digit) + numberOfMagicStone)
    }
    dfs(storey, 0)
}