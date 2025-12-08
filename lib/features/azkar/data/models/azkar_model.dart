import 'package:equatable/equatable.dart';
import 'package:rahma_project/features/azkar/domain/entities/azkar_entity.dart';

class AzkarModel extends Equatable {
  final Map<String, List<Zekr>> azkarData;

  const AzkarModel({required this.azkarData});

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    Map<String, List<Zekr>> azkarData = {};

    json.forEach((category, zekrs) {
      if (zekrs is List) {
        azkarData[category] = zekrs.map((zekr) => Zekr.fromJson(zekr as Map<String, dynamic>)).toList();
      }
    });

    return AzkarModel(azkarData: azkarData);
  }

  @override
  List<Object?> get props => [azkarData];
}

class Zekr extends AzkarEntity with EquatableMixin {
  @override
  final String category;
  @override
  final String count;
  @override
  final String description;
  final String reference;
  @override
  final String content;

  const Zekr({required this.category, required this.count, required this.description, required this.reference, required this.content})
    : super(category: category, count: count, description: description, content: content);

  factory Zekr.fromJson(Map<String, dynamic> json) {
    return Zekr(
      category: json['category'],
      count: json['count'],
      description: json['description'],
      reference: json['reference'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'category': category, 'count': count, 'description': description, 'reference': reference, 'content': content};
  }

  @override
  List<Object?> get props => [category, count, description, reference, content];
}
