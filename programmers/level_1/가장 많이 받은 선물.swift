import Foundation

var giftHistory = [[Int]]()
var giftStatus = [[Int]]()
var idxDictionary = [String: Int]()

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var result: Int

    giftHistory = Array(repeating: Array(repeating: 0, count: friends.count), count: friends.count)
    giftStatus = Array(repeating: [0, 0], count: friends.count)
    
    fillIdxDictionary(friends)
    parseGiftHistory(gifts)
    result = getResult(friends)
    return result
}

func fillIdxDictionary(_ friends:[String]) {
    for (idx, friend) in friends.enumerated() {
        idxDictionary[friend] = idx
    }
}

func parseGiftHistory(_ gifts:[String]) {
    for gift in gifts {
        let gift = gift.components(separatedBy: " ")
        let (giver, receiver) = (gift[0], gift[1])
        let (giverIdx, receiverIdx) = (idxDictionary[giver]!, idxDictionary[receiver]!)

        giftHistory[giverIdx][receiverIdx] += 1
        giftStatus[giverIdx][0] += 1
        giftStatus[receiverIdx][1] += 1
    }
}

func getResult(_ friends:[String]) -> Int {
    var nextMonthGift = Array(repeating: 0, count: friends.count)

    for comb in combination(friends, 2) {
        let (A, B) = (comb[0], comb[1])
        let (aIdx, bIdx) = (idxDictionary[A]!, idxDictionary[B]!)
        let (giveCountOfA, giveCountOfB) = (giftHistory[aIdx][bIdx], giftHistory[bIdx][aIdx])

        if (giveCountOfA > giveCountOfB) {
            nextMonthGift[aIdx] += 1
        } else if (giveCountOfA < giveCountOfB) {
            nextMonthGift[bIdx] += 1
        } else {
            let aGiftPoint = giftStatus[aIdx][0] - giftStatus[aIdx][1]
            let bGiftPoint = giftStatus[bIdx][0] - giftStatus[bIdx][1]

            if (aGiftPoint > bGiftPoint) {
                nextMonthGift[aIdx] += 1
            } else if (aGiftPoint < bGiftPoint) {
                nextMonthGift[bIdx] += 1
            }
        }
    }
    
    return nextMonthGift.max()!
}

func combination(_ friends:[String], _ n: Int) -> [[String]] {
    var comb = [[String]]()
    
    func dfs(_ idx: Int, _ subArray: [String]) {
        if (subArray.count == n) {
            comb.append(subArray)
            return
        }
        
        for i in idx..<friends.count {
            dfs(i + 1, subArray + [friends[i]])
        }
    }

    dfs(0, [])

    return comb
}