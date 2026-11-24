import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import 'main_dashboard_and_tabs.dart';
import 'verify_phone_screen.dart';
import 'onboarding_and_login_flow.dart';

// 05 Register Screen
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: 'Omar Khaled');
  final TextEditingController _emailController =
      TextEditingController(text: 'omar.khaled@nilefleet.com');
  final TextEditingController _phoneController =
      TextEditingController(text: '+20 10 2345 6789');
  final TextEditingController _passwordController =
      TextEditingController(text: '•••••••••••');
  final TextEditingController _inviteController =
      TextEditingController(text: 'NILE-4821');
  bool _agreedToTerms = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.bgCanvas,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.spaceMd),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: SvgPicture.asset(
                  'assets/icons/ic_chevron_left.svg',
                  width: 22,
                  height: 22,
                  colorFilter: const ColorFilter.mode(
                    AppColorsDark.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.spaceLg),
              Text('Create account', style: AppTextStyles.headingH1),
              const SizedBox(height: AppSpacing.spaceXs),
              GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                ),
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyles.bodySmall,
                    children: const [
                      TextSpan(text: 'Already have an account? '),
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                          color: AppColorsDark.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.spaceLg),
              _LabeledField(
                label: 'Full name',
                controller: _nameController,
                iconAsset: 'assets/icons/ic_user.svg',
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              _LabeledField(
                label: 'Email',
                controller: _emailController,
                iconAsset: 'assets/icons/ic_mail.svg',
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              _LabeledField(
                label: 'Phone',
                controller: _phoneController,
                iconAsset: 'assets/icons/ic_smartphone.svg',
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              _LabeledField(
                label: 'Password',
                controller: _passwordController,
                iconAsset: 'assets/icons/ic_lock.svg',
                obscureText: true,
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              _LabeledField(
                label: 'Company invite code (optional)',
                controller: _inviteController,
                iconAsset: 'assets/icons/ic_users.svg',
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      value: _agreedToTerms,
                      onChanged: (val) =>
                          setState(() => _agreedToTerms = val ?? false),
                      activeColor: AppColorsDark.accentDefault,
                      checkColor: AppColorsDark.textOnAccent,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.spaceSm),
                  Expanded(
                    child: Text(
                      'I agree to the Terms and Privacy Policy. Only trip summaries are shared, never video.',
                      style: AppTextStyles.caption,
                    ),
                  ),
                ],
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
                  onPressed: () {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => VerifyPhoneScreen(
        phoneNumber: _phoneController.text.trim(),
        onVerified: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        },
      ),
    ),
  );
},
                   
                 
                  child: Text(
                    'Create account',
                    style: AppTextStyles.bodyStrong.copyWith(
                      color: AppColorsDark.textOnAccent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.spaceLg),
            ],
          ),
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String iconAsset;
  final bool obscureText;

  const _LabeledField({
    required this.label,
    required this.controller,
    required this.iconAsset,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.labelDefault),
        const SizedBox(height: AppSpacing.spaceXs),
        Container(
          decoration: BoxDecoration(
            color: AppColorsDark.bgSurface,
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
                  iconAsset,
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
        ),
      ],
    );
  }
}

