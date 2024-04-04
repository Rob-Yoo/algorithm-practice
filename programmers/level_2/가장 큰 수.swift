import Foundation

func solution(_ numbers:[Int]) -> String {
    let sortedNumbers = numbers.sorted { "\($0)\($1)" > "\($1)\($0)" }
    if (sortedNumbers[0] == 0) {
        return "0"
    }
    return sortedNumbers.reduce("") { "\($0)\($1)" }
}