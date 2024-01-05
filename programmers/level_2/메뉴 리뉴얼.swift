import Foundation

var maxCountArray = Array(repeating: 0, count: 11)
var courseCandidateArray = Array(repeating: [String: Int](), count: 11)

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result = [String]()

    for num in course {
        if (num == 1) { continue }
        for order in orders {
            if (order.count < num) { continue }
            let sortedOrder = order.map{ String($0) }.sorted(by: <)
            fillCourseCandidateArray(sortedOrder, num)
        }
    }
    
    for (courseCandidate, maxCount) in zip(courseCandidateArray, maxCountArray) {
        if (maxCount < 2) { continue }
        
        courseCandidate.forEach {
            if ($0.value == maxCount) {
                result.append($0.key)
            }
        }
    }

    return result.sorted(by: <)
}

func fillCourseCandidateArray(_ order: [String], _ combCount: Int) {
    func combination(_ idx: Int, _ comb: String) {
        if (comb.count == combCount) {
            courseCandidateArray[combCount][comb, default: 0] += 1
            let orderedCount = courseCandidateArray[combCount][comb, default: 0]
            maxCountArray[combCount] = max(maxCountArray[combCount], orderedCount)
            return
        }
        
        for i in idx..<order.count {
            combination(i + 1, comb + order[i])
        }
    }
    combination(0, "")
}