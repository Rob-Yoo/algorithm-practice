import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let aAscii = Int(UnicodeScalar("a").value)
    let zAscii = Int(UnicodeScalar("z").value)
    let s = s.map { String($0) }
    var result = ""
    
    for alph in s {
        var ascii = Int(UnicodeScalar(alph)!.value)
        var convertedAlph = ""
        var i = 1
        
        while (i <= index) {
            ascii = (ascii + 1 > zAscii) ? aAscii : ascii + 1
            convertedAlph = String(UnicodeScalar(ascii)!)

            if (!skip.contains(convertedAlph)) { i += 1 }
        }
        
        result += convertedAlph
    }
    return result
}