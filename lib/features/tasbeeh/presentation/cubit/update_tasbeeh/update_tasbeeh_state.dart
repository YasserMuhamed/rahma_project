part of 'update_tasbeeh_cubit.dart';

sealed class UpdateTasbeehState extends Equatable {
  const UpdateTasbeehState();

  @override
  List<Object> get props => [];
}

final class UpdateTasbeehInitial extends UpdateTasbeehState {}

final class UpdateTasbeehLoading extends UpdateTasbeehState {}

final class UpdateTasbeehSuccess extends UpdateTasbeehState {}

final class UpdateTasbeehFailure extends UpdateTasbeehState {
  const UpdateTasbeehFailure({required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
