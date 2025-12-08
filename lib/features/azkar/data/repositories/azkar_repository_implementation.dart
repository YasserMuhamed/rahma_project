import 'package:dartz/dartz.dart';
import 'package:rahma_project/core/error/failure.dart';
import 'package:rahma_project/features/azkar/data/datasources/azkar_local_ds.dart';
import 'package:rahma_project/features/azkar/domain/entities/azkar_entity.dart';
import 'package:rahma_project/features/azkar/domain/repositories/azkar_repository.dart';

class AzkarRepositoryImplementation implements AzkarRepository {
  final AzkarLocalDs azkarLocalDs;
  AzkarRepositoryImplementation({required this.azkarLocalDs});

  @override
  Future<Either<Failure, List<AzkarEntity>>> getAzkarByCategory(String category) async {
    try {
      final azkar = await azkarLocalDs.getAzkarByCategory(category);
      return Right(azkar);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getAzkarCategories() async {
    try {
      final categories = await azkarLocalDs.getAzkarCategories();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
