import Foundation

func solution(_ citations:[Int]) -> Int {
    let sortedCitations = citations.sorted(by: <)
    var hIndex = -1
    
    for (idx, citation) in sortedCitations.enumerated() {
        var h = citation
        
        if (sortedCitations.count - idx >= h) {
            hIndex = max(hIndex, h)
        } else {
            for hCandidate in hIndex...h {
                if (sortedCitations.count - idx >= hCandidate) {
                    hIndex = max(hIndex, hCandidate)
                } 
            }
            break
        }
    }
    
    return hIndex
}