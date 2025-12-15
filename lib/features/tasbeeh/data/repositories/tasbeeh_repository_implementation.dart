import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:rahma_project/core/error/failure.dart';
import 'package:rahma_project/core/helpers/extensions.dart';

import 'package:rahma_project/features/tasbeeh/data/datasources/tasbeeh_local_ds.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';
import 'package:rahma_project/features/tasbeeh/domain/repositories/tasbeeh_repository.dart';

class TasbeehRepositoryImplementation implements TasbeehRepository {
  final TasbeehLocalDs tasbeehLocalDs;
  TasbeehRepositoryImplementation({required this.tasbeehLocalDs});

  @override
  Future<Either<Failure, void>> createTasbeeh(TasbeehEntity tasbeeh) async {
    try {
      tasbeehLocalDs.createTasbeeh(tasbeeh);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTasbeeh(TasbeehEntity tasbeeh) async {
    try {
      tasbeehLocalDs.deleteTasbeeh(tasbeeh);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TasbeehEntity>>> getTasbeeh() async {
    try {
      final tasbeeh = await tasbeehLocalDs.getTasbeehFromHive();
      if (tasbeeh.isNullOrEmpty()) {
        final tasbeehFromFile = await tasbeehLocalDs.getTasbeehFromFile();
        Logger().w("Tasbeeh loaded from file with length ${tasbeehFromFile.length}");
        await tasbeehLocalDs.saveTasbeehToHive(tasbeehFromFile);
        Logger().w("Tasbeeh saved to hive with length ${tasbeehFromFile.length}");
        return Right(tasbeehFromFile);
      }
      Logger().w("Tasbeeh loaded from hive with length ${tasbeeh.length}");
      return Right(tasbeeh);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateTasbeeh(TasbeehEntity tasbeeh) async {
    try {
      tasbeehLocalDs.updateTasbeeh(tasbeeh);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
