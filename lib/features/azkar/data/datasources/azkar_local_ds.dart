import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:rahma_project/core/helpers/hive_keys.dart';
import 'package:rahma_project/features/azkar/data/models/azkar_model.dart';
import 'package:rahma_project/features/azkar/domain/entities/azkar_entity.dart';

class AzkarLocalDs {
  Future<List<String>> getAzkarCategoriesFromFile() async {
    final String jsonString = await rootBundle.loadString('assets/json/azkar.json');
    final dynamic data = jsonDecode(jsonString);
    final azkar = AzkarModel.fromJson(data);
    return azkar.azkarData.keys.toList();
  }

  Future<void> saveCategoriesToHive(List<String> categories) async {
    final box = Hive.box<String>(HiveKeys.azkarCategories);
    await box.clear();
    await box.addAll(categories);
  }

  Future<List<String>> getAzkarCategoriesFromHive() async {
    final box = Hive.box<String>(HiveKeys.azkarCategories);
    return box.values.toList();
  }

  Future<List<AzkarEntity>> getAzkarByCategoryFromFile(String category) async {
    final String jsonString = await rootBundle.loadString('assets/json/azkar.json');
    final dynamic data = jsonDecode(jsonString);

    final azkarModel = AzkarModel.fromJson(data);

    if (azkarModel.azkarData.containsKey(category)) {
      return azkarModel.azkarData[category] ?? [];
    }
    return [];
  }

  Future<void> saveAzkarToHive(String category, List<AzkarEntity> azkar) async {
    final box = Hive.box<List<AzkarEntity>>(HiveKeys.azkar);
    await box.delete(category);
    await box.put(category, azkar);
  }

  Future<List<AzkarEntity>> getAzkarByCategoryFromHive(String category) async {
    final box = Hive.box<List<AzkarEntity>>(HiveKeys.azkar);
    var azkar = box.get(category) ?? [];
    Logger().e("azkar in category $category loaded from hive with length ${azkar.length}");
    return azkar;
  }
}
