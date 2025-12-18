import 'package:rahma_project/core/di/dependency_injection.dart';
import 'package:rahma_project/core/helpers/latlng.dart';
import 'package:rahma_project/features/prayer/data/repositories/prayer_repository_implementation.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case "fetchDailyPrayers":
        PrayerRepositoryImplementation prayerRepositoryImplementation = getIt<PrayerRepositoryImplementation>();
        final currentLocation = await prayerRepositoryImplementation.getCurrentLocation();
        currentLocation.fold(
          (failure) => null,
          (position) async => await prayerRepositoryImplementation.getRemotePrayer(LatLng(position.latitude, position.longitude)),
        );
        return Future.value(true);
    }

    return Future.value(false);
  });
}
