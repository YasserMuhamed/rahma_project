class ValidationUtils {
  ValidationUtils._();
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null ||
        value.isEmpty ||
        password == null ||
        password.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }

    // Remove spaces, dashes, parentheses, etc.
    final cleaned = value.replaceAll(RegExp(r'\D'), '');

    // Egyptian mobile numbers are 11 digits if written locally (01XXXXXXXXX)
    // or 12 digits if prefixed with country code 20 (201XXXXXXXXX)
    if (cleaned.startsWith('0') && cleaned.length == 11) {
      return null; // ✅ Valid local format
    }

    if (cleaned.startsWith('20') && cleaned.length == 12) {
      return null; // ✅ Valid international format
    }

    if (cleaned.startsWith('+20') && cleaned.length == 13) {
      return null; // ✅ Valid international with "+"
    }

    return 'Please enter a valid Egyptian phone number';
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  static String? validateFiveDigitCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the 5-digit code';
    }
    if (!RegExp(r'^[0-9]{5}$').hasMatch(value)) {
      return 'Code must be exactly 5 digits';
    }
    return null;
  }
}
