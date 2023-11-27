import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var binaryConvertingCnt = 0
    var removedZeroCnt = 0

    while (s != "1") {
        var sLen = s.count
        var oneCnt = s.filter { $0 == "1" }.count
        
        s = String(oneCnt, radix: 2)
        removedZeroCnt += sLen - oneCnt
        binaryConvertingCnt += 1
    }
    
    return [binaryConvertingCnt, removedZeroCnt]
}