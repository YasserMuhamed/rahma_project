String normalizeEgyptianPhone(String input) {
  String digits = input.replaceAll(RegExp(r'\D'), '');

  if (digits.startsWith('20') && digits.length == 12) {
    return '+$digits';
  }

  if (digits.startsWith('0') && digits.length == 11) {
    return '+2$digits';
  }

  if (digits.startsWith('1') && digits.length == 10) {
    return '+20$digits';
  }

  if (input.startsWith('+20') && digits.length == 12) {
    return '+$digits';
  }

  return '+$digits';
}
