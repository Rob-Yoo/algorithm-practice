import Foundation

var gameBoard = [[String]]()

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var answer = 0
    
    gameBoard = board.map { $0.map { String($0) } }
    while (true) {
        let countOfRemovedBlocks = getCountOfRemovedBlocks(m, n)
        
        if (countOfRemovedBlocks == 0) { break }
        answer += countOfRemovedBlocks
        replaceGameBoard(m, n)
    }
    
    return answer
}

func getCountOfRemovedBlocks(_ m: Int, _ n: Int) -> Int {
    var willRemoveBlocks = Array(repeating: Array(repeating: false, count: n), count: m)
    
    checkRemoveBlocks(m, n, &willRemoveBlocks)
    return applyRemovingBlocksToGameBoard(m, n, willRemoveBlocks)
}

func checkRemoveBlocks(_ m: Int, _ n: Int, _ willRemoveBlocks: inout [[Bool]]) {
    for i in 0..<m - 1 {
        for j in 0..<n - 1 {
            let checkBlock = gameBoard[i][j]

            if (checkBlock == "") {
                continue
            } else if (checkBlock == gameBoard[i][j + 1] && checkBlock == gameBoard[i + 1][j] && checkBlock == gameBoard[i + 1][j + 1]) {
                willRemoveBlocks[i][j] = true
                willRemoveBlocks[i][j + 1] = true
                willRemoveBlocks[i + 1][j] = true
                willRemoveBlocks[i + 1][j + 1] = true
            }
        }
    }
}

func applyRemovingBlocksToGameBoard(_ m: Int, _ n: Int, _ willRemoveBlocks: [[Bool]]) -> Int {
    var countOfRemovedBlocks = 0

    for i in 0..<m {
        for j in 0..<n {
            if (willRemoveBlocks[i][j] == true) {
                countOfRemovedBlocks += 1
                gameBoard[i][j] = ""
            }
        }
    }
    
    return countOfRemovedBlocks
}

func replaceGameBoard(_ m: Int, _ n: Int) {
    for row in 0..<n {
        var countOfBlank = 0

        for col in stride(from: m - 1, through: 0, by: -1) {
            if (gameBoard[col][row] == "") {
                countOfBlank += 1
            } else if (countOfBlank > 0) {
                gameBoard[col + countOfBlank][row] = gameBoard[col][row]
                gameBoard[col][row] = ""
            }
        }
    }
}