import Foundation

func solution(_ s:String) -> Int {
    let s = s.map { String($0) }
    var result = Int.max

    if (s.count == 1) { return 1 }

    for chunkSize in 1...(s.count / 2) {
        let zippedString = stringZip(s, chunkSize)
        result = min(result, zippedString.count)
    }
    return result
}

func stringZip(_ s: [String], _ chunkSize: Int) -> String {
    let chunkedStringArr = getChunkedStringArr(s, chunkSize)
    var zippedString = chunkedStringArr[0]
    var zipCount = 1
    var zipCompletedString = ""
    
    for i in 1..<chunkedStringArr.count {
        let chunkedString = chunkedStringArr[i]

        if (zippedString == chunkedString) {
            // 압축 가능
            zipCount += 1
        } else {
            // 압축 불가능
            let zipStr = zipCount == 1 ? "" : String(zipCount)
            zipCompletedString += zipStr + zippedString
            zippedString = chunkedString
            zipCount = 1
        }
    }
    zipCompletedString += (zipCount == 1 ? "" : String(zipCount)) + zippedString

    return zipCompletedString
}

func getChunkedStringArr(_ s: [String], _ chunkSize: Int) -> [String] {
    // 단위만큼 자른 문자열 배열 반환하기
    var chunkedString = ""
    var chunkedStringArr = [String]()

    for str in s {
        chunkedString += str
        
        if (chunkedString.count == chunkSize) {
            chunkedStringArr.append(chunkedString)
            chunkedString = ""
        }
    }
    
    if (!chunkedString.isEmpty) { 
        chunkedStringArr.append(chunkedString) 
    }
    
    return chunkedStringArr
}