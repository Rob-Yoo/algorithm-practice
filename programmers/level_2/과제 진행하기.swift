import Foundation

struct Stack<T> {
    private var arr = [T]()
    
    var isEmpty: Bool {
        return arr.isEmpty
    }
    
    var top: T? {
        return arr.last
    }
    
    mutating func push(_ element: T) {
        arr.append(element)
    }
    
    mutating func pop() -> T? {
        return arr.popLast()
    }
}

func solution(_ plans:[[String]]) -> [String] {
    var plans = plans.sorted{ $0[1] < $1[1] }
    var waiting = Stack<String>()
    var planInfo = [String: [Int]]()
    var finishArray = [String]()
    
    for plan in plans {
        let name = plan[0]
        let timeArray = plan[1].components(separatedBy: ":")
        let start = Int(timeArray[0])! * 60 + Int(timeArray[1])!
        let playTime = Int(plan[2])!
        
        planInfo[name] = [start, playTime]
    }
    
    for idx in plans.indices {
        if (idx == plans.count - 1) {
            finishArray.append(plans[idx][0])
        } else {
            let (currentPlanName = plans[idx][0]
            let currentPlanStart = planInfo[currentPlanName]![0]
            let currentPlanPlayTime = planInfo[currentPlanName]![1]

            let nextPlanName = plans[idx + 1][0]
            let nextPlanStart = planInfo[nextPlanName]![0]
            
            if (currentPlanStart + currentPlanPlayTime > nextPlanStart) {
                planInfo[currentPlanName]![1] -= nextPlanStart - currentPlanStart
                waiting.push(currentPlanName)
            } else if (currentPlanStart + currentPlanPlayTime < nextPlanStart)  {
                finishArray.append(currentPlanName)
                
                var resumeTime = nextPlanStart - (currentPlanStart + currentPlanPlayTime)
                
                while (true) {
                    guard let resumePlanName = waiting.top else { break }
                    
                    planInfo[resumePlanName]![1] -= resumeTime

                    if (planInfo[resumePlanName]![1] == 0) {
                        finishArray.append(waiting.pop()!)
                    } else if (planInfo[resumePlanName]![1] < 0) {
                        finishArray.append(waiting.pop()!)
                        resumeTime = -planInfo[resumePlanName]![1]
                    } else {
                        break
                    }
                }
            } else {
                 finishArray.append(currentPlanName)
            }
        }        
    }
    
    while (!waiting.isEmpty) {
        finishArray.append(waiting.pop()!)
    }
    
    
    return finishArray
}