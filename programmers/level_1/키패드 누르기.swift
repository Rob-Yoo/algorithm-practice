import Foundation

var keypad = [1: [0, 0], 2: [0, 1], 3: [0, 2], 4: [1, 0], 5: [1, 1], 6: [1, 2], 7: [2, 0], 8: [2, 1], 9: [2, 2], 0: [3, 1]]
var leftHandPos = [3, 0]
var rightHandPos = [3, 2]

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""

    for number in numbers {
        if ([1, 4, 7].contains(number)) {
            result += "L"
            leftHandPos = keypad[number]!
        } else if ([3, 6, 9].contains(number)) {
            result += "R"
            rightHandPos = keypad[number]!
        } else {
            result += decideWhichHand(number, hand)
        }
    }
    
    return result
}

func decideWhichHand(_ number: Int, _ hand: String) -> String {
    let (numberX, numberY) = (keypad[number]![0], keypad[number]![1])
    let (leftX, leftY) = (leftHandPos[0], leftHandPos[1])
    let (rightX, rightY) = (rightHandPos[0], rightHandPos[1])
    let leftHandDistance = abs(numberX - leftX) + abs(numberY - leftY)
    let rightHandDistance = abs(numberX - rightX) + abs(numberY - rightY)
    
    if (leftHandDistance > rightHandDistance) {
        rightHandPos = keypad[number]!
        return "R"
    } else if (leftHandDistance < rightHandDistance) {
        leftHandPos = keypad[number]!
        return "L"
    } else {
        if (hand == "right") {
            rightHandPos = keypad[number]!
            return "R"
        } else {
            leftHandPos = keypad[number]!
            return "L"
        }
    }
    
    return ""
}