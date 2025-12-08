import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:rahma_project/core/error/failure.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/features/azkar/data/datasources/azkar_local_ds.dart';
import 'package:rahma_project/features/azkar/domain/entities/azkar_entity.dart';
import 'package:rahma_project/features/azkar/domain/repositories/azkar_repository.dart';

class AzkarRepositoryImplementation implements AzkarRepository {
  final AzkarLocalDs azkarLocalDs;
  AzkarRepositoryImplementation({required this.azkarLocalDs});

  @override
  Future<Either<Failure, List<AzkarEntity>>> getAzkarByCategory(String category) async {
    try {
      final localAzkar = await azkarLocalDs.getAzkarByCategoryFromHive(category);
      if (!localAzkar.isNullOrEmpty()) {
        Logger().e("azkar in category $category loaded from hive with length ${localAzkar.length}");
        return Right(localAzkar);
      }
      final azkar = await azkarLocalDs.getAzkarByCategoryFromFile(category);
      Logger().e("azkar in category $category loaded from File with length ${azkar.length}");
      await azkarLocalDs.saveAzkarToHive(category, azkar);
      Logger().e("azkar in category $category saved to hive with length ${azkar.length}");
      return Right(azkar);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getAzkarCategories() async {
    try {
      final localCategories = await azkarLocalDs.getAzkarCategoriesFromHive();
      if (!localCategories.isNullOrEmpty()) {
        Logger().w("Categories loaded from hive with length ${localCategories.length}");
        return Right(localCategories);
      }
      final categories = await azkarLocalDs.getAzkarCategoriesFromFile();
      Logger().w("Categories loaded from file with length ${categories.length}");
      await azkarLocalDs.saveCategoriesToHive(categories);
      Logger().w("Categories saved to hive with length ${categories.length}");
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
