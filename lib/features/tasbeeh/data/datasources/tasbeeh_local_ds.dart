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
    tasabeehList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return tasabeehList;
  }

  Future<void> saveTasbeehToHive(List<TasbeehEntity> tasbeeh) async {
    final box = Hive.box(HiveKeys.tasabeeh);
    await box.clear();
    // Save each item using its id as the key
    for (var item in tasbeeh) {
      await box.put(item.id, item);
    }
    Logger().i("Saved ${tasbeeh.length} tasbeeh items to Hive with unique IDs");
  }

  Future<void> createTasbeeh(TasbeehEntity tasbeeh) async {
    final box = Hive.box(HiveKeys.tasabeeh);
    await box.put(tasbeeh.id, tasbeeh);
    Logger().i("Tasbeeh with id ${tasbeeh.id} saved to hive");
  }

  Future<void> deleteTasbeeh(TasbeehEntity tasbeeh) async {
    final box = Hive.box(HiveKeys.tasabeeh);
    var isExist = box.containsKey(tasbeeh.id);
    if (!isExist) {
      throw Exception("Tasbeeh with id ${tasbeeh.id} not found in hive");
    }
    await box.delete(tasbeeh.id);
    Logger().i("Tasbeeh with id ${tasbeeh.id} deleted from hive");
  }

  Future<void> updateTasbeeh(TasbeehEntity tasbeeh) async {
    final box = Hive.box(HiveKeys.tasabeeh);
    var isExist = box.containsKey(tasbeeh.id);
    if (!isExist) {
      Logger().e("Tasbeeh with id ${tasbeeh.id} not found in hive");
      return;
    }
    await box.put(tasbeeh.id, tasbeeh);
    Logger().i("Tasbeeh with id ${tasbeeh.id} updated in hive");
  }

  Future<TasbeehEntity> increaseTasbeehClicks(String id) async {
    final box = Hive.box(HiveKeys.tasabeeh);
    var isExist = box.containsKey(id);
    if (!isExist) {
      throw Exception("Tasbeeh with id $id not found in hive");
    }
    final item = box.get(id);
    final updatedItem = item.copyWith(clicks: item.clicks + 1);
    await box.put(id, updatedItem);
    return updatedItem;
  }

  Future<TasbeehEntity> resetTasbeehClicks(String id) async {
    final box = Hive.box(HiveKeys.tasabeeh);
    var isExist = box.containsKey(id);
    if (!isExist) {
      throw Exception("Tasbeeh with id $id not found in hive");
    }
    final item = box.get(id);
    final updatedItem = item.copyWith(clicks: 0);
    await box.put(id, updatedItem);
    return updatedItem;
  }
}
