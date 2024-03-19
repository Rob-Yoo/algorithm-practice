import Foundation

var idxDictionary = [String: Int]()

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    user_id.enumerated().forEach { idxDictionary[$1] = $0 }
    let banned_id_candidates = get_banned_id_candidates(user_id, banned_id)
    let finalList = get_final_list(banned_id_candidates)
    return finalList.count
}

func get_banned_id_candidates(_ user_ids:[String], _ banned_ids:[String]) -> [[String]] {
    var candidates = [[String]]()

    for banned_id in banned_ids {
        var list = [String]()
        
        for user_id in user_ids {

            if (user_id.count == banned_id.count) {
                var flag = true
                
                for i in user_id.indices {
                    if (user_id[i] != banned_id[i] && banned_id[i] != "*") {
                        flag = false
                        break
                    }
                }
                
                if (flag) {
                    list.append(user_id)
                }
            }
        }
        
        candidates.append(list)
    }
    
    return candidates
}

func get_final_list(_ banned_id: [[String]]) -> Set<[Int]> {
    var finalList = Set<[Int]>()
    var visited = [String: Bool]()
    
    func dfs(_ idx: Int, _ subArray: [String]) {
        if (subArray.count == banned_id.count) {
            var idxArray = [Int]()
            
            subArray.forEach { idxArray.append(idxDictionary[$0]!) }
            idxArray.sort(by: <)
            finalList.insert(idxArray)
            return
        }
        
        for i in 0..<banned_id[idx].count {
            let id = banned_id[idx][i]
            
            if(!visited[id, default: false]) {
                visited[id] = true
                dfs(idx + 1, subArray + [id])
                visited[id] = false
            }
        }
    }
    
    dfs(0, [])
    
    return finalList
}