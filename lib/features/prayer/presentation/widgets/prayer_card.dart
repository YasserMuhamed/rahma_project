import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/features/prayer/domain/entities/prayer_entity.dart';
import 'package:rahma_project/features/prayer/presentation/cubit/prayer_cubit.dart';
import 'package:rahma_project/generated/l10n.dart';

class PrayerCard extends StatefulWidget {
  const PrayerCard({super.key, required this.prayerEntity, this.location});
  final PrayerEntity prayerEntity;
  final String? location;
  @override
  State<PrayerCard> createState() => _PrayerCardState();
}

class _PrayerCardState extends State<PrayerCard> {
  Timer? timer;
  String? nextPrayerKey; // Changed to store key instead of name
  Duration? timeRemaining;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    calculateNextPrayer();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      calculateNextPrayer();
    });
  }

  void calculateNextPrayer() {
    final now = DateTime.now();
    final prayerTimes = widget.prayerEntity.timings;

    // Map of prayer keys to times
    final prayers = {
      'fajr': prayerTimes.fajr,
      'sunrise': prayerTimes.sunrise,
      'dhuhr': prayerTimes.dhuhr,
      'asr': prayerTimes.asr,
      'maghrib': prayerTimes.maghrib,
      'isha': prayerTimes.isha,
    };

    DateTime? nextPrayerDateTime;
    String? foundPrayerKey;

    for (var entry in prayers.entries) {
      try {
        final timeParts = entry.value.split(':');
        final prayerTime = DateTime(now.year, now.month, now.day, int.parse(timeParts[0]), int.parse(timeParts[1]));

        if (prayerTime.isAfter(now)) {
          if (nextPrayerDateTime == null || prayerTime.isBefore(nextPrayerDateTime)) {
            nextPrayerDateTime = prayerTime;
            foundPrayerKey = entry.key;
          }
        }
      } catch (e) {
        // Handle parsing errors
      }
    }

    if (nextPrayerDateTime == null && prayers['fajr'] != null) {
      try {
        final timeParts = prayers['fajr']!.split(':');
        nextPrayerDateTime = DateTime(now.year, now.month, now.day + 1, int.parse(timeParts[0]), int.parse(timeParts[1]));
        foundPrayerKey = 'fajr';
      } catch (e) {
        // Handle parsing errors
      }
    }

    if (mounted) {
      setState(() {
        nextPrayerKey = foundPrayerKey;
        if (nextPrayerDateTime != null) {
          timeRemaining = nextPrayerDateTime.difference(now);
        }
      });
    }
  }

  // Helper method to get translated prayer name
  String getLocalizedPrayerName(BuildContext context, String key) {
    switch (key) {
      case 'fajr':
        return S.of(context).fajr;
      case 'sunrise':
        return S.of(context).sunrise; // Add this to your l10n if missing
      case 'dhuhr':
        return S.of(context).dhuhr;
      case 'asr':
        return S.of(context).asr;
      case 'maghrib':
        return S.of(context).maghrib;
      case 'isha':
        return S.of(context).isha;
      default:
        return key;
    }
  }

  String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String formatToAmPm(String time) {
    final now = DateTime.now();
    final parsed = int.tryParse(time.split(':')[0]);
    if (parsed == null) return time;
    DateTime dateTime = DateTime(now.year, now.month, now.day, int.parse(time.split(':')[0]), int.parse(time.split(':')[1]));
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.vibrantEmerald, AppColors.forestGreen],
        ),
        boxShadow: [BoxShadow(color: AppColors.vibrantEmerald.withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Stack(
        children: [
          // Decorative circle pattern
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.05)),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.05)),
            ),
          ),

          // Main content
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).next_prayer, // Add this to your l10n
                  style: TextStyle(color: const Color(0xFFE8E8E8).withValues(alpha: 0.8), fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: .start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.access_time, color: Color(0xFFFFFFFF), size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nextPrayerKey != null ? getLocalizedPrayerName(context, nextPrayerKey!) : S.of(context).loading,
                            style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          if (!widget.location.isNullOrEmpty())
                            Row(
                              crossAxisAlignment: .start,
                              children: [
                                Icon(Icons.location_on),
                                Expanded(child: Text(widget.location!)),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    PopupMenuButton(
                      itemBuilder: (context) => [PopupMenuItem(value: 'change_location', child: Text(S.of(context).update_prayer_times))],
                      onSelected: (value) {
                        if (value == 'change_location') {
                          context.read<PrayerCubit>().loadPrayers(forceRefresh: true);
                        }
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Countdown timer
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    decoration: BoxDecoration(
                      color: AppColors.pineNeedle.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.1), width: 1),
                    ),
                    child: Text(
                      timeRemaining != null ? formatDuration(timeRemaining!) : '--:--:--',
                      style: const TextStyle(
                        inherit: false,
                        color: Color(0xFFFFFFFF),
                        fontSize: 48,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2,
                        fontFeatures: [FontFeature.tabularFigures()],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Prayer times list
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      _buildPrayerTimeRow('fajr', S.of(context).fajr, widget.prayerEntity.timings.fajr),
                      _buildDivider(),
                      _buildPrayerTimeRow('dhuhr', S.of(context).dhuhr, widget.prayerEntity.timings.dhuhr),
                      _buildDivider(),
                      _buildPrayerTimeRow('asr', S.of(context).asr, widget.prayerEntity.timings.asr),
                      _buildDivider(),
                      _buildPrayerTimeRow('maghrib', S.of(context).maghrib, widget.prayerEntity.timings.maghrib),
                      _buildDivider(),
                      _buildPrayerTimeRow('isha', S.of(context).isha, widget.prayerEntity.timings.isha),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimeRow(String key, String name, String? time) {
    final isNext = key == nextPrayerKey;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (isNext)
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 12, left: 12),
                  decoration: const BoxDecoration(color: Color(0xFFFFFFFF), shape: BoxShape.circle),
                )
              else
                const SizedBox(width: 20),
              Text(
                name,
                style: TextStyle(
                  color: isNext ? const Color(0xFFFFFFFF) : const Color(0xFFE8E8E8).withValues(alpha: 0.7),
                  fontSize: 16,
                  fontWeight: isNext ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
          Text(
            formatToAmPm(time ?? '--:--'),
            style: TextStyle(
              color: isNext ? const Color(0xFFFFFFFF) : const Color(0xFFE8E8E8).withValues(alpha: 0.7),
              fontSize: 16,
              fontWeight: isNext ? FontWeight.w600 : FontWeight.w400,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 1, margin: const EdgeInsets.symmetric(vertical: 4), color: Colors.white.withValues(alpha: 0.1));
  }
}
