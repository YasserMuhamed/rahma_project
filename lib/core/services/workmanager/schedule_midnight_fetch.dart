import 'package:workmanager/workmanager.dart';

Future<void> scheduleMidnightFetch() async {
  final now = DateTime.now();

  DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1, 0, 0, 0);

  final durationUntilMidnight = nextMidnight.difference(now);

  await Workmanager().registerPeriodicTask(
    "daily-fetch",
    "fetchDailyPrayers",
    frequency: const Duration(hours: 24),
    initialDelay: durationUntilMidnight,
    constraints: Constraints(networkType: NetworkType.connected),
  );
}
