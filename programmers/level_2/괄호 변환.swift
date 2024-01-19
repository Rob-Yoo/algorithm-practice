import Foundation

var result = ""

func solution(_ p:String) -> String {
    let p = p.map { String($0) }
    
    convertValidBracketString(p)
    return result
}

func convertValidBracketString(_ brackets: [String]) {
    let (u, v, isValidateBracketString) = splitBracketsString(brackets)
    
    if (u.isEmpty) { return }
    
    if (isValidateBracketString) { 
        result += u.joined()
        convertValidBracketString(v)
    } else {
        result += "("
        convertValidBracketString(v)
        result += ")"
        result += flipBracketString(u)
    }
    
}

func splitBracketsString(_ brackets: [String]) -> (u: [String], v: [String], isValidateBracketString: Bool) {
    var u = [String]()
    var v = [String]()
    var isValidateBracketString = true
    var numberOfLeftBracket = 0
    var numberOfRightBracket = 0
    var vStartIdx = brackets.count
    
    for (idx, bracket) in brackets.enumerated() {
        
        if (u.isEmpty && bracket == ")") { isValidateBracketString = false }
        
        u.append(bracket)
        
        if (bracket == "(") { numberOfLeftBracket += 1 }
        else if (bracket == ")") { numberOfRightBracket += 1 }
        
        if (numberOfLeftBracket == numberOfRightBracket) {
            vStartIdx = idx + 1
            break
        }
    }
    
    if (vStartIdx < brackets.count) {
        v = Array<String>(brackets[vStartIdx..<brackets.count])
    }
    
    return (u: u, v: v, isValidateBracketString: isValidateBracketString)
}

func flipBracketString(_ u: [String]) -> String {
    var flipped = ""
    
    for i in 0..<u.count {
        if (i == 0 || i == u.count - 1) { continue }
        
        if (u[i] == "(") { flipped += ")" }
        else { flipped += "(" }
    }
    
    return flipped
}