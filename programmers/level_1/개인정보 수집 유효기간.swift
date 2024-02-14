import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let todayArr = today.split(separator: ".").map { Int($0)! }
    
    let termsArr = terms.map { $0.split(separator: " ").map { String($0) } }
    var termsDict = [String: [Int]]()
    
    let privaciesArr = privacies.map { $0.split(separator: " ").map { String($0) } }
    
    var result: [Int] = [] 
    
    termsArr.forEach { term in
        let expireYear = Int(term[1])! / 12
        let expireMonth = Int(term[1])! % 12
        termsDict[term[0]] = [expireYear, expireMonth]
    }

    for (idx, privacy) in privaciesArr.enumerated() {
        let startDate = privacy[0].split(separator: ".").map { Int($0)! }
        let customer = privacy[1]
        
        var expireYear = startDate[0] + termsDict[customer]![0]
        var expireMonth = startDate[1] + termsDict[customer]![1]

        if (expireMonth > 12) {
            expireYear = expireYear + 1
            expireMonth = expireMonth - 12
        } 

        var expireDay = startDate[2] - 1
        if (expireDay == 0) {
            expireMonth = expireMonth - 1
            expireDay = 28
        }
        
        if (todayArr[0] > expireYear) {
            result.append(idx + 1)
            continue
        } else if (todayArr[0] == expireYear) {
            if (todayArr[1] > expireMonth) {
                result.append(idx + 1)
                continue
            } else if (todayArr[1] == expireMonth) {
                if (todayArr[2] > expireDay) {
                    result.append(idx + 1)
                }
            }
        }
    }
    return result
}