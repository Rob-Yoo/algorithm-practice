import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let lastTime = 60 * 23 + 59
    let (baseTime, baseFee, perMin, perFee) = (fees[0], fees[1], fees[2], fees[3])
    var parkingDictionary = [String: [[Int]]]()
    var result = [Int]()
    
    for record in records {
        let recordData = record.components(separatedBy: " ")
        let timeData = recordData[0].components(separatedBy: ":")
        let (time, carNumber, inOut) = (Int(timeData[0])! * 60 + Int(timeData[1])!, recordData[1], recordData[2])
        
        if (inOut == "IN") {
            parkingDictionary[carNumber, default: []].append([time, lastTime])
        } else {
            let lastIndex = parkingDictionary[carNumber]!.count - 1

            parkingDictionary[carNumber]![lastIndex][1] = time
        }
    }
                             
    for car in parkingDictionary.sorted { $0.key < $1.key } {
        var totalParkingTime = 0
        
        for timeInfo in car.value {
            let (inTime, outTime) = (timeInfo[0], timeInfo[1])

            totalParkingTime += (outTime - inTime)
        }
        if (totalParkingTime <= baseTime) {
            result.append(baseFee)
        } else {
            let additionalFee = Int(ceil(Double(totalParkingTime - baseTime) / Double(perMin))) * perFee
            
            result.append(baseFee + additionalFee)
        }
    }
    return result
}