import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var times = [[Int]]()
    var rooms = [Int]()
    
    for bookTime in book_time.sorted { $0[0] < $1[0] } {
        let (start, end) = (bookTime[0].components(separatedBy: ":"), bookTime[1].components(separatedBy: ":"))
        let (startHour, startMin) = (start[0], start[1])
        let (endHour, endMin) = (end[0], end[1])
        
        let startTime = Int(startHour)! * 60 + Int(startMin)!
        let endTime = Int(endHour)! * 60 + Int(endMin)! + 10
        times.append([startTime, endTime])
    }
    
    for time in times {
        let startTime = time[0]
        let endTime = time[1]

        if (rooms.isEmpty) { rooms.append(endTime) }
        else {
            var needMoreRoom = true

            for (idx, roomFinishTime) in rooms.enumerated() {
                if (startTime >= roomFinishTime) {
                    rooms[idx] = endTime
                    needMoreRoom = false
                    break
                }
            }
            
            if (needMoreRoom) {
                rooms.append(endTime)
            }
        }
    }
    
    return rooms.count
}