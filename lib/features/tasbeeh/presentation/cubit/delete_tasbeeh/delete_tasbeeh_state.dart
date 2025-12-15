part of 'delete_tasbeeh_cubit.dart';

sealed class DeleteTasbeehState extends Equatable {
  const DeleteTasbeehState();

  @override
  List<Object> get props => [];
}

final class DeleteTasbeehInitial extends DeleteTasbeehState {}

final class DeleteTasbeehLoading extends DeleteTasbeehState {}

final class DeleteTasbeehSuccess extends DeleteTasbeehState {}

final class DeleteTasbeehFailure extends DeleteTasbeehState {
  final String error;
  const DeleteTasbeehFailure({required this.error});

  @override
  List<Object> get props => [error];
}
