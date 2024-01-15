import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    var rankInfo: [String: Int] = [:]
    
    for (idx, player) in players.enumerated() {
        rankInfo[player] = idx
    }
    
    for call in callings {
        let idx = rankInfo[call]!
        let rankDownPlayer = players[idx - 1]
        
        rankInfo[call] = idx - 1
        rankInfo[rankDownPlayer] = idx
        
        players.swapAt(idx - 1, idx)
    }
    
    return players
}