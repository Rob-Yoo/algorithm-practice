import Foundation

var superKeys = [Set<Int>]()

func solution(_ relation:[[String]]) -> Int {
    getSuperKeys(relation)
    return getNumerOfCandidateKey()
}

func getSuperKeys(_ relation: [[String]]) {
    let idxCombination = allCombination(Array(0..<relation[0].count))
    
    for idxComb in idxCombination {
        getUniqueKeys(idxComb, relation)
    }
}

func allCombination(_ element: [Int]) -> [[Int]] {
    var allCombs = [[Int]]()
    
    for i in 1...element.count {
        let comb = combination(element, i)
        allCombs.append(contentsOf: comb)
    }
    return allCombs
}

func combination(_ element: [Int], _ n: Int) -> [[Int]] {
    var combs = [[Int]]()
    
    func dfs(_ idx: Int, _ subArray: [Int]) {
        if (subArray.count == n) {
            combs.append(subArray)
            return
        }
        
        for i in idx..<element.count {
            dfs(i + 1, subArray + [element[i]])
        }
    }
    dfs(0, [])
    
    return combs
}

func getUniqueKeys(_ idxComb: [Int], _ relation: [[String]]) {
    var tuples = [[String]]()
    var tupleSet: Set<[String]>

    for col in 0..<relation.count {
        var tuple = [String]()

        for row in idxComb {
            tuple.append(relation[col][row])
        }
        tuples.append(tuple)
    }
    
    tupleSet = Set(tuples)
    if (tupleSet.count == tuples.count) {
        superKeys.append(Set(idxComb))
    }
}

func getNumerOfCandidateKey() -> Int {
    var count = 0
    // print(superKeys)
    while (!superKeys.isEmpty) {
        count += 1
        superKeys = superKeys.filter { !$0.isSuperset(of: superKeys[0]) }
    }
    return count
}