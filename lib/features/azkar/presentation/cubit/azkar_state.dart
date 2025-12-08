part of 'azkar_cubit.dart';

abstract class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object> get props => [];
}

class AzkarInitial extends AzkarState {}

class AzkarCategoriesLoading extends AzkarState {}

class AzkarCategoriesLoaded extends AzkarState {
  final List<String> azkarCategories;
  const AzkarCategoriesLoaded({required this.azkarCategories});

  @override
  List<Object> get props => [azkarCategories];
}

class AzkarCategoriesFailure extends AzkarState {
  final String error;
  const AzkarCategoriesFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class AzkarLoading extends AzkarState {}

class AzkarLoaded extends AzkarState {
  final List<AzkarEntity> azkarList;
  const AzkarLoaded({required this.azkarList});

  @override
  List<Object> get props => [azkarList];
}

class AzkarFailure extends AzkarState {
  final String error;
  const AzkarFailure({required this.error});
}
