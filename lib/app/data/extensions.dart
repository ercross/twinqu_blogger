extension StringUtils on String {
  /// capitalizes the first letter of any word
  String toSentenceCase() {
    if (isEmpty) return "";
    final firstChar = substring(0, 1).toUpperCase();
    if (length == 1) return firstChar;
    final remainingChars = substring(1);
    return firstChar + remainingChars;
  }
}
