part of 'tasbeeh_cubit.dart';

sealed class TasbeehState extends Equatable {
  const TasbeehState();

  @override
  List<Object> get props => [];
}

final class TasbeehInitial extends TasbeehState {}

final class TasbeehLoading extends TasbeehState {}

final class TasbeehLoaded extends TasbeehState {
  final List<TasbeehEntity> tasbeehList;
  const TasbeehLoaded({required this.tasbeehList});

  @override
  List<Object> get props => [tasbeehList];
}

final class TasbeehFailure extends TasbeehState {
  final String error;
  const TasbeehFailure({required this.error});

  @override
  List<Object> get props => [error];
}
