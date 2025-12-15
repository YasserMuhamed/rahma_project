import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'tasbeeh_entity.g.dart';

@HiveType(typeId: 5)
class TasbeehEntity extends Equatable {
  @HiveField(0)
  final String category;
  @HiveField(1)
  final String count;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String content;
  @HiveField(4)
  final int clicks;

  const TasbeehEntity({required this.category, required this.count, required this.description, required this.content, this.clicks = 0});

  factory TasbeehEntity.fromJson(Map<String, dynamic> json) =>
      TasbeehEntity(category: json['category'], count: json['count'], description: json['description'], content: json['content']);

  @override
  List<Object?> get props => [category, count, description, content, clicks];
}
