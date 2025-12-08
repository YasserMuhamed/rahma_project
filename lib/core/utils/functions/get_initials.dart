String getInitials(String name) {
  List<String> nameParts = name.split(' ');
  String initials = '';
  for (int i = 0; i < nameParts.length && i < 2; i++) {
    if (nameParts[i].isNotEmpty) {
      initials += nameParts[i][0].toUpperCase();
    }
  }
  return initials;
}
