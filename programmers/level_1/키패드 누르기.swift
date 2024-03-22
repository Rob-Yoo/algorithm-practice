import Foundation

typealias Position = (x: Int, y: Int)

func solution(_ numbers:[Int], _ hand:String) -> String {
    let keyPad = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [-1, 0, -1]]
    var keyPosDict = [Int: Position]()
    
    for i in 0..<keyPad.count {
        for j in 0..<keyPad[i].count {
            let num = keyPad[i][j]
            
            keyPosDict[num] = (x: j, y: i)
        }
    }
    
    return pushKeyPads(keyPosDict, numbers, hand)
}

func pushKeyPads(_ keyPosDict: [Int: Position], _ numbers: [Int], _ hand:String) -> String {
    var result = ""
    var (leftPos, rightPos) = ((x: 0, y: 3), (x: 2, y: 3))

    for number in numbers {
        let pos = keyPosDict[number]!
        var isLeft: Bool

        if (number == 1 || number == 4 || number == 7) {
            isLeft = true
        } else if (number == 3 || number == 6 || number == 9) {
            isLeft = false
        } else {
            let leftDistance = abs(leftPos.x - pos.x) + abs(leftPos.y - pos.y)
            let rightDistance = abs(rightPos.x - pos.x) + abs(rightPos.y - pos.y)
            
            if (leftDistance > rightDistance) {
                isLeft = false
            } else if (leftDistance < rightDistance) {
                isLeft = true
            } else {
                if (hand == "left") {
                    isLeft = true
                } else {
                    isLeft = false
                }
            }
        }
        
        if (isLeft) {
            leftPos = pos
            result += "L"   
        } else {
            rightPos = pos
            result += "R"
        }
    }
    
    return result
}