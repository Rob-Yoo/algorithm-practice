import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = [[Int]]()

    for i in 0..<arr1.count {
        var mulArray = [Int]()

        for j in 0..<arr2[0].count {
            var element = 0

            for k in 0..<arr1[0].count {
                element += arr1[i][k] * arr2[k][j]
            }
            mulArray.append(element)
        }
        result.append(mulArray)
    }
    
    return result
}