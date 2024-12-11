func PalindromeTwo(_ str: String) -> String {
  let str = str.filter { $0.isLetter }.lowercased().map { String($0) }
  var (left, right) = (0, str.count - 1)

  while left < right {
    if str[left] != str[right] {
      return "false"
    }
    left += 1
    right -= 1
  }
  return "true"

}

// keep this function call here   
print(PalindromeTwo(readLine(stripNewline: true)));