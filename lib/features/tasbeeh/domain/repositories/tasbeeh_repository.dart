import 'package:dartz/dartz.dart';
import 'package:rahma_project/core/error/failure.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';

abstract class TasbeehRepository {
  Future<Either<Failure, List<TasbeehEntity>>> getTasbeeh();
  Future<Either<Failure, void>> createTasbeeh(TasbeehEntity tasbeeh);
  Future<Either<Failure, void>> deleteTasbeeh(TasbeehEntity tasbeeh);
  Future<Either<Failure, void>> updateTasbeeh(TasbeehEntity tasbeeh);
  Future<Either<Failure, TasbeehEntity>> increaseTasbeehClicks(String id);
  Future<Either<Failure, TasbeehEntity>> resetTasbeehClicks(String id);
}
