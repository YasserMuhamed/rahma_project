import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/config/theming/app_text_styles.dart';
import 'package:rahma_project/core/helpers/azkar_helpers.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/core/utils/app_snack_bar.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/cubit/update_clicks_cubit.dart';

class TasbeehDetailsScreen extends StatefulWidget {
  const TasbeehDetailsScreen({super.key, required this.item});

  final TasbeehEntity item;

  @override
  State<TasbeehDetailsScreen> createState() => _TasbeehDetailsScreenState();
}

class _TasbeehDetailsScreenState extends State<TasbeehDetailsScreen> with SingleTickerProviderStateMixin {
  static const double _kTabletBreakpoint = 768.0;
  late AnimationController _animController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(duration: const Duration(milliseconds: 150), vsync: this);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(CurvedAnimation(parent: _animController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    HapticFeedback.lightImpact();
    _animController.forward().then((_) => _animController.reverse());

    await Future.delayed(const Duration(milliseconds: 100));
    if (mounted) {
      context.read<UpdateClicksCubit>().updateClicks(id: widget.item.id);
    }
  }

  void _showResetDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(context.t.reset),
        content: Text(context.t.tasbeeh_reset_confirmation),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(context.t.cancel)),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<UpdateClicksCubit>().resetClicks(id: widget.item.id);
              HapticFeedback.mediumImpact();
            },
            child: Text(context.t.reset, style: TextStyle(color: AppColors.forestGreen)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth > _kTabletBreakpoint;

            if (isTablet) {
              return _buildTabletLayout(constraints);
            } else {
              return _buildMobileLayout();
            }
          },
        ),
      ),
    );
  }

  Widget _buildTabletLayout(BoxConstraints constraints) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              AppBar(
                backgroundColor: AppColors.pineNeedle,
                elevation: 0,
                title: Text(widget.item.category),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: IconButton(onPressed: _showResetDialog, icon: const Icon(Icons.restart_alt_outlined), tooltip: 'إعادة تعيين'),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.item.formattedContent,
                          style: AppTextStyles.w800_32().copyWith(height: 1.5, fontFamily: "UthmanicHafs", color: AppColors.pureWhite),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.item.description,
                          style: AppTextStyles.w500_20().copyWith(color: AppColors.lightText.withValues(alpha: .6)),
                          textAlign: TextAlign.center,
                        ),
                        Divider(height: 32, thickness: 1, color: AppColors.forestGreen, indent: 25, endIndent: 25),
                        _buildCounter(fontSize: 48),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: _buildTapArea(height: constraints.maxHeight, margin: const EdgeInsets.all(16)),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: AppColors.pineNeedle,
          title: Text(widget.item.category),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(onPressed: _showResetDialog, icon: const Icon(Icons.restart_alt_outlined), tooltip: 'إعادة تعيين'),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  widget.item.formattedContent,
                  style: AppTextStyles.w800_28().copyWith(height: 1.5, fontFamily: "UthmanicHafs", color: AppColors.pureWhite),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  widget.item.description,
                  style: AppTextStyles.w500_16().copyWith(color: AppColors.lightText.withValues(alpha: .6)),
                  textAlign: TextAlign.center,
                ),
                Divider(height: 32, thickness: 1, color: AppColors.forestGreen, indent: 25, endIndent: 25),
                _buildCounter(fontSize: 36),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: _buildTapArea(height: context.height * .3, margin: const EdgeInsets.all(16)),
        ),
      ],
    );
  }

  Widget _buildCounter({required double fontSize}) {
    return BlocConsumer<UpdateClicksCubit, UpdateClicksState>(
      listener: (context, state) {
        if (state is UpdateClicksFailure) {
          AppSnackbar.show(context: context, message: state.error, type: SnackbarType.error);
        } else if (state is UpdateClicksLoaded) {
          // Celebrate milestones
          final count = state.item.clicks;
          if (count > 0 && count % 100 == 0) {
            HapticFeedback.heavyImpact();
          }
        }
      },
      builder: (context, state) {
        final count = state is UpdateClicksLoaded ? state.item.clicks : widget.item.clicks;

        return Semantics(
          label: 'العدد الحالي $count',
          child: Text(
            count.toString(),
            textAlign: TextAlign.center,
            style: AppTextStyles.w800_36().copyWith(fontSize: fontSize),
          ),
        );
      },
    );
  }

  Widget _buildTapArea({required double height, required EdgeInsets margin}) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Semantics(
        button: true,
        label: 'انقر للعد',
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _handleTap,
            borderRadius: BorderRadius.circular(16),
            splashFactory: InkRipple.splashFactory,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            child: Container(
              height: height,
              margin: margin,
              decoration: BoxDecoration(color: AppColors.forestGreen.withValues(alpha: .6), borderRadius: BorderRadius.circular(16)),
              child: Center(child: Icon(Icons.touch_app, size: 48, color: AppColors.pureWhite.withValues(alpha: .3))),
            ),
          ),
        ),
      ),
    );
  }
}