// 06 Permissions Screen
class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({super.key});

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  bool _locationAllowed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.bgCanvas,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.spaceXl),
              Text(
                'Two permissions to keep you safe',
                style: AppTextStyles.headingH1,
              ),
              const SizedBox(height: AppSpacing.spaceXs),
              Text(
                'We ask once. You can change this later in Settings.',
                style: AppTextStyles.bodySmall,
              ),
              const SizedBox(height: AppSpacing.spaceXl),
              Container(
                padding: const EdgeInsets.all(AppSpacing.spaceMd),
                decoration: BoxDecoration(
                  color: AppColorsDark.bgSurface,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: AppColorsDark.safeSolid),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ic_camera.svg',
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        AppColorsDark.textSecondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.spaceSm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Camera', style: AppTextStyles.bodyStrong),
                          const SizedBox(height: 4),
                          Text(
                            'Watches your eyes and head to spot drowsiness and phone use. Video stays on this phone.',
                            style: AppTextStyles.caption,
                          ),
                          const SizedBox(height: AppSpacing.spaceSm),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColorsDark.safeSubtle,
                              borderRadius: BorderRadius.circular(AppRadius.full),
                              border: Border.all(color: AppColorsDark.safeSolid),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Allowed',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColorsDark.safeDefault,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                SvgPicture.asset(
                                  'assets/icons/ic_check_circle.svg',
                                  width: 12,
                                  height: 12,
                                  colorFilter: const ColorFilter.mode(
                                    AppColorsDark.safeDefault,
                                    BlendMode.srcIn,
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
              const SizedBox(height: AppSpacing.spaceMd),
              Container(
                padding: const EdgeInsets.all(AppSpacing.spaceMd),
                decoration: BoxDecoration(
                  color: AppColorsDark.bgSurface,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(
                    color: _locationAllowed
                        ? AppColorsDark.safeSolid
                        : AppColorsDark.borderDefault,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ic_map_pin.svg',
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        AppColorsDark.textSecondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.spaceSm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location (GPS)',
                            style: AppTextStyles.bodyStrong,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Records your route so your trip summary shows where each alert happened.',
                            style: AppTextStyles.caption,
                          ),
                          const SizedBox(height: AppSpacing.spaceSm),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _locationAllowed
                                  ? AppColorsDark.safeSubtle
                                  : AppColorsDark.warningSubtle,
                              borderRadius: BorderRadius.circular(AppRadius.full),
                              border: Border.all(
                                color: _locationAllowed
                                    ? AppColorsDark.safeSolid
                                    : AppColorsDark.warningSolid,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _locationAllowed ? 'Allowed' : 'Required',
                                  style: AppTextStyles.caption.copyWith(
                                    color: _locationAllowed
                                        ? AppColorsDark.safeDefault
                                        : AppColorsDark.warningDefault,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                SvgPicture.asset(
                                  _locationAllowed
                                      ? 'assets/icons/ic_check_circle.svg'
                                      : 'assets/icons/ic_alert_triangle.svg',
                                  width: 12,
                                  height: 12,
                                  colorFilter: ColorFilter.mode(
                                    _locationAllowed
                                        ? AppColorsDark.safeDefault
                                        : AppColorsDark.warningDefault,
                                    BlendMode.srcIn,
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
              const SizedBox(height: AppSpacing.spaceMd),
              GestureDetector(
                onTap: () => setState(() => _locationAllowed = true),
                child: Container(
                  height: AppSizes.tapMin,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColorsDark.bgRaised,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(color: AppColorsDark.borderDefault),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/ic_map_pin.svg',
                        width: 16,
                        height: 16,
                        colorFilter: const ColorFilter.mode(
                          AppColorsDark.textPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.spaceXs),
                      Text('Allow location', style: AppTextStyles.labelDefault),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_lock.svg',
                    width: 13,
                    height: 13,
                    colorFilter: const ColorFilter.mode(
                      AppColorsDark.safeDefault,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Video never leaves this phone.',
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: AppSizes.tapMin + 4,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _locationAllowed
                        ? AppColorsDark.accentDefault
                        : AppColorsDark.bgRaised,
                    foregroundColor: _locationAllowed
                        ? AppColorsDark.textOnAccent
                        : AppColorsDark.textSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CalibrationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Continue',
                    style: AppTextStyles.bodyStrong.copyWith(
                      color: _locationAllowed
                          ? AppColorsDark.textOnAccent
                          : const Color.fromARGB(255, 175, 182, 176),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.spaceLg),
            ],
          ),
        ),
      ),
    );
  }
}

// 07 Calibration Screen
class CalibrationScreen extends StatelessWidget {
  const CalibrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double progress = 0.60;

    return Scaffold(
      backgroundColor: AppColorsDark.bgCanvas,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.spaceMd),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      'assets/icons/ic_chevron_left.svg',
                      width: 22,
                      height: 22,
                      colorFilter: const ColorFilter.mode(
                        AppColorsDark.textPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.spaceSm),
                  Text('Calibration', style: AppTextStyles.headingH2),
                ],
              ),
              const SizedBox(height: AppSpacing.spaceXs),
              Text(
                'Sit as you drive and look at the road for 10 seconds.',
                style: AppTextStyles.bodySmall,
              ),
              const SizedBox(height: AppSpacing.spaceLg),
              Container(
                height: 360,
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.spaceLg),
                decoration: BoxDecoration(
                  color: AppColorsDark.bgSurface,
                  borderRadius: BorderRadius.circular(AppRadius.xl),
                  border: Border.all(color: AppColorsDark.borderDefault),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/face_guide_aligned@3x.png',
                      height: 230,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: AppSpacing.spaceMd),
                    Text(
                      'Hold still · face found',
                      style: AppTextStyles.labelDefault.copyWith(
                        color: AppColorsDark.safeDefault,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.spaceLg),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Learning your face', style: AppTextStyles.labelDefault),
                  Text(
                    '60%',
                    style: AppTextStyles.labelDefault.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.spaceXs),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.full),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor: AppColorsDark.bgRaised,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColorsDark.accentDefault,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: AppSizes.tapMin + 4,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 78, 76, 76),
                    foregroundColor: AppColorsDark.textSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const MainDashboardShell(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    'Calibrating... 4 s left ',
                    style: AppTextStyles.bodyStrong.copyWith(
                      color: const Color.fromARGB(255, 7, 7, 7),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.spaceLg),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
