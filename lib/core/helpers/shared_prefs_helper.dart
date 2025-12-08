import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Helper class for managing local and secure storage operations.
/// Provides static methods for saving, retrieving, and removing data.
class SharedPrefsHelper {
  SharedPrefsHelper._();

  /// Removes a value from SharedPreferences with the given [key].
  static Future<void> removeData(String key) async {
    debugPrint('StorageHelper: Removed data with key: $key');
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  /// Clears all data from SharedPreferences.
  static Future<void> clearAllData() async {
    debugPrint('StorageHelper: Cleared all SharedPreferences data');
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  /// Saves a [value] with a [key] in SharedPreferences.
  static Future<void> setData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint('StorageHelper: setData with key: $key and value: $value');
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    }
  }

  /// Gets a bool value from SharedPreferences with the given [key].
  static Future<bool?> getBool(String key) async {
    debugPrint('StorageHelper: getBool with key: $key');
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  /// Gets a double value from SharedPreferences with the given [key].
  static Future<double?> getDouble(String key) async {
    debugPrint('StorageHelper: getDouble with key: $key');
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  /// Gets an int value from SharedPreferences with the given [key].
  static Future<int?> getInt(String key) async {
    debugPrint('StorageHelper: getInt with key: $key');
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  /// Gets a String value from SharedPreferences with the given [key].
  static Future<String?> getString(String key) async {
    debugPrint('StorageHelper: getString with key: $key');
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  /// Saves a [value] with a [key] in FlutterSecureStorage.
  static Future<void> setSecuredString(String key, String value) async {
    const storage = FlutterSecureStorage();
    debugPrint(
      'StorageHelper: setSecuredString with key: $key and value: $value',
    );
    await storage.write(key: key, value: value);
  }

  /// Gets a String value from FlutterSecureStorage with the given [key].
  static Future<String?> getSecuredString(String key) async {
    const storage = FlutterSecureStorage();
    debugPrint('StorageHelper: getSecuredString with key: $key');
    return await storage.read(key: key);
  }

  /// Removes a value from FlutterSecureStorage with the given [key].
  static Future<void> removeSecuredString(String key) async {
    const storage = FlutterSecureStorage();
    debugPrint('StorageHelper: removeSecuredString with key: $key');
    await storage.delete(key: key);
  }

  /// Clears all data from FlutterSecureStorage.
  static Future<void> clearAllSecuredData() async {
    debugPrint('StorageHelper: Cleared all FlutterSecureStorage data');
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
