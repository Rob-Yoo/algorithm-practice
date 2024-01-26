import Foundation

var typePointDict = [String: Int]()

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var result = ""

    fillTypePointDict(survey, choices)
    result += getFirstType()
    result += getSecondType()
    result += getThirdType()
    result += getFourthType()
    
    return result
}

func fillTypePointDict(_ survey:[String], _ choices:[Int]) {
    for (types, point) in zip(survey, choices) {
        let type = types.map { String($0) }
        let (disagreeType, agreeType) = (type[0], type[1])
        
        switch point {
        case 1:
            typePointDict[disagreeType, default: 0] += 3
        case 2:
            typePointDict[disagreeType, default: 0] += 2
        case 3:
            typePointDict[disagreeType, default: 0] += 1
        case 5:
            typePointDict[agreeType, default: 0] += 1
        case 6:
            typePointDict[agreeType, default: 0] += 2
        case 7:
            typePointDict[agreeType, default: 0] += 3
        default:
            continue
        }
    }
}

func getFirstType() -> String {
    let R_Point = typePointDict["R", default: 0]
    let T_Point = typePointDict["T", default: 0]
    
    if (T_Point > R_Point) {
        return "T"
    } else {
        return "R"
    }
}

func getSecondType() -> String {
    let C_Point = typePointDict["C", default: 0]
    let F_Point = typePointDict["F", default: 0]
    
    if (F_Point > C_Point) {
        return "F"
    } else {
        return "C"
    }
}

func getThirdType() -> String {
    let J_Point = typePointDict["J", default: 0]
    let M_Point = typePointDict["M", default: 0]
    
    if (M_Point > J_Point) {
        return "M"
    } else {
        return "J"
    }
}

func getFourthType() -> String {
    let A_Point = typePointDict["A", default: 0]
    let N_Point = typePointDict["N", default: 0]
    
    if (N_Point > A_Point) {
        return "N"
    } else {
        return "A"
    }
}