import Foundation

var matrix = Array(repeating: Array(repeating: 0, count: 101), count: 101)
var minValue = Int.max

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var result = [Int]()

    fillInitialMatrix(rows, columns)
    for query in queries {
        let (x1, y1, x2, y2) = (query[0], query[1], query[2], query[3])
        let topLeft = (col: x1, row: y1)
        let topRight = (col: x1, row: y2)
        let bottomLeft = (col: x2, row: y1)
        let bottomRight = (col: x2, row: y2)
        rotateMatrix(topLeft, topRight, bottomLeft, bottomRight)
        result.append(minValue)
        minValue = Int.max
    }
    return result
}

func fillInitialMatrix(_ rows: Int, _ columns: Int) {
    var num = 1
    for col in 1...rows {
        for row in 1...columns {
            matrix[col][row] = num
            num += 1
        }
    }
}

func rotateMatrix(_ topLeft: (col: Int, row: Int), _ topRight: (col: Int, row: Int), _ bottomLeft: (col: Int, row: Int), _ bottomRight: (col: Int, row: Int)) {
    var nextValue = rotateTop(topLeft, topRight)
    nextValue = rotateRight(topRight, bottomRight, nextValue)
    nextValue = rotateBottom(bottomRight, bottomLeft, nextValue)
    rotateLeft(bottomLeft, topLeft, nextValue)
}

func rotateTop(_ start: (col: Int, row: Int), _ end: (col: Int, row: Int)) -> Int {
    var prev = matrix[start.col][start.row]

    for curr in start.row + 1...end.row {
        var currValue = matrix[start.col][curr]
        matrix[start.col][curr] = prev
        prev = currValue
        minValue = min(minValue, prev, currValue)
    }
    return prev
}

func rotateRight(_ start: (col: Int, row: Int), _ end: (col: Int, row: Int), _ nextValue: Int) -> Int {
    var prev = nextValue
    for curr in start.col + 1...end.col {
        var currValue = matrix[curr][start.row]
        matrix[curr][start.row] = prev
        prev = currValue
        minValue = min(minValue, prev, currValue)
    }
    
    return prev
}

func rotateBottom(_ start: (col: Int, row: Int), _ end: (col: Int, row: Int), _ nextValue: Int) -> Int {
    var prev = nextValue
    
    for curr in stride(from: start.row - 1, through: end.row, by: -1) {
        var currValue = matrix[start.col][curr]
        matrix[start.col][curr] = prev
        prev = currValue
        minValue = min(minValue, prev, currValue)
    }
    
    return prev
}

func rotateLeft(_ start: (col: Int, row: Int), _ end: (col: Int, row: Int), _ nextValue: Int) {
    var prev = nextValue
    
    for curr in stride(from: start.col - 1, through: end.col, by: -1) {
        var currValue = matrix[curr][start.row]
        matrix[curr][start.row] = prev
        prev = currValue
        minValue = min(minValue, prev, currValue)
    }
}