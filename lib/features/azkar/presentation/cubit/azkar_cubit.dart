import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rahma_project/features/azkar/domain/entities/azkar_entity.dart';
import 'package:rahma_project/features/azkar/domain/repositories/azkar_repository.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit({required this.azkarRepository}) : super(AzkarInitial());
  final AzkarRepository azkarRepository;

  Future<void> getAzkarCategories() async {
    emit(AzkarCategoriesLoading());
    final result = await azkarRepository.getAzkarCategories();
    result.fold(
      (failure) => emit(AzkarCategoriesFailure(error: failure.error)),
      (categories) => emit(AzkarCategoriesLoaded(azkarCategories: categories)),
    );
  }

  Future<void> getAzkarByCategory(String category) async {
    emit(AzkarLoading());
    final result = await azkarRepository.getAzkarByCategory(category);
    result.fold((failure) => emit(AzkarFailure(error: failure.error)), (azkar) => emit(AzkarLoaded(azkarList: azkar)));
  }
}
