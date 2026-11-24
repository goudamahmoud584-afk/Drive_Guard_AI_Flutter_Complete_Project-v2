import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../widgets/app_bottom_nav.dart';
import 'trip_and_monitoring_flow.dart';
import 'onboarding_and_login_flow.dart';
import 'register_permissions_calibration_flow.dart';

class MainDashboardShell extends StatefulWidget {
  const MainDashboardShell({super.key});

  @override
  State<MainDashboardShell> createState() => _MainDashboardShellState();
}

class _MainDashboardShellState extends State<MainDashboardShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.bgCanvas,
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeScreen(),
          TripHistoryScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}

// 08 Home + 18 Manager Message Modal
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showManagerMessage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColorsDark.bgSurface,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.spaceLg,
            AppSpacing.spaceSm,
            AppSpacing.spaceLg,
            AppSpacing.spaceLg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColorsDark.borderStrong,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.spaceLg),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColorsDark.bgRaised,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColorsDark.borderDefault),
                    ),
                    child: Center(
                      child: Text('MA', style: AppTextStyles.labelDefault),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.spaceSm),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mona Adel', style: AppTextStyles.bodyStrong),
                      Text(
                        'Fleet manager · Today, 09:12',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              Text('A note about early shifts', style: AppTextStyles.headingH3),
              const SizedBox(height: AppSpacing.spaceXs),
              Text(
                'Hi Omar, most of your alerts this week were before 8 AM. Please make sure you sleep at least 7 hours before the morning shift, and pull over if you feel tired. Thanks for driving safely.',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColorsDark.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              Container(
                padding: const EdgeInsets.all(AppSpacing.spaceSm),
                decoration: BoxDecoration(
                  color: AppColorsDark.bgRaised,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(color: AppColorsDark.borderDefault),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ic_eye_closed.svg',
                      width: 18,
                      height: 18,
                      colorFilter: const ColorFilter.mode(
                        AppColorsDark.textSecondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.spaceSm),
                    Expanded(
                      child: Text(
                        'Based on 11 drowsiness alerts this week, mostly before 8 AM.',
                        style: AppTextStyles.caption,
                      ),
                    ),
                  ],
                ),
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
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    "I've read it",
                    style: AppTextStyles.bodyStrong.copyWith(
                      color: AppColorsDark.textOnAccent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.spaceXs),
              Center(
                child: Text(
                  'Confirm to start your next trip.',
                  style: AppTextStyles.caption,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.spaceMd),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good morning, Omar', style: AppTextStyles.headingH2),
                    const SizedBox(height: 2),
                    Text(
                      'Tuesday, 20 Oct · Nile Fleet',
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => _showManagerMessage(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColorsDark.bgSurface,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColorsDark.borderDefault),
                    ),
                    child: Center(
                      child: Text(
                        'OK',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColorsDark.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.spaceLg),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const TripSummaryScreen()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.spaceMd),
                decoration: BoxDecoration(
                  color: AppColorsDark.bgSurface,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: AppColorsDark.borderDefault),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 72,
                      height: 72,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                                    


                   Transform.flip( 
                       flipX: true,
                       child: CircularProgressIndicator(
                       value: 0.23,
                       strokeWidth: 6,
                       backgroundColor: AppColorsDark.bgRaised,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                       AppColorsDark.safeDefault,
    ),
  ), // CircularProgressIndicator
), // Transform.flip                            strokeWidth: 6,
                            
                            
                              
                            
                          
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('23', style: AppTextStyles.headingH3),
                              Text(
                                'Low risk',
                                style: AppTextStyles.caption.copyWith(
                                  fontSize: 9,
                                  color: AppColorsDark.safeDefault,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacing.spaceMd),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('LAST TRIP', style: AppTextStyles.overline),
                          const SizedBox(height: 2),
                          Text(
                            'Low risk · 38 min',
                            style: AppTextStyles.bodyStrong,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Yesterday, 17:10',
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/ic_chevron_right.svg',
                      width: 18,
                      height: 18,
                      colorFilter: const ColorFilter.mode(
                        AppColorsDark.textSecondary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const StartTripCountdownScreen(),
                  ),
                );
              },
              child: Container(
                width: AppSizes.startButton,
                height: AppSizes.startButton,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColorsDark.safeSubtle,
                  border: Border.all(
                    color: AppColorsDark.safeSolid.withValues(alpha: 0.4),
                    width: 12,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColorsDark.safeSolid,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/ic_car.svg',
                        width: 34,
                        height: 34,
                        colorFilter: const ColorFilter.mode(
                          AppColorsDark.textOnSafe,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.spaceXs),
                      Text(
                        'Start trip',
                        style: AppTextStyles.headingH3.copyWith(
                          color: AppColorsDark.textOnSafe,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Tap to begin',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColorsDark.textOnSafe.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/ic_smartphone.svg',
                  width: 14,
                  height: 14,
                  colorFilter: const ColorFilter.mode(
                    AppColorsDark.textSecondary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'Mount your phone, camera facing you.',
                  style: AppTextStyles.caption,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.spaceMd),
          ],
        ),
      ),
    );
  }
}

