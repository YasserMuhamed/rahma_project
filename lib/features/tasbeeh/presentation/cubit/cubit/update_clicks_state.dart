part of 'update_clicks_cubit.dart';

sealed class UpdateClicksState extends Equatable {
  const UpdateClicksState();

  @override
  List<Object> get props => [];
}

final class UpdateClicksInitial extends UpdateClicksState {}

final class UpdateClicksLoaded extends UpdateClicksState {
  final TasbeehEntity item;
  const UpdateClicksLoaded({required this.item});

  @override
  List<Object> get props => [item];
}

final class UpdateClicksFailure extends UpdateClicksState {
  final String error;
  const UpdateClicksFailure({required this.error});

  @override
  List<Object> get props => [error];
}
