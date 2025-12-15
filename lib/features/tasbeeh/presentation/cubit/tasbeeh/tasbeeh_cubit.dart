import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';
import 'package:rahma_project/features/tasbeeh/domain/repositories/tasbeeh_repository.dart';

part 'tasbeeh_state.dart';

class TasbeehCubit extends Cubit<TasbeehState> {
  TasbeehCubit({required this.tasbeehRepository}) : super(TasbeehInitial());
  final TasbeehRepository tasbeehRepository;

  Future<void> getTasbeeh() async {
    emit(TasbeehLoading());
    final result = await tasbeehRepository.getTasbeeh();
    Logger().w("Tasbeeh loaded with length ${result.fold((failure) => [], (tasbeeh) => tasbeeh).length}");
    result.fold((failure) => emit(TasbeehFailure(error: failure.error)), (tasbeeh) => emit(TasbeehLoaded(tasbeehList: tasbeeh)));
  }
}
