import Foundation

func solution(_ record:[String]) -> [String] {
    var userDictionary = [String: String]()
    var messages = [[String]]()
    var result = [String]()
    
    for message in record {
        let tokens = message.components(separatedBy: " ")
        let (status, uid) = (tokens[0], tokens[1])
        let nickname = (tokens.count == 3) ? tokens[2] : ""
        
        switch status {
        case "Enter":
            messages.append([uid, "님이 들어왔습니다."])
            userDictionary[uid] = nickname
        case "Leave":
            messages.append([uid, "님이 나갔습니다."])
        case "Change":
            userDictionary[uid] = nickname
        default:
            break
        }
    }
    
    for message in messages {
        let nickname = userDictionary[message[0]]!

        result.append(nickname + message[1])
    }
    
    return result
}