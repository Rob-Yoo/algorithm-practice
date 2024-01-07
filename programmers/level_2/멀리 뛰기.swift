func solution(_ n:Int) -> Int {
    var record = Array(repeating: 0, count: 2001)

    record[1] = 1
    record[2] = 2

    if (n > 2) {
        for i in 3...n {
            record[i] = (record[i - 1] + record[i - 2]) % 1234567
        }
    }
    
    return record[n]
}