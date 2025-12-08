part of 'prayer_cubit.dart';

sealed class PrayerState {}

class PrayerInitial extends PrayerState {}

class PrayerLoading extends PrayerState {}

class PrayerLoaded extends PrayerState {
  final PrayerEntity prayer;
  final String? address;

  PrayerLoaded({required this.prayer, this.address});
}

class PrayerLocationChanged extends PrayerState {}

class PrayerError extends PrayerState {
  final String message;

  PrayerError({required this.message});
}
