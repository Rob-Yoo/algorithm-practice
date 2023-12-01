import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var wantDictionary = [String: Int]()
    var result = 0
    
    for (product, numberOfProduct) in zip(want, number) {
        wantDictionary[product] = numberOfProduct
    }
    
    for i in 0...discount.count - 10 {
        var checkDictionary = wantDictionary

        if (want.contains(discount[i])) {
            var checkProductArray = discount[i..<i+10]
            
            for product in checkProductArray {
                checkDictionary[product, default: 10] -= 1
                if (checkDictionary[product]! == 0) {
                    checkDictionary[product] = nil
                }
            }
        }
        
        if (checkDictionary.isEmpty) {
            result += 1
        }
    }
    
    return result
}