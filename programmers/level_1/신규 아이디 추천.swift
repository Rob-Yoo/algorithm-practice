import Foundation

func solution(_ new_id:String) -> String {
    var new_id = new_id
    
    new_id = activateStageOne(new_id)
    new_id = activateStageTwo(new_id)
    new_id = activateStageThree(new_id)
    new_id = activateStageFour(new_id)
    new_id = activateStageFive(new_id)
    new_id = activateStageSix(new_id)
    new_id = activateStageSeven(new_id)

    return new_id
}

func activateStageOne(_ new_id: String) -> String {
    return new_id.lowercased()
}

func activateStageTwo(_ new_id: String) -> String {
    var id = ""
    
    for idx in new_id.indices {
        let token = new_id[idx]

        if (token.isLetter || ["-", "_", "."].contains(token) || token.isNumber) {
            id += String(token)
        }
    }
    return id
}

func activateStageThree(_ new_id: String) -> String {
    var id = ""
    
    for idx in new_id.indices {
        let token = new_id[idx]
        
        if let top = id.last {
            if (top == "." && token == top) {
                continue
            }
        }
        
        id += String(token)
    }
    
    return id
}

func activateStageFour(_ new_id: String) -> String {
    var new_id = new_id

    if let firstChar = new_id.first, firstChar == "." {
        new_id.removeFirst()
    }
    
    if let lastChar = new_id.last, lastChar == "." {
        new_id.removeLast()
    }
    
    return new_id
}

func activateStageFive(_ new_id: String) -> String {
    var new_id = new_id
    
    if (new_id.isEmpty) {
        new_id += "a"
    }
    
    return new_id
}

func activateStageSix(_ new_id: String) -> String {
    var id = ""
    
    for idx in new_id.indices {
        if (id.count == 15) {
            break
        }
        
        id += String(new_id[idx])
    }
    
    if let lastChar = id.last, lastChar == "." {
        id.removeLast()
    }
    
    return id
}

func activateStageSeven(_ new_id: String) -> String {
    var new_id = new_id
    
    if let lastChar = new_id.last {
        while (new_id.count < 3) {
            new_id += String(lastChar)
        }
    }
    
    return new_id
}