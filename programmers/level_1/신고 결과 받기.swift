import Foundation

var reportDict = [String: Set<String>]()
var reportedDict = [String: Int]()

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var result = [Int]()
    var bannedIDs = [String]()
    
    parseReport(report)
    bannedIDs = reportedDict.filter { $0.value >= k }.map { $0.key }

    for id in id_list {
        let resultMailCount = bannedIDs.filter { reportDict[id, default: Set<String>()].contains($0) }.count
        
        result.append(resultMailCount)
    }
    
    return result
}

func parseReport(_ reports:[String]) {
    for report in reports {
        let report = report.components(separatedBy: " ")
        let (from, to) = (report[0], report[1])
        
        if (reportDict[from, default: Set<String>()].insert(to).inserted) {
            reportedDict[to, default: 0] += 1
        }
    }
}