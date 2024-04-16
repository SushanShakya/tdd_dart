bool isPalindrome(String value) {
  if (value.isEmpty) return true;
  if (value.length == 1) return true;
  var startIndex = 0;
  var lastIndex = value.length - 1;
  while (startIndex < lastIndex) {
    final ok = value[startIndex] == value[lastIndex];
    if (!ok) {
      return false;
    }
    startIndex++;
    lastIndex--;
  }
  return true;
}
