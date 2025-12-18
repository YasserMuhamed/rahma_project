part of 'prayer_cubit.dart';

abstract class PrayerState {}

class PrayerInitial extends PrayerState {}

class PrayerLoading extends PrayerState {}

class PrayerLoaded extends PrayerState {
  final PrayerEntity prayer;
  final String address;
  final bool isStale; // Indicates if this is old cached data
  final String? warningMessage; // Optional warning (location/network issues)

  PrayerLoaded({required this.prayer, required this.address, this.isStale = false, this.warningMessage});
}

class PrayerError extends PrayerState {
  final String message;
  PrayerError({required this.message});
}

class PrayerLocationChanged extends PrayerState {}
