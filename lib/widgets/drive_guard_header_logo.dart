import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

class DriveGuardHeaderLogo extends StatelessWidget {
  final bool showSkip;
  final VoidCallback? onSkip;

  const DriveGuardHeaderLogo({
    super.key,
    this.showSkip = false,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spaceLg,
        vertical: AppSpacing.spaceMd,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/logo/logo_lockup.svg',
            height: 32,
            fit: BoxFit.contain,
          ),
          if (showSkip)
            GestureDetector(
              onTap: onSkip,
              child: Text(
                'Skip',
                style: AppTextStyles.labelDefault.copyWith(
                  color: AppColorsDark.textSecondary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
