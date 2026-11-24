import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColorsDark.bgSurface,
        border: Border(
          top: BorderSide(color: AppColorsDark.borderDefault, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.spaceXs),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              iconAsset: 'assets/icons/ic_home.svg',
              label: 'Home',
              isActive: currentIndex == 0,
              onTap: () => onTap(0),
            ),
            _NavItem(
              iconAsset: 'assets/icons/ic_history.svg',
              label: 'History',
              isActive: currentIndex == 1,
              onTap: () => onTap(1),
            ),
            _NavItem(
              iconAsset: 'assets/icons/ic_settings.svg',
              label: 'Settings',
              isActive: currentIndex == 2,
              onTap: () => onTap(2),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String iconAsset;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.iconAsset,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: isActive ? AppColorsDark.bgRaised : Colors.transparent,
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            child: SvgPicture.asset(
              iconAsset,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                isActive
                    ? AppColorsDark.textPrimary
                    : AppColorsDark.textSecondary,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: isActive
                  ? AppColorsDark.textPrimary
                  : AppColorsDark.textSecondary,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
