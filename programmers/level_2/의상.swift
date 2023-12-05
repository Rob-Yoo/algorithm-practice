import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var combination = 1
    var clothDictionary = [String: Int]()
    
    clothes.forEach {
        clothDictionary[$0[1], default: 0] += 1
    }
    
    for (_, value) in clothDictionary {
        combination *= (value + 1)
    }
    
    return combination - 1
}