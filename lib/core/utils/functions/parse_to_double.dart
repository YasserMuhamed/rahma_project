double parseToDouble(dynamic value) {
  if (value == null) return 0.0;

  if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  } else if (value is String) {
    return double.tryParse(value) ?? 0.0;
  } else {
    throw ArgumentError("Unsupported type: ${value.runtimeType}");
  }
}
