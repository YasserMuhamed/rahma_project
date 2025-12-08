import 'package:hive/hive.dart';

part 'azkar_entity.g.dart';

@HiveType(typeId: 4)
class AzkarEntity {
  @HiveField(0)
  final String category;
  @HiveField(1)
  final String count;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String content;

  const AzkarEntity({
    required this.category,
    required this.count,
    required this.description,
    required this.content,
  });

  factory AzkarEntity.fromJson(Map<String, dynamic> json) => AzkarEntity(
    category: json['category'],
    count: json['count'],
    description: json['description'],
    content: json['content'],
  );
}
