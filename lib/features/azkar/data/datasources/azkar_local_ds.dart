import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rahma_project/features/azkar/data/models/azkar_model.dart';
import 'package:rahma_project/features/azkar/domain/entities/azkar_entity.dart';

class AzkarLocalDs {
  Future<List<String>> getAzkarCategories() async {
    final String jsonString = await rootBundle.loadString('assets/json/azkar.json');
    final dynamic data = jsonDecode(jsonString);
    final azkar = AzkarModel.fromJson(data);
    return azkar.azkarData.keys.toList();
  }

  Future<List<AzkarEntity>> getAzkarByCategory(String category) async {
    final String jsonString = await rootBundle.loadString('assets/json/azkar.json');
    final dynamic data = jsonDecode(jsonString);

    final azkarModel = AzkarModel.fromJson(data);

    if (azkarModel.azkarData.containsKey(category)) {
      return azkarModel.azkarData[category] as List<AzkarEntity>;
    }
    return [];
  }
}
