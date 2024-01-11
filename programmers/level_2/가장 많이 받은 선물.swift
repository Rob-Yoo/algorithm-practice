import Foundation

var giftHistoryTable = Array(repeating: Array(repeating: 0, count: 50), count: 50)
var giftLevel = Array(repeating: 0, count: 50)
var friendsDictionary = [String: Int]()
var nextGiftTable = [String: Int]()

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var result = 0
    
    for (idx, friend) in friends.enumerated() {
        friendsDictionary[friend] = idx
    }
    
    parseGifts(gifts)
    
    for me in friends {
        let myIdx = friendsDictionary[me]!

        for friend in friends {
            let friendIdx = friendsDictionary[friend]!
            
            if (myIdx >= friendIdx) { continue }

            let myGivingCount = giftHistoryTable[myIdx][friendIdx]
            let friendGivingCount = giftHistoryTable[friendIdx][myIdx]

            if (myGivingCount == 0 && friendGivingCount == 0) {
                checkGiftLevel((name: me, idx: myIdx), (name: friend, idx: friendIdx))
            } else {
                if (myGivingCount > friendGivingCount) {
                    nextGiftTable[me, default: 0] += 1
                    print("myGivingCount > friendGivingCount : " + friend + " gives gift to " + me)
                } else if (myGivingCount < friendGivingCount) {
                    nextGiftTable[friend, default: 0] += 1
                    print("myGivingCount < friendGivingCount : " + me + " gives gift to " + friend)
                } else {
                    checkGiftLevel((name: me, idx: myIdx), (name: friend, idx: friendIdx))
                }
            }
        }
    }
    
    if (!nextGiftTable.isEmpty) {
        print(nextGiftTable)
        for nextGift in nextGiftTable.values {
            result = max(result, nextGift)
        }
    }
    
    return result
}

func parseGifts(_ gifts: [String]) {
    for gift in gifts {
        let gift = gift.components(separatedBy: " ")
        let (A, B) = (gift[0], gift[1])
        let (idxA, idxB) = (friendsDictionary[A]!, friendsDictionary[B]!)
        
        giftHistoryTable[idxA][idxB] += 1
        giftLevel[idxA] += 1
        giftLevel[idxB] -= 1
    }
}

func checkGiftLevel(_ A: (name: String, idx: Int), _ B: (name: String, idx: Int)) {
    if (giftLevel[A.idx] > giftLevel[B.idx]) {
        nextGiftTable[A.name, default: 0] += 1
        print("giftLevel[A.idx] > giftLevel[B.idx] : " + B.name + " gives gift to " + A.name)
    } else if (giftLevel[A.idx] < giftLevel[B.idx]) {
        nextGiftTable[B.name, default: 0] += 1
         print("giftLevel[A.idx] < giftLevel[B.idx]: " + A.name + " gives gift to " + B.name)
    }
}