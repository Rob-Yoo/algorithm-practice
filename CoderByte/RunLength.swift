func RunLength(_ str: String) -> String {
  let chars = str.map { String($0) }
  var current = ""
  var count = 0
  var result = ""

  for char in chars {
    if current == char {
      count += 1 
    } else {
      if count != 0 {
        result += "\(count)\(current)"
      }

      current = char
      count = 1 
    }
  }

  result += "\(count)\(current)"
  return result

}

// keep this function call here   
print(RunLength(readLine(stripNewline: true)));