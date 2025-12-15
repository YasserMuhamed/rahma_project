part of 'add_tasbeeh_cubit.dart';

sealed class AddTasbeehState extends Equatable {
  const AddTasbeehState();

  @override
  List<Object> get props => [];
}

final class AddTasbeehInitial extends AddTasbeehState {}

final class AddTasbeehLoading extends AddTasbeehState {}

final class AddTasbeehSuccess extends AddTasbeehState {}

final class AddTasbeehFailure extends AddTasbeehState {
  final String error;
  const AddTasbeehFailure({required this.error});

  @override
  List<Object> get props => [error];
}
