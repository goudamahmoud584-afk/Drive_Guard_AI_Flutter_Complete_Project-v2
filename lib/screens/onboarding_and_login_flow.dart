import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../widgets/drive_guard_header_logo.dart';
import 'register_permissions_calibration_flow.dart';

class OnboardingFlowScreen extends StatefulWidget {
  const OnboardingFlowScreen({super.key});

  @override
  State<OnboardingFlowScreen> createState() => _OnboardingFlowScreenState();
}

class _OnboardingFlowScreenState extends State<OnboardingFlowScreen> {
  final PageController _pageController = PageController();

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }
void _openLogin() {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const LoginScreen()),
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.bgCanvas,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            // 01 Onboarding · Stay alert
            _OnboardingStepLayout(
              showSkip: true,
              onSkip: _openLogin,
              activeIndex: 0,
              title: 'Stay alert on every drive',
              description:
                  "Your phone's front camera watches your eyes, head and hands while you drive.",
              primaryButtonText: 'Next',
              onPrimaryPressed: () => _goToPage(1),
              centerVisual: SizedBox(
                height: 290,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const _RadarRing(size: 160),
                    const _RadarRing(size: 225),
                    const _RadarRing(size: 285),
                    Image.asset(
                      'assets/images/onboarding_watch@3x.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    const Positioned(
                      top: 44,
                      left: 28,
                      child: _FloatingBadge(
                        dotColor: AppColorsDark.safeDefault,
                        iconAsset: 'assets/icons/ic_eye.svg',
                        label: 'Eyes',
                      ),
                    ),
                    const Positioned(
                      top: 78,
                      right: 22,
                      child: _FloatingBadge(
                        dotColor: AppColorsDark.safeDefault,
                        iconAsset: 'assets/icons/ic_user.svg',
                        label: 'Head',
                      ),
                    ),
                    const Positioned(
                      bottom: 42,
                      right: 36,
                      child: _FloatingBadge(
                        dotColor: AppColorsDark.textSecondary,
                        iconAsset: 'assets/icons/ic_smartphone.svg',
                        label: 'Phone',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 02 Onboarding · Alerts
            _OnboardingStepLayout(
              showSkip: true,
              onSkip: _openLogin,
              activeIndex: 1,
              title: 'An alarm within 2 seconds',
              description:
                  'Eyes closing, head nodding or a phone in your hand triggers a loud alarm right away.',
              primaryButtonText: 'Next',
              onPrimaryPressed: () => _goToPage(2),
              centerVisual: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '2s',
                      style: TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 72,
                        height: 1.05,
                        color: AppColorsDark.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.spaceXl),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColorsDark.textSecondary,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 2,
                            color: AppColorsDark.borderStrong,
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColorsDark.dangerSolid,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/ic_volume.svg',
                              width: 15,
                              height: 15,
                              colorFilter: const ColorFilter.mode(
                                AppColorsDark.textOnDanger,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.spaceXs),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Eyes close',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColorsDark.textSecondary,
                          ),
                        ),
                        Text(
                          'Alarm',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColorsDark.dangerDefault,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // 03 Onboarding · Privacy
            _OnboardingStepLayout(
              showSkip: false,
              activeIndex: 2,
              title: 'No video leaves your phone',
              description:
                  'Video is checked on your phone and never saved. Only the trip summary is uploaded.',
              primaryButtonText: 'Get started',
              onPrimaryPressed: _openLogin,
              bottomLinkPrefix: 'Already have an account? ',
              bottomLinkActionText: 'Sign in',
              onBottomLinkTap: _openLogin,
              centerVisual: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceMd),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColorsDark.safeSolid,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/ic_lock.svg',
                          width: 22,
                          height: 22,
                          colorFilter: const ColorFilter.mode(
                            AppColorsDark.textOnSafe,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.spaceMd),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColorsDark.bgSurface,
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                        border: Border.all(color: AppColorsDark.borderDefault),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppSpacing.spaceMd),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/ic_camera.svg',
                                  width: 18,
                                  height: 18,
                                  colorFilter: const ColorFilter.mode(
                                    AppColorsDark.textSecondary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.spaceSm),
                                Text(
                                  'Video',
                                  style: AppTextStyles.bodyDefault.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  'assets/icons/ic_lock.svg',
                                  width: 12,
                                  height: 12,
                                  colorFilter: const ColorFilter.mode(
                                    AppColorsDark.safeDefault,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Stays on phone',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColorsDark.safeDefault,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 1,
                            color: AppColorsDark.borderDefault,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppSpacing.spaceMd),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/ic_route.svg',
                                  width: 18,
                                  height: 18,
                                  colorFilter: const ColorFilter.mode(
                                    AppColorsDark.textSecondary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.spaceSm),
                                Text(
                                  'Trip summary',
                                  style: AppTextStyles.bodyDefault.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  'assets/icons/ic_check_circle.svg',
                                  width: 13,
                                  height: 13,
                                  colorFilter: const ColorFilter.mode(
                                    AppColorsDark.textSecondary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Uploaded',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColorsDark.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingStepLayout extends StatelessWidget {
  final bool showSkip;
  final VoidCallback? onSkip;
  final int activeIndex;
  final Widget centerVisual;
  final String title;
  final String description;
  final String primaryButtonText;
  final VoidCallback onPrimaryPressed;
  final String? bottomLinkPrefix;
  final String? bottomLinkActionText;
  final VoidCallback? onBottomLinkTap;

  const _OnboardingStepLayout({
    required this.showSkip,
    this.onSkip,
    required this.activeIndex,
    required this.centerVisual,
    required this.title,
    required this.description,
    required this.primaryButtonText,
    required this.onPrimaryPressed,
    this.bottomLinkPrefix,
    this.bottomLinkActionText,
    this.onBottomLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DriveGuardHeaderLogo(showSkip: showSkip, onSkip: onSkip),
        Expanded(child: Center(child: centerVisual)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.headingH1),
              const SizedBox(height: AppSpacing.spaceSm),
              Text(description, style: AppTextStyles.bodySmall),
              const SizedBox(height: AppSpacing.spaceLg),
              Row(
                children: List.generate(3, (index) {
                  final bool isActive = index == activeIndex;
                  return Container(
                    margin: const EdgeInsets.only(right: 6),
                    width: isActive ? 22 : 8,
                    height: 4,
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColorsDark.accentDefault
                          : AppColorsDark.borderStrong,
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                  );
                }),
              ),
              const SizedBox(height: AppSpacing.spaceLg),
              SizedBox(
                height: AppSizes.tapMin + 4,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorsDark.accentDefault,
                    foregroundColor: AppColorsDark.textOnAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    elevation: 0,
                  ),
                  onPressed: onPrimaryPressed,
                  child: Text(
                    primaryButtonText,
                    style: AppTextStyles.bodyStrong.copyWith(
                      color: AppColorsDark.textOnAccent,
                    ),
                  ),
                ),
              ),
              if (bottomLinkPrefix != null && bottomLinkActionText != null) ...[
                const SizedBox(height: AppSpacing.spaceMd),
                Center(
                  child: GestureDetector(
                    onTap: onBottomLinkTap,
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyles.caption.copyWith(
                          color: AppColorsDark.textSecondary,
                        ),
                        children: [
                          TextSpan(text: bottomLinkPrefix),
                          TextSpan(
                            text: bottomLinkActionText,
                            style: const TextStyle(
                              color: AppColorsDark.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.spaceLg),
            ],
          ),
        ),
      ],
    );
  }
}

class _RadarRing extends StatelessWidget {
  final double size;
  const _RadarRing({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColorsDark.borderDefault.withValues(alpha: 0.7),
          width: 1,
        ),
      ),
    );
  }
}

class _FloatingBadge extends StatelessWidget {
  final Color dotColor;
  final String iconAsset;
  final String label;

  const _FloatingBadge({
    required this.dotColor,
    required this.iconAsset,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColorsDark.bgSurface,
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: AppColorsDark.borderDefault),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor),
          ),
          const SizedBox(width: 6),
          SvgPicture.asset(
            iconAsset,
            width: 12,
            height: 12,
            colorFilter: const ColorFilter.mode(
              AppColorsDark.textPrimary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: AppColorsDark.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

// 04 Login Screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  {
  final TextEditingController _emailController =
      TextEditingController(text: 'omar.khaled@nilefleet.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '••••••••••••');
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.bgCanvas,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 0,
            right: 25,
            height: 510,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/login_road_background@3x.png',
                  fit: BoxFit.cover,
                  
                ),
                Positioned(
                  top: 180,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColorsDark.bgSurface.withValues(alpha: 0.92),
                        borderRadius: BorderRadius.circular(AppRadius.full),
                        border: Border.all(color: const Color.fromARGB(231, 9, 9, 9)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColorsDark.safeDefault,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Driver awake · Safe',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColorsDark.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const DriveGuardHeaderLogo(),
                  const SizedBox(height: 177),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.spaceMd,
                    ),
                    padding: const EdgeInsets.all(AppSpacing.spaceLg),
                    decoration: BoxDecoration(
                      color: AppColorsDark.bgSurface,
                      borderRadius: BorderRadius.circular(AppRadius.xl),
                      border: Border.all(color: const Color.fromARGB(225, 14, 14, 14)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome back', style: AppTextStyles.headingH2),
                        const SizedBox(height: AppSpacing.space2xs),
                        Text(
                          'Sign in to start monitoring your trips.',
                          style: AppTextStyles.bodySmall,
                        ),
                        const SizedBox(height: AppSpacing.spaceLg),
                        Text('Email', style: AppTextStyles.labelDefault),
                        const SizedBox(height: AppSpacing.spaceXs),
                        _AppInputField(
                          controller: _emailController,
                          prefixIconAsset: 'assets/icons/ic_mail.svg',
                        ),
                        const SizedBox(height: AppSpacing.spaceMd),
                        Text('Password', style: AppTextStyles.labelDefault),
                        const SizedBox(height: AppSpacing.spaceXs),
                        _AppInputField(
                          controller: _passwordController,
                          prefixIconAsset: 'assets/icons/ic_lock.svg',
                          obscureText: true,
                        ),
                        const SizedBox(height: AppSpacing.spaceSm),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot password?',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColorsDark.textSecondary,
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.spaceMd),
                        SizedBox(
                          height: AppSizes.tapMin + 4,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColorsDark.accentDefault,
                              foregroundColor: AppColorsDark.textOnAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppRadius.md),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const PermissionsScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: AppTextStyles.bodyStrong.copyWith(
                                color: AppColorsDark.textOnAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.spaceLg),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyles.caption.copyWith(
                          color: AppColorsDark.textSecondary,
                        ),
                        children: const [
                          TextSpan(text: "Don't have an account? "),
                          TextSpan(
                            text: 'Create one',
                            style: TextStyle(
                              color: AppColorsDark.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.spaceXs),
                  Text(
                    'By signing in you agree to our Terms and Privacy Policy.',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: 11,
                      color: AppColorsDark.textSecondary.withValues(alpha: 0.75),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.spaceLg),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppInputField extends StatelessWidget {
  final TextEditingController controller;
  final String prefixIconAsset;
  final bool obscureText;

  const _AppInputField({
    required this.controller,
    required this.prefixIconAsset,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorsDark.bgRaised,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColorsDark.borderDefault),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColorsDark.textPrimary,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.spaceMd,
            vertical: AppSpacing.spaceSm + 2,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              prefixIconAsset,
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                AppColorsDark.textSecondary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
