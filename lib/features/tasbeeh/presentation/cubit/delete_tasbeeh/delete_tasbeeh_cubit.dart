import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';
import 'package:rahma_project/features/tasbeeh/domain/repositories/tasbeeh_repository.dart';

part 'delete_tasbeeh_state.dart';

class DeleteTasbeehCubit extends Cubit<DeleteTasbeehState> {
  DeleteTasbeehCubit({required this.tasbeehRepository}) : super(DeleteTasbeehInitial());
  final TasbeehRepository tasbeehRepository;

  Future<void> deleteTasbeeh({required TasbeehEntity item}) async {
    emit(DeleteTasbeehLoading());
    final result = await tasbeehRepository.deleteTasbeeh(item);
    result.fold((failure) => emit(DeleteTasbeehFailure(error: failure.error)), (tasbeeh) => emit(DeleteTasbeehSuccess()));
  }
}
