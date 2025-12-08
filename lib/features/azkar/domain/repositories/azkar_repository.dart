import 'package:dartz/dartz.dart';
import 'package:rahma_project/core/error/failure.dart';
import 'package:rahma_project/features/azkar/domain/entities/azkar_entity.dart';

abstract class AzkarRepository {
  Future<Either<Failure, List<String>>> getAzkarCategories();
  Future<Either<Failure, List<AzkarEntity>>> getAzkarByCategory(
    String category,
  );
}
