import Foundation

extension String {
    subscript(index: Int) -> Character {
        return self[String.Index(encodedOffset: index)]
    }
}

var (dictForSet1, dictForSet2) = ([String: Int](), [String: Int]())
var (set1, set2) = (Set<String>(), Set<String>())

func solution(_ str1:String, _ str2:String) -> Int {
    var (str1, str2) = (str1.lowercased(), str2.lowercased())
    var numberOfIntersection = 0
    var numberOfUnion = 0
    var result = Double()
    
    
    makeMultipleSet(str1, 1)
    makeMultipleSet(str2, 2)

    if (set1.isEmpty && set2.isEmpty) {
        return 65536
    }
    
    numberOfIntersection = numberOfIntersectionMutipleSet()
    numberOfUnion = numberOfUnionMutipleSet()
    result = Double(numberOfIntersection) / Double(numberOfUnion)
    
    return Int(result * 65536)
}

func makeMultipleSet(_ str: String, _ numberOfStr: Int) {
    var multipleSet = Set<String>()
    var dictForSet = [String: Int]()

    for i in 0..<str.count - 1 {
        let element = String(str[i]) + String(str[i + 1])

        if (element[0].isLetter && element[1].isLetter) {
            multipleSet.insert(element)
            dictForSet[element, default: 0] += 1
        }
    }
    
    if (numberOfStr == 1) {
        set1 = multipleSet
        dictForSet1 = dictForSet
    } else {
        set2 = multipleSet
        dictForSet2 = dictForSet
    }
}

func numberOfIntersectionMutipleSet() -> Int {
    let intersectionSet = set1.intersection(set2)
    var count = 0
    
    for element in intersectionSet {
        let elementCount1 = dictForSet1[element]!
        let elementCount2 = dictForSet2[element]!
        let minElementCount = min(elementCount1, elementCount2)
        
        count += minElementCount
    }
    
    return count
}

func numberOfUnionMutipleSet() -> Int {
    let unionSet = set1.union(set2)
    var count = 0
    
    for element in unionSet {
        let elementCount1 = dictForSet1[element, default: 0]
        let elementCount2 = dictForSet2[element, default: 0]
        let maxElementCount = max(elementCount1, elementCount2)
        
        count += maxElementCount
    }
    return count
}