import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

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
  @HiveField(5)
  final String id;
  @HiveField(6)
  final DateTime createdAt;

  const TasbeehEntity({
    required this.category,
    required this.count,
    required this.description,
    required this.content,
    this.clicks = 0,
    required this.id,
    required this.createdAt,
  });

  // Factory with automatic ID generation
  factory TasbeehEntity.create({
    required String category,
    required String count,
    required String description,
    required String content,
    int clicks = 0,
  }) {
    return TasbeehEntity(
      category: category,
      count: count,
      description: description,
      content: content,
      clicks: clicks,
      id: const Uuid().v4(),
      createdAt: DateTime.now(),
    );
  }

  factory TasbeehEntity.fromJson(Map<String, dynamic> json) => TasbeehEntity(
    category: json['category'],
    count: json['count'],
    description: json['description'],
    content: json['content'],
    clicks: json['clicks'] ?? 0,
    id: json['id'] ?? const Uuid().v4(),
    createdAt: DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    'category': category,
    'count': count,
    'description': description,
    'content': content,
    'clicks': clicks,
    'id': id,
    'createdAt': createdAt.toIso8601String(),
  };

  TasbeehEntity copyWith({
    String? category,
    String? count,
    String? description,
    String? content,
    int? clicks,
    String? id,
    DateTime? createdAt,
  }) {
    return TasbeehEntity(
      category: category ?? this.category,
      count: count ?? this.count,
      description: description ?? this.description,
      content: content ?? this.content,
      clicks: clicks ?? this.clicks,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [category, count, description, content, clicks, id];
}
