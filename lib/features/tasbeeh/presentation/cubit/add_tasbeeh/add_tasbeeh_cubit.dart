import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';
import 'package:rahma_project/features/tasbeeh/domain/repositories/tasbeeh_repository.dart';

part 'add_tasbeeh_state.dart';

class AddTasbeehCubit extends Cubit<AddTasbeehState> {
  AddTasbeehCubit({required this.tasbeehRepository}) : super(AddTasbeehInitial());
  final TasbeehRepository tasbeehRepository;

  Future<void> createTasbeeh({required String content, String? description}) async {
    emit(AddTasbeehLoading());
    final TasbeehEntity tasbeehEntity = TasbeehEntity(content: content, category: 'تسابيح', count: '0', description: description ?? "");
    final result = await tasbeehRepository.createTasbeeh(tasbeehEntity);
    result.fold((failure) => emit(AddTasbeehFailure(error: failure.error)), (tasbeeh) => emit(AddTasbeehSuccess()));
  }
}
