import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/web.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';
import 'package:rahma_project/features/tasbeeh/domain/repositories/tasbeeh_repository.dart';

part 'update_tasbeeh_state.dart';

class UpdateTasbeehCubit extends Cubit<UpdateTasbeehState> {
  UpdateTasbeehCubit({required this.tasbeehRepository}) : super(UpdateTasbeehInitial());
  final TasbeehRepository tasbeehRepository;

  Future<void> updateTasbeeh({required TasbeehEntity item}) async {
    emit(UpdateTasbeehLoading());
    Logger().w("Cubiiiiiit Tasbeeh with id ${item.toString()} updated");
    final result = await tasbeehRepository.updateTasbeeh(item);
    result.fold((failure) => emit(UpdateTasbeehFailure(error: failure.error)), (tasbeeh) => emit(UpdateTasbeehSuccess()));
  }
}
