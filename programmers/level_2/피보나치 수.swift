import Foundation

var dp_table =  [Int]()

func finbonacci(_ num: Int) -> Int {
    for i in 2...num {
        dp_table.append((dp_table[i - 2] + dp_table[i - 1]) % 1234567)
    }

    return dp_table[num]
}

func solution(_ n:Int) -> Int {
    var fibonacciNumber = 0

    dp_table.append(0)
    dp_table.append(1)

    fibonacciNumber = finbonacci(n)
    return fibonacciNumber
}