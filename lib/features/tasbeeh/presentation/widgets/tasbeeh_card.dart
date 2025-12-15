import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/config/theming/app_text_styles.dart';
import 'package:rahma_project/config/theming/app_theme.dart';
import 'package:rahma_project/core/helpers/azkar_helpers.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/core/utils/app_snack_bar.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';

class TasbeehCard extends StatelessWidget {
  const TasbeehCard({super.key, required this.item});

  final TasbeehEntity item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onLongPress: () async {
          await Clipboard.setData(ClipboardData(text: item.content));
          if (!context.mounted) return;
          AppSnackbar.show(context: context, message: context.t.copied_to_clipboard);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).primaryColor,
            gradient: LinearGradient(
              colors: [AppColors.vibrantEmerald, AppColors.vibrantEmerald.withValues(alpha: .5)],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
            ),
            boxShadow: [BoxShadow(color: AppColors.vibrantEmerald.withAlpha(25), blurRadius: 10, offset: const Offset(0, 0))],
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SelectableText(
                item.formattedContent,
                textAlign: TextAlign.start,
                style: AppTextStyles.w600_16().copyWith(color: Colors.white, fontFamily: "UthmanicHafs", height: 1.5, fontSize: 24),
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  item.description == ''
                      ? const SizedBox.shrink()
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              item.description,
                              textAlign: TextAlign.start,
                              style: AppTextStyles.w600_16().copyWith(color: DarkEarthyTheme.lightText.withValues(alpha: .85)),
                            ),
                          ),
                        ),
                  if (item.clicks > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        context.t.your_tasbeeh_count(item.clicks),

                        style: AppTextStyles.w600_16().copyWith(color: DarkEarthyTheme.lightText.withValues(alpha: .85)),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
