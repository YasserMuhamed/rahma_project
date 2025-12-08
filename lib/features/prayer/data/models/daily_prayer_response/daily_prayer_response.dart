import 'package:equatable/equatable.dart';
import 'package:rahma_project/features/prayer/domain/entities/prayer_entity.dart';

import 'data.dart';

// ignore: must_be_immutable
class DailyPrayerResponse extends PrayerEntity with EquatableMixin {
  final int? code;
  final String? status;
  final Data? data;

  DailyPrayerResponse({this.code, this.status, this.data})
    : super(
        timings: data?.timings != null
            ? PrayerTimings(
                fajr: data!.timings!.fajr ?? '',
                sunrise: data.timings!.sunrise ?? '',
                dhuhr: data.timings!.dhuhr ?? '',
                asr: data.timings!.asr ?? '',
                sunset: data.timings!.sunset ?? '',
                maghrib: data.timings!.maghrib ?? '',
                isha: data.timings!.isha ?? '',
                imsak: data.timings!.imsak,
                midnight: data.timings!.midnight,
                firstthird: data.timings!.firstthird,
                lastthird: data.timings!.lastthird,
              )
            : PrayerTimings(fajr: '', sunrise: '', dhuhr: '', asr: '', sunset: '', maghrib: '', isha: ''),
        date: data?.date != null
            ? PrayerDate(
                readable: data!.date!.readable ?? '',
                timestamp: DateTime.fromMillisecondsSinceEpoch(int.parse(data.date!.timestamp ?? '0') * 1000),
                hijri: data.date!.hijri != null
                    ? HijriDate(
                        date: data.date!.hijri!.date ?? '',
                        day: data.date!.hijri!.day ?? '',
                        year: data.date!.hijri!.year ?? '',
                        month: data.date!.hijri!.month != null
                            ? HijriMonth(
                                number: data.date!.hijri!.month!.number ?? 0,
                                en: data.date!.hijri!.month!.en ?? '',
                                ar: data.date!.hijri!.month!.ar ?? '',
                              )
                            : null,
                        weekday: data.date!.hijri!.weekday != null
                            ? HijriWeekday(en: data.date!.hijri!.weekday!.en ?? '', ar: data.date!.hijri!.weekday!.ar ?? '')
                            : null,
                      )
                    : null,
                gregorian: data.date!.gregorian != null
                    ? GregorianDate(
                        date: data.date!.gregorian!.date ?? '',
                        day: data.date!.gregorian!.day ?? '',
                        year: data.date!.gregorian!.year ?? '',
                        month: data.date!.gregorian!.month != null
                            ? GregorianMonth(number: data.date!.gregorian!.month!.number ?? 0, en: data.date!.gregorian!.month!.en ?? '')
                            : null,
                        weekday: data.date!.gregorian!.weekday != null
                            ? GregorianWeekday(en: data.date!.gregorian!.weekday!.en ?? '')
                            : null,
                      )
                    : null,
              )
            : null,
        location: data?.meta != null
            ? PrayerLocation(
                latitude: data!.meta!.latitude?.toDouble(),
                longitude: data.meta!.longitude?.toDouble(),
                timezone: data.meta!.timezone,
              )
            : null,
      );

  factory DailyPrayerResponse.fromJson(Map<String, dynamic> json) {
    return DailyPrayerResponse(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: json['data'] == null ? null : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'code': code, 'status': status, 'data': data?.toJson()};

  @override
  List<Object?> get props => [code, status, data, timings, date, location];
}
