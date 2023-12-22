func solution(_ s:String) -> String {
    var shouldConvertToUppercase = true
    var result = ""

    let s = s.forEach {
        if ($0.isLetter) {
            if (shouldConvertToUppercase) {
                result.append($0.uppercased())
                shouldConvertToUppercase = false
            } else {
                result.append($0.lowercased())
            }
        } else {
            shouldConvertToUppercase = $0.isWhitespace ? true : false
            result.append($0)
        }
    }
    
    return result
}