import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';
import 'package:rahma_project/features/tasbeeh/domain/repositories/tasbeeh_repository.dart';

part 'update_tasbeeh_state.dart';

class UpdateTasbeehCubit extends Cubit<UpdateTasbeehState> {
  UpdateTasbeehCubit({required this.tasbeehRepository}) : super(UpdateTasbeehInitial());
  final TasbeehRepository tasbeehRepository;

  Future<void> updateTasbeeh({required String id, required String content, String? description}) async {
    emit(UpdateTasbeehLoading());
    Logger().w("Tasbeeh with content $content and description $description updated");
    final TasbeehEntity item = TasbeehEntity(id: id, content: content, category: 'تسابيح', count: '0', description: description ?? "");
    final result = await tasbeehRepository.updateTasbeeh(item);
    result.fold((failure) => emit(UpdateTasbeehFailure(error: failure.error)), (tasbeeh) => emit(UpdateTasbeehSuccess()));
  }
}
