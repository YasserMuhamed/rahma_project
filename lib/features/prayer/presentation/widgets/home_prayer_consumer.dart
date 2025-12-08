import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        if (state is PrayerLocationChanged) {
          showAdaptiveDialog(
            context: context,
            builder: (context) => AlertDialog.adaptive(
              title: Text(S.of(context).location_changed),
              content: Text(S.of(context).location_changed_message),
              actions: [
                GestureDetector(
                  child: Text(S.of(context).ok),
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.pop(context, true);
                  },
                ),
                GestureDetector(
                  child: Text(S.of(context).cancel),
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ).then((value) {
            if (context.mounted && value == true)
              context.read<PrayerCubit>().loadPrayersWithUserLocation(
                forceRefresh: true,
              );
          });
        }
      },
      buildWhen: (previous, current) =>
          current is PrayerLoading ||
          current is PrayerLoaded ||
          current is PrayerError,
      builder: (context, state) {
        if (state is PrayerLoading) {
          return const PrayerCardLoading();
        }
        if (state is PrayerLoaded) {
          final prayer = state.prayer;
          final address = state.address;
          return PrayerCard(prayerEntity: prayer, location: address);
        }

        if (state is PrayerError) {
          return RetryWidget(
            message: state.message,
            onRetry: () => context.read<PrayerCubit>().refresh(),
          );
        }

        return Text(state.toString());
      },
    );
  }
}
