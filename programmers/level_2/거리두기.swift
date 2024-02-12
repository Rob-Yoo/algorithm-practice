import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var result = [Int]()
    
    for place in places {
        let isValid = checkValidPlace(place)
        result.append(isValid)
    }
    
    return result
}

func checkValidPlace(_ place: [String]) -> Int {
    var place = place.map { $0.map { String($0) } }
    var isValid = 1
    
    for i in 0..<place.count {
        for j in 0..<place.count {
            if (place[i][j] == "P") {
                if (checkVertical(&isValid, (x: j, y: i), place) == false) { break }
                if (checkHorizontal(&isValid, (x: j, y: i), place) == false) { break }
                if (checkDiagonal(&isValid, (x: j, y: i), place) == false) { break }
            }
        }
    }
    
    return isValid
}

func checkVertical(_ isValid: inout Int, _ person: (x: Int, y: Int), _ place: [[String]]) -> Bool {
    var object1 = ""
    var object2 = ""

    // 아래만 검사
    if (person.y + 1 <= 4) {
        object1 = place[person.y + 1][person.x]
    }
    
    if (person.y + 2 <= 4) {
        object2 = place[person.y + 2][person.x]
    }
    
    if (object1 == "P" || (object1 == "O" && object2 == "P")) {
        isValid = 0
        return false
    }
    
    return true
}

func checkHorizontal(_ isValid: inout Int, _ person: (x: Int, y: Int), _ place: [[String]]) -> Bool {
    var object1 = ""
    var object2 = ""

    // 오른쪽만 검사
    if (person.x + 1 <= 4) {
        object1 = place[person.y][person.x + 1]
    }
    
    if (person.x + 2 <= 4) {
        object2 = place[person.y][person.x + 2]
    }
    
    if (object1 == "P" || (object1 == "O" && object2 == "P")) {
        isValid = 0
        return false
    }
    
    return true
}

func checkDiagonal(_ isValid: inout Int, _ person: (x: Int, y: Int), _ place: [[String]]) -> Bool {
    // 위 대각선
    if (person.x + 1 <= 4 && person.y - 1 >= 0) {
        let personCandidate = place[person.y - 1][person.x + 1]
        let object1 = place[person.y - 1][person.x]
        let object2 = place[person.y][person.x + 1]
        
        if (personCandidate == "P" && (object1 != "X" || object2 != "X")) {
            isValid = 0
            return false
        }
    }
    
    // 아래 대각선
    if (person.x + 1 <= 4 && person.y + 1 <= 4) {
        let personCandidate = place[person.y + 1][person.x + 1]
        let object1 = place[person.y + 1][person.x]
        let object2 = place[person.y][person.x + 1]
        
        if (personCandidate == "P" && (object1 != "X" || object2 != "X")) {
            isValid = 0
            return false
        }
    }
    
    return true
}
