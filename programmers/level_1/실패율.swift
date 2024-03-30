import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var challengerDict = [Int: Int]()
    var failDict = [Int: Double]() 
    var numberOfUsers = stages.count
    var result = [Int]()
    
    for stage in stages {
        challengerDict[stage, default: 0] += 1
    }
    
    for stageNumber in 1...N {
        let numberOfChallengers = challengerDict[stageNumber, default: 0]
        let failRate =  numberOfChallengers == 0 ? Double(0) : Double(numberOfChallengers) / Double(numberOfUsers)

        failDict[stageNumber] = failRate
        numberOfUsers -= numberOfChallengers
    }
    
    for failRate in failDict.sorted { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value } {
        result.append(failRate.key)
    }
    
    return result
}