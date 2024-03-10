import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var (xPointer, yPointer) = (0, 0)
    let x = X.map { String($0) }.sorted()
    let y = Y.map { String($0) }.sorted()
    var isZero = true
    var couples = [String]()
    var result = ""

    while (xPointer < x.count && yPointer < y.count) {
        if (x[xPointer] == y[yPointer]) {
            if (isZero && x[xPointer] != "0") {
                isZero = false
            }

            couples.append(x[xPointer])
            xPointer += 1
            yPointer += 1
        }  else if (x[xPointer] > y[yPointer]) {
            while (xPointer < x.count && yPointer < y.count && x[xPointer] != y[yPointer] ) {
                yPointer += 1
            }
        } else {
            while ( xPointer < x.count && yPointer < y.count && x[xPointer] != y[yPointer] )
            {
                xPointer += 1
            }
        }
    }

    if (couples.isEmpty) {
        return "-1"
    } else if (isZero) {
        return "0"
    }

    result = couples.sorted{ $0 > $1 }.joined()
    return result
}