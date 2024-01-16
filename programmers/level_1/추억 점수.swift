import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var scoreBoard: [String: Int] = [:]
    var result: [Int] = []

    for idx in 0..<name.count {
        scoreBoard[name[idx]] = yearning[idx]
    }
    
    for onePhoto in photo {
        var sum = 0
        for name in onePhoto {
            if let score = scoreBoard[name] {
                sum = sum + score
            }
        }
        result.append(sum)
    }
    
    return result
}