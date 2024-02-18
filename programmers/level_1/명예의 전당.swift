import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var legend = [Int]()
    var result = [Int]()
    
    score.forEach { s in
        if (k == legend.count) {
            if (s > legend.last!) { 
                legend.removeLast()
                legend.append(s) 
            }
        } else {
            legend.append(s)  
        }
                   
        legend.sort { $0 > $1 }
        result.append(legend.last!)
    }
    
    return result
}