// 16 Trip History Screen
class TripHistoryScreen extends StatelessWidget {
  const TripHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trips = [
      (
        'Today, 08:42',
        'Nasr City → New Cairo · 38 min',
        '54 · Medium',
        AppColorsDark.warningSubtle,
        AppColorsDark.warningDefault,
        AppColorsDark.warningSolid,
        'assets/icons/ic_alert_triangle.svg',
      ),
      (
        'Yesterday, 17:10',
        'Maadi → Nasr City · 41 min',
        '23 · Low',
        AppColorsDark.safeSubtle,
        AppColorsDark.safeDefault,
        AppColorsDark.safeSolid,
        'assets/icons/ic_check_circle.svg',
      ),
      (
        'Mon 19 Oct, 07:55',
        'Heliopolis → 6th of October · 1 h 12 min',
        '72 · High',
        AppColorsDark.dangerSubtle,
        AppColorsDark.dangerDefault,
        AppColorsDark.dangerSolid,
        'assets/icons/ic_status_danger.svg',
      ),
      (
        'Sun 18 Oct, 18:30',
        'New Cairo → Zamalek · 46 min',
        '18 · Low',
        AppColorsDark.safeSubtle,
        AppColorsDark.safeDefault,
        AppColorsDark.safeSolid,
        'assets/icons/ic_check_circle.svg',
      ),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.spaceMd),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Trip history', style: AppTextStyles.headingH2),
                SvgPicture.asset(
                  'assets/icons/ic_filter.svg',
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColorsDark.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.spaceMd),
            Row(
              children: const [
                Expanded(
                  child: _StatCard(value: '6', label: 'Trips this week'),
                ),
                SizedBox(width: AppSpacing.spaceXs),
                Expanded(
                  child: _StatCard(value: '31', label: 'Avg score · Low'),
                ),
                SizedBox(width: AppSpacing.spaceXs),
                Expanded(
                  child: _StatCard(value: '4', label: 'Alerts'),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.spaceMd),
            Expanded(
              child: ListView.separated(
                itemCount: trips.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: AppSpacing.spaceSm),
                itemBuilder: (context, index) {
                  final trip = trips[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const TripSummaryScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.spaceMd),
                      decoration: BoxDecoration(
                        color: AppColorsDark.bgSurface,
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                        border: Border.all(color: AppColorsDark.borderDefault),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(trip.$1, style: AppTextStyles.bodyStrong),
                                const SizedBox(height: 2),
                                Text(trip.$2, style: AppTextStyles.caption),
                                const SizedBox(height: AppSpacing.spaceXs),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: trip.$4,
                                    borderRadius:
                                        BorderRadius.circular(AppRadius.full),
                                    border: Border.all(color: trip.$6),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        trip.$3,
                                        style: AppTextStyles.caption.copyWith(
                                          color: trip.$5,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      SvgPicture.asset(
                                        trip.$7,
                                        width: 12,
                                        height: 12,
                                        colorFilter: ColorFilter.mode(
                                          trip.$5,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/ic_chevron_right.svg',
                            width: 18,
                            height: 18,
                            colorFilter: const ColorFilter.mode(
                              AppColorsDark.textSecondary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.spaceSm),
      decoration: BoxDecoration(
        color: AppColorsDark.bgSurface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColorsDark.borderDefault),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: AppTextStyles.headingH3),
          const SizedBox(height: 2),
          Text(label, style: AppTextStyles.caption.copyWith(fontSize: 10)),
        ],
      ),
    );
  }
}

// 17 Settings Screen
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _volume = 0.85;
  int _sensitivityIndex = 1; // 0: Low, 1: Normal, 2: High

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.spaceMd),
            Text('Settings', style: AppTextStyles.headingH2),
            const SizedBox(height: AppSpacing.spaceLg),
            Text('ALERTS', style: AppTextStyles.overline),
            const SizedBox(height: AppSpacing.spaceSm),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/ic_volume.svg',
                  width: 18,
                  height: 18,
                  colorFilter: const ColorFilter.mode(
                    AppColorsDark.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: AppSpacing.spaceXs),
                Text('Alert volume', style: AppTextStyles.bodyDefault),
                const Spacer(),
                Text(
                  '${(_volume * 100).round()}%',
                  style: AppTextStyles.bodyStrong,
                ),
              ],
            ),
            Slider(
              value: _volume,
              min: 0.60,
              max: 1.0,
              activeColor: AppColorsDark.accentDefault,
              inactiveColor: AppColorsDark.bgRaised,
              onChanged: (v) => setState(() => _volume = v),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('60%', style: AppTextStyles.caption),
                Text('100%', style: AppTextStyles.caption),
              ],
            ),
            const SizedBox(height: AppSpacing.spaceMd),
            Text('Sensitivity', style: AppTextStyles.bodyDefault),
            const SizedBox(height: AppSpacing.spaceXs),
            Container(
              decoration: BoxDecoration(
                color: AppColorsDark.bgSurface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: AppColorsDark.borderDefault),
              ),
              child: Row(
                children: ['Low', 'Normal', 'High'].asMap().entries.map((e) {
                  final isSelected = e.key == _sensitivityIndex;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _sensitivityIndex = e.key),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColorsDark.bgRaised
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                        ),
                        child: Center(
                          child: Text(
                            e.value,
                            style: AppTextStyles.labelDefault.copyWith(
                              color: isSelected
                                  ? AppColorsDark.textPrimary
                                  : AppColorsDark.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: AppSpacing.spaceXs),
            Text(
              'Normal suits most drivers. High alerts earlier, Low reduces false alarms.',
              style: AppTextStyles.caption,
            ),
            const SizedBox(height: AppSpacing.spaceLg),
            Text('CAMERA', style: AppTextStyles.overline),
            const SizedBox(height: AppSpacing.spaceXs),
            _SettingsRow(
              iconAsset: 'assets/icons/ic_camera.svg',
              title: 'Recalibrate face',
              trailingText: 'Last: 12 Oct',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CalibrationScreen()),
                );
              },
            ),
            const SizedBox(height: AppSpacing.spaceLg),
            Text('LANGUAGE', style: AppTextStyles.overline),
            const SizedBox(height: AppSpacing.spaceXs),
            const _SettingsRow(
              iconAsset: 'assets/icons/ic_globe.svg',
              title: 'Language',
              trailingText: 'English · العربية',
            ),
            const SizedBox(height: AppSpacing.spaceLg),
            Text('PRIVACY', style: AppTextStyles.overline),
            const SizedBox(height: AppSpacing.spaceXs),
            const _SettingsRow(
              iconAsset: 'assets/icons/ic_lock.svg',
              title: 'What we store',
              trailingText: 'Summary only',
            ),
            const SizedBox(height: AppSpacing.spaceXs),
            const _SettingsRow(
              iconAsset: 'assets/icons/ic_alert_triangle.svg',
              title: 'Delete my trip data',
            ),
            const SizedBox(height: AppSpacing.spaceLg),
            Text('ACCOUNT', style: AppTextStyles.overline),
            const SizedBox(height: AppSpacing.spaceXs),
            _SettingsRow(
              iconAsset: 'assets/icons/ic_logout.svg',
              title: 'Sign out',
              trailingText: 'Omar Khaled',
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
            ),
            const SizedBox(height: AppSpacing.spaceLg),
          ],
        ),
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String? trailingText;
  final VoidCallback? onTap;

  const _SettingsRow({
    required this.iconAsset,
    required this.title,
    this.trailingText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.spaceMd,
          vertical: AppSpacing.spaceMd,
        ),
        decoration: BoxDecoration(
          color: AppColorsDark.bgSurface,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: AppColorsDark.borderDefault),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconAsset,
              width: 18,
              height: 18,
              colorFilter: const ColorFilter.mode(
                AppColorsDark.textSecondary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: AppSpacing.spaceSm),
            Text(title, style: AppTextStyles.bodyDefault),
            const Spacer(),
            if (trailingText != null) ...[
              Text(trailingText!, style: AppTextStyles.caption),
              const SizedBox(width: 6),
            ],
            SvgPicture.asset(
              'assets/icons/ic_chevron_right.svg',
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                AppColorsDark.textSecondary,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
