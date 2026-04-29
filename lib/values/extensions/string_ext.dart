extension StringX on String {
  /// Capitalizes only the first letter: "flutter dev" -> "Flutter dev"
  String get capitalizeFirst => length > 0
      ? "${this[0].toUpperCase()}${substring(1)}"
      : this;

  /// Converts to Title Case: "hello world" -> "Hello World"
  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.length > 0
      ? "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}"
      : "")
      .join(' ');

  /// Improved PascalCase: "hello_world" -> "HelloWorld"
  String get toPascalCase => split(RegExp(r"[-_ ]"))
      .map((str) => str.length > 0
      ? "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}"
      : "")
      .join();

  /// Handy for validation logic
  bool get isValidEmail => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  /// Hard-strips all whitespace (useful for phone numbers/IDs)
  String get removeAllWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// Quick URL encoding for API calls
  String get urlEncode => Uri.encodeComponent(this);

  /// Returns an int if possible, otherwise null
  int? get parseInt => int.tryParse(this);

  /// Returns a double if possible, otherwise null
  double? get parseDouble => double.tryParse(this);
}

/// Extension on nullable Strings to handle 'null' safely
extension NullableStringX on String? {
  /// Returns true if null or empty
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Returns the string if not null, otherwise a placeholder (default empty)
  String orDefault([String defaultValue = ""]) => this ?? defaultValue;
}