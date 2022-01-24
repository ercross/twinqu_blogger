class EnumConverter {
  /// [fromString] converts string to enum of type T.
  /// [values] is the list of all enums of type T.
  static T fromString<T>(List<T> values, String value) {
    value = value.toLowerCase();
    value = value.replaceAll(" ", "");
    value = value.trim();
    T t;
    try {
      t = values.firstWhere((v) {
        String treated = v.toString().split('.')[1].toLowerCase();
        return treated == value;
      });
      return t;
    } on StateError catch (_) {
      return values[0];
    }
  }
}