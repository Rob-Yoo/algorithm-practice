import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var checkSeqForCards1 = -1
    var checkSeqForCards2 = -1
    var isImpossible = false

    
    for goalCard in goal {
        if let seq = cards1.firstIndex(of: goalCard) {
            if (checkSeqForCards1 + 1 == seq) {
                checkSeqForCards1 = seq
                continue
            } else {
                isImpossible = true
                break   
            }
        }
        
        if let seq = cards2.firstIndex(of: goalCard) {
            if (checkSeqForCards2 + 1 == seq) {
                checkSeqForCards2 = seq
                continue
            } else {
                isImpossible = true
                break   
            }
        }

    }
    
    return isImpossible ? "No" : "Yes"
}