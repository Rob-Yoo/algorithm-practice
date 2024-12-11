func BracketMatcher(_ str: String) -> String {

  var stack = ""
  let chars = str.map { String($0) }

  for char in chars {
    if char == "(" {
      stack += char
    } else if char == ")" {
      if let leftBracket = stack.last {
        stack.removeLast()
      } else {
        return "0"

      }
    }
  }

  return stack.isEmpty ? "1" : "0"

}

// keep this function call here   
print(BracketMatcher(readLine(stripNewline: true)));