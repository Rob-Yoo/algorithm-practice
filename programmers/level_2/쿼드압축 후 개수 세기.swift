import Foundation

var numberOfZero = 0
var numberOfOne = 0

func solution(_ arr:[[Int]]) -> [Int] {
    quardCompress(arr)
    return [numberOfZero, numberOfOne]
}

func quardCompress(_ arr: [[Int]]) {
    if (checkFinishCompression(arr)) {
        if (arr[0][0] == 0) {
            numberOfZero += 1
        } else {
            numberOfOne += 1
        }

        return 
    }
    
    if (checkPossibilityOfCompression(arr)) {
        let compressedData = [arr[0][0]]

        quardCompress([compressedData])
    } else {
        let dividedArr = divideArr(arr)
        
        for region in dividedArr {
            quardCompress(region)
        }
    }
}

func checkFinishCompression(_ arr: [[Int]]) -> Bool {
    for i in 0..<arr.count {
        if (arr[i].count != 1) {
            return false
        }
    }
    
    return true
}

func checkPossibilityOfCompression(_ arr: [[Int]]) -> Bool {
    let check = arr[0][0]
    
    for i in 0..<arr.count {
        for j in 0..<arr[i].count {
            if (check != arr[i][j]) {
                return false
            }
        }
    }
    
    return true
}

func divideArr(_ arr: [[Int]]) -> [[[Int]]] {
    var (topLeft, topRight, bottomLeft, bottomRight) = ([[Int]](), [[Int]](), [[Int]](), [[Int]]())
    let middleIdx = arr.count / 2
    let (topDividedArr, bottomDividedArr) = (arr[0..<middleIdx], arr[middleIdx..<arr.count])
    
    for dividedArr in topDividedArr {
        let (leftDividedArr, rightDividedArr) = (dividedArr[0..<middleIdx], dividedArr[middleIdx..<dividedArr.count])
        topLeft.append(Array<Int>(leftDividedArr))
        topRight.append(Array<Int>(rightDividedArr))
    }
    
    for dividedArr in bottomDividedArr {
        let (leftDividedArr, rightDividedArr) = (dividedArr[0..<middleIdx], dividedArr[middleIdx..<dividedArr.count])
        bottomLeft.append(Array<Int>(leftDividedArr))
        bottomRight.append(Array<Int>(rightDividedArr))
    }
    
    return [topLeft, topRight, bottomLeft, bottomRight]
}