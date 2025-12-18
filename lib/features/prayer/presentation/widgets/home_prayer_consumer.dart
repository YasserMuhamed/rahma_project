import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/features/prayer/presentation/cubit/prayer_cubit.dart';
import 'package:rahma_project/features/prayer/presentation/widgets/prayer_card.dart';
import 'package:rahma_project/features/prayer/presentation/widgets/prayer_card_loading.dart';
import 'package:rahma_project/features/home/presentation/widgets/retry_widget.dart';
import 'package:rahma_project/generated/l10n.dart';

class HomePrayersConsumer extends StatelessWidget {
  const HomePrayersConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrayerCubit, PrayerState>(
      listener: (context, state) {
        // Only listener handles location change dialog
        if (state is PrayerLocationChanged) {
          showAdaptiveDialog(
            context: context,
            builder: (context) => AlertDialog.adaptive(
              title: Text(S.of(context).location_changed),
              content: Text(S.of(context).location_changed_message),
              actions: [
                TextButton(
                  child: Text(S.of(context).cancel),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text(S.of(context).update),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    Navigator.pop(context, true);
                  },
                ),
              ],
            ),
          ).then((value) {
            if (context.mounted && value == true) {
              context.read<PrayerCubit>().loadPrayers(forceRefresh: true);
            }
          });
        }
      },
      buildWhen: (previous, current) => current is PrayerLoading || current is PrayerLoaded || current is PrayerError,
      builder: (context, state) {
        if (state is PrayerLoading) {
          return const PrayerCardLoading();
        }

        if (state is PrayerLoaded) {
          return Column(
            children: [
              // Show warning banner if there was an issue
              if (state.warningMessage != null) _WarningBanner(message: state.warningMessage!, isStale: state.isStale),

              // Show stale data banner
              if (state.isStale) _StaleBanner(onRefresh: () => context.read<PrayerCubit>().refresh()),

              // Main prayer card
              PrayerCard(prayerEntity: state.prayer, location: state.address),
            ],
          );
        }

        if (state is PrayerError) {
          return RetryWidget(message: state.message, onRetry: () => context.read<PrayerCubit>().refresh());
        }

        // Initial state
        return const PrayerCardLoading();
      },
    );
  }
}

// Warning banner for location/network issues
class _WarningBanner extends StatelessWidget {
  final String message;
  final bool isStale;

  const _WarningBanner({required this.message, required this.isStale});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.orange.shade900, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(message, style: TextStyle(color: Colors.orange.shade900, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

// Stale data banner
class _StaleBanner extends StatelessWidget {
  final VoidCallback onRefresh;

  const _StaleBanner({required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: AppColors.hunterGreen, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(S.of(context).using_cached_data, style: TextStyle(color: Colors.blue.shade900, fontSize: 12)),
          ),
          TextButton(onPressed: onRefresh, child: Text(S.of(context).refresh)),
        ],
      ),
    );
  }
}
