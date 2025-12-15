import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:rahma_project/core/helpers/hive_keys.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';

class TasbeehLocalDs {
  Future<List<TasbeehEntity>> getTasbeehFromFile() async {
    final String jsonString = await rootBundle.loadString('assets/json/tasabeeh.json');
    final dynamic data = jsonDecode(jsonString);
    final tasabeehList = (data["tasabeeh"] as List).map((e) => TasbeehEntity.fromJson(e)).toList();
    return tasabeehList;
  }

  Future<List<TasbeehEntity>> getTasbeehFromHive() async {
    final box = Hive.box(HiveKeys.tasabeeh);
    final dynamic data = box.values.toList();
    final tasabeehList = (data as List).cast<TasbeehEntity>();
    return tasabeehList;
  }

  Future<void> saveTasbeehToHive(List<TasbeehEntity> tasbeeh) async {
    final box = Hive.box(HiveKeys.tasabeeh);
    await box.clear();
    await box.addAll(tasbeeh);
  }

  Future<void> createTasbeeh(TasbeehEntity tasbeeh) async {
    final box = Hive.box(HiveKeys.tasabeeh);
    await box.add(tasbeeh);
    Logger().i("Tasbeeh with content ${tasbeeh.content} saved to hive");
  }

  Future<void> deleteTasbeeh(TasbeehEntity tasbeeh) async {
    final box = Hive.box(HiveKeys.tasabeeh);
    var isExist = box.containsKey(tasbeeh.content);
    if (!isExist) return;
    await box.delete(tasbeeh.content);
    Logger().i("Tasbeeh with content ${tasbeeh.content} deleted from hive");
  }

  Future<void> updateTasbeeh(TasbeehEntity tasbeeh) async {
    final box = Hive.box(HiveKeys.tasabeeh);
    var isExist = box.containsKey(tasbeeh.content);
    if (!isExist) return;
    await box.put(tasbeeh.content, tasbeeh);
    Logger().i("Tasbeeh with content ${tasbeeh.content} updated in hive");
  }

  // Future<List<String>> getAzkarCategoriesFromFile() async {
  //   final String jsonString = await rootBundle.loadString('assets/json/azkar.json');
  //   final dynamic data = jsonDecode(jsonString);
  //   final azkar = AzkarModel.fromJson(data);
  //   return azkar.azkarData.keys.toList();
  // }

  // Future<void> saveCategoriesToHive(List<String> categories) async {
  //   final box = Hive.box<String>(HiveKeys.azkarCategories);
  //   await box.clear();
  //   await box.addAll(categories);
  // }

  // Future<List<String>> getAzkarCategoriesFromHive() async {
  //   final box = Hive.box<String>(HiveKeys.azkarCategories);
  //   return box.values.toList();
  // }

  // Future<List<AzkarEntity>> getAzkarByCategoryFromFile(String category) async {
  //   final String jsonString = await rootBundle.loadString('assets/json/azkar.json');
  //   final dynamic data = jsonDecode(jsonString);

  //   final azkarModel = AzkarModel.fromJson(data);

  //   if (azkarModel.azkarData.containsKey(category)) {
  //     return azkarModel.azkarData[category] ?? [];
  //   }
  //   return [];
  // }

  // Future<void> saveAzkarToHive(String category, List<AzkarEntity> azkar) async {
  //   final box = Hive.box(HiveKeys.azkar); // Changed from box<List<AzkarEntity>>
  //   await box.delete(category);
  //   await box.put(category, azkar);
  // }

  // Future<List<AzkarEntity>> getAzkarByCategoryFromHive(String category) async {
  //   final box = Hive.box(HiveKeys.azkar); // Changed from box<List<AzkarEntity>>
  //   final dynamic data = box.get(category);

  //   if (data == null) return [];

  //   final azkar = (data as List).cast<AzkarEntity>();

  //   Logger().e("azkar in category $category loaded from hive with length ${azkar.length}");
  //   return azkar;
  // }
}
