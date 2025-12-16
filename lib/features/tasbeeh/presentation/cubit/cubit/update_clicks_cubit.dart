import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';
import 'package:rahma_project/features/tasbeeh/domain/repositories/tasbeeh_repository.dart';

part 'update_clicks_state.dart';

class UpdateClicksCubit extends Cubit<UpdateClicksState> {
  UpdateClicksCubit({required this.tasbeehRepository}) : super(UpdateClicksInitial());
  final TasbeehRepository tasbeehRepository;

  Future<void> updateClicks({required String id}) async {
    final result = await tasbeehRepository.increaseTasbeehClicks(id);
    result.fold((failure) => emit(UpdateClicksFailure(error: failure.error)), (tasbeeh) => emit(UpdateClicksLoaded(item: tasbeeh)));
  }

  Future<void> resetClicks({required String id}) async {
    final result = await tasbeehRepository.resetTasbeehClicks(id);
    result.fold((failure) => emit(UpdateClicksFailure(error: failure.error)), (tasbeeh) => emit(UpdateClicksLoaded(item: tasbeeh)));
  }
}
