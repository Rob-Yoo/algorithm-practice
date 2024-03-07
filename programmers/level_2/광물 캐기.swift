import Foundation

var minStamina = Int.max

enum Pick {
    case diamond, iron, stone
}

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    let mineralChunks = makeMineralChunks(minerals)
    
    getMinStamina(mineralChunks, 0, 0, picks)
    return minStamina
}

func makeMineralChunks(_ minerals:[String]) -> [[String]] {
    var mineralChunks = [[String]]()

    for i in stride(from: 0, to: minerals.count, by: 5) {
        if (i + 4 >= minerals.count) {
            mineralChunks.append(Array(minerals[i..<minerals.count]))
        } else {
            mineralChunks.append(Array(minerals[i..<i + 5]))
        }
    }
    return mineralChunks
}

func getMinStamina(_ mineralChunks: [[String]], _ idx: Int, _ stamina: Int, _ picks: [Int]) {
    var consumedStamina: Int
    
    if (mineralChunks.count == idx || picks.allSatisfy { $0 == 0 }) {
        minStamina = min(minStamina, stamina)
        return
    }
    
    if (picks[0] > 0) {
        var picks = picks
        picks[0] -= 1
        consumedStamina = getConsumedStamina(mineralChunks[idx], .diamond)
        getMinStamina(mineralChunks, idx + 1, stamina + consumedStamina, picks)
    }
    
    if (picks[1] > 0) {
        var picks = picks
        picks[1] -= 1
        consumedStamina = getConsumedStamina(mineralChunks[idx], .iron)
        getMinStamina(mineralChunks, idx + 1, stamina + consumedStamina, picks)
    }
    
    if (picks[2] > 0) {
        var picks = picks
        picks[2] -= 1
        consumedStamina = getConsumedStamina(mineralChunks[idx], .stone)
        getMinStamina(mineralChunks, idx + 1, stamina + consumedStamina, picks)
    }
}

func getConsumedStamina(_ mineralChunk: [String], _ pick: Pick) -> Int {
    var stamina = 0

    for mineral in mineralChunk {
        switch pick {
        case .diamond:
            stamina += 1
        case .iron:
            if (mineral == "diamond") { stamina += 5 }
            else { stamina += 1 }
        case .stone:
            if (mineral == "diamond") { stamina += 25 }
            else if (mineral == "iron") { stamina += 5 }
            else { stamina += 1 }
        }
    }
    
    return stamina
}