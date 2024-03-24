func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var binaryMap1 = [String]()
    var binaryMap2 = [String]()
    var result = [String]()

    arr1.forEach {
        let binary = String($0, radix: 2)
        let extra = n - binary.count
        let formattedBinary = String(repeating: "0", count: extra) + binary
        binaryMap1.append(formattedBinary)
    }
    
    arr2.forEach {
        let binary = String($0, radix: 2)
        let extra = n - binary.count
        let formattedBinary = String(repeating: "0", count: extra) + binary
        binaryMap2.append(formattedBinary)
    }
    
    for i in 0..<n {
        var map = ""
        for j in 0..<n {
            let idx = String.Index(encodedOffset: j)
            
            if (binaryMap1[i][idx] == "1" || binaryMap2[i][idx] == "1") {
                map += "#"
            } else {
                map += " "
            }
        }
        result.append(map)
    }
    
    return result
}