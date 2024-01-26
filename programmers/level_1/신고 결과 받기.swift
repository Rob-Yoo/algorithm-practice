import Foundation

var userReportDict = [String: Set<String>]()
var reportedRecords = Array(repeating: 0, count: 1000)
var userIdxDict = [String: Int]()
var bannedIDList = Set<String>()

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var result = Array(repeating: 0, count: id_list.count)

    parseIDList(id_list)
    parseReport(report, k)
    for (key, value) in userReportDict {
        let fromUserIdx = userIdxDict[key]!
        
        for bannedID in bannedIDList {
            if (value.contains(bannedID)) {
                result[fromUserIdx] += 1
            }
        }
    }
    return result
}

func parseIDList(_ id_list:[String]) {
    for (idx, id) in id_list.enumerated() {
        userIdxDict[id] = idx
    } 
}

func parseReport(_ reports:[String], _ k:Int) {
    for report in reports {
        let log = report.components(separatedBy: " ")
        let (from, to) = (log[0], log[1])
        let toUserIdx = userIdxDict[to]!

        if !(userReportDict[from, default: []].contains(to)) {
            userReportDict[from, default: []].insert(to)
            reportedRecords[toUserIdx] += 1
            
            if(reportedRecords[toUserIdx] >= k) {
                bannedIDList.insert(to)
            }
        }
    }
}