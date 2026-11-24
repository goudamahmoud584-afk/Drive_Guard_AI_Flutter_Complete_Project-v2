import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

// 09 Start Trip · Countdown
class StartTripCountdownScreen extends StatelessWidget {
  const StartTripCountdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.bgCanvas,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
          child: Column(
            children: [
              const Spacer(),
              Text(
                'Monitoring starts in',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColorsDark.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const LiveMonitoringSafeScreen(),
                    ),
                  );
                },
                child: const Text(
                  '3',
                  style: TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 96,
                    color: AppColorsDark.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_check_circle.svg',
                    width: 15,
                    height: 15,
                    colorFilter: const ColorFilter.mode(
                      AppColorsDark.safeDefault,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Face found · camera ready',
                    style: AppTextStyles.labelDefault.copyWith(
                      color: AppColorsDark.safeDefault,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.spaceSm),
              Text(
                'Put your phone in the mount and look at the road.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall,
              ),
              const Spacer(),
              SizedBox(
                height: AppSizes.tapMin + 4,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorsDark.bgRaised,
                    foregroundColor: AppColorsDark.textPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel', style: AppTextStyles.bodyStrong),
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

// 10 Live Monitoring · Safe
class LiveMonitoringSafeScreen extends StatelessWidget {
  const LiveMonitoringSafeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.bgCanvas,
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => const LiveMonitoringWarningScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                color: AppColorsDark.safeSolid,
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.spaceLg),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/ic_camera.svg',
                                  width: 14,
                                  height: 14,
                                  colorFilter: const ColorFilter.mode(
                                    AppColorsDark.textOnSafe,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Camera on · not recording',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColorsDark.textOnSafe,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/ic_map_pin.svg',
                                  width: 14,
                                  height: 14,
                                  colorFilter: const ColorFilter.mode(
                                    AppColorsDark.textOnSafe,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'GPS',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColorsDark.textOnSafe,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/icons/ic_status_safe.svg',
                          width: 72,
                          height: 72,
                        ),
                        const SizedBox(height: AppSpacing.spaceMd),
                        Text(
                          'SAFE',
                          style: AppTextStyles.displayAlert.copyWith(
                            color: AppColorsDark.textOnSafe,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.spaceXs),
                        Text(
                          'Eyes on the road. Keep going.',
                          style: AppTextStyles.bodyDefault.copyWith(
                            color: AppColorsDark.textOnSafe,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.spaceLg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 4),
                  Column(
                    children: [
                      Text('TRIP TIME', style: AppTextStyles.overline),
                      const SizedBox(height: 4),
                      Text('00:24:37', style: AppTextStyles.displayTimer),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const StopTripHoldScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: AppSizes.tapMin + 4,
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
                            'assets/icons/ic_stop.svg',
                            width: 14,
                            height: 14,
                            colorFilter: const ColorFilter.mode(
                              AppColorsDark.dangerDefault,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Hold to stop trip',
                            style: AppTextStyles.bodyStrong,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 11 Live Monitoring · Warning
class LiveMonitoringWarningScreen extends StatelessWidget {
  const LiveMonitoringWarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.bgCanvas,
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => const AlertDrowsinessScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                color: AppColorsDark.warningSolid,
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.spaceLg),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/ic_camera.svg',
                                  width: 14,
                                  height: 14,
                                  colorFilter: const ColorFilter.mode(
                                    AppColorsDark.textOnWarning,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Camera on · not recording',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColorsDark.textOnWarning,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/ic_map_pin.svg',
                                  width: 14,
                                  height: 14,
                                  colorFilter: const ColorFilter.mode(
                                    AppColorsDark.textOnWarning,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'GPS',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColorsDark.textOnWarning,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/icons/ic_status_warning.svg',
                          width: 72,
                          height: 72,
                        ),
                        const SizedBox(height: AppSpacing.spaceMd),
                        Text(
                          'WARNING',
                          style: AppTextStyles.displayAlert.copyWith(
                            color: AppColorsDark.textOnWarning,
                            fontSize: 48,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.spaceXs),
                        Text(
                          'Tired? Take a break soon.',
                          style: AppTextStyles.bodyDefault.copyWith(
                            color: AppColorsDark.textOnWarning,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.spaceLg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 4),
                  Column(
                    children: [
                      Text('TRIP TIME', style: AppTextStyles.overline),
                      const SizedBox(height: 4),
                      Text('00:24:37', style: AppTextStyles.displayTimer),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const StopTripHoldScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: AppSizes.tapMin + 4,
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
                            'assets/icons/ic_stop.svg',
                            width: 14,
                            height: 14,
                            colorFilter: const ColorFilter.mode(
                              AppColorsDark.dangerDefault,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Hold to stop trip',
                            style: AppTextStyles.bodyStrong,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 12 Alert · Drowsiness
class AlertDrowsinessScreen extends StatelessWidget {
  const AlertDrowsinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.alertDrowsyBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/ic_eye_closed.svg',
                width: 84,
                height: 84,
                colorFilter: const ColorFilter.mode(
                  AppColorsDark.alertOnDrowsy,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: AppSpacing.spaceLg),
              Text(
                'WAKE UP',
                style: AppTextStyles.displayAlert.copyWith(
                  color: AppColorsDark.alertOnDrowsy,
                ),
              ),
              const SizedBox(height: AppSpacing.spaceXs),
              Text(
                'Pull over safely when you can.',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColorsDark.alertOnDrowsy,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_volume.svg',
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                      AppColorsDark.alertOnDrowsy,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Alarm playing',
                    style: AppTextStyles.labelDefault.copyWith(
                      color: AppColorsDark.alertOnDrowsy,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: AppSizes.tapLarge,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorsDark.alertOnDrowsy,
                    foregroundColor: AppColorsDark.alertDrowsyBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const AlertPhoneUseScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "I'm awake",
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColorsDark.alertDrowsyBg,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.spaceSm),
              Text(
                'Or tap anywhere to stop the alarm',
                style: AppTextStyles.caption.copyWith(
                  color: AppColorsDark.alertOnDrowsy.withValues(alpha: 0.9),
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

// 13 Alert · Phone use
class AlertPhoneUseScreen extends StatelessWidget {
  const AlertPhoneUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.alertPhoneBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/ic_smartphone.svg',
                width: 84,
                height: 84,
                colorFilter: const ColorFilter.mode(
                  AppColorsDark.alertOnPhone,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: AppSpacing.spaceLg),
              Text(
                'PHONE\nDOWN',
                textAlign: TextAlign.center,
                style: AppTextStyles.displayAlert.copyWith(
                  color: AppColorsDark.alertOnPhone,
                ),
              ),
              const SizedBox(height: AppSpacing.spaceXs),
              Text(
                'Eyes on the road.',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColorsDark.alertOnPhone,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_volume.svg',
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                      AppColorsDark.alertOnPhone,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Alarm playing',
                    style: AppTextStyles.labelDefault.copyWith(
                      color: AppColorsDark.alertOnPhone,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: AppSizes.tapLarge,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorsDark.alertOnPhone,
                    foregroundColor: AppColorsDark.alertPhoneBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const StopTripHoldScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Got it',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColorsDark.alertPhoneBg,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.spaceSm),
              Text(
                'Or tap anywhere to stop the alarm',
                style: AppTextStyles.caption.copyWith(
                  color: AppColorsDark.alertOnPhone.withValues(alpha: 0.9),
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

// 14 Stop Trip · Hold
class StopTripHoldScreen extends StatelessWidget {
  const StopTripHoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.bgCanvas,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
          child: Column(
            children: [
              const Spacer(),
              Text(
                'Keep holding to end the trip',
                style: AppTextStyles.headingH3,
              ),
              const SizedBox(height: AppSpacing.spaceXl),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const TripSummaryScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 210,
                  height: 210,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColorsDark.dangerSubtle,
                    border: Border.all(
                      color: AppColorsDark.dangerSolid,
                      width: 6,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 174,
                      height: 174,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColorsDark.dangerSolid,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/ic_stop.svg',
                            width: 28,
                            height: 28,
                            colorFilter: const ColorFilter.mode(
                              AppColorsDark.textOnDanger,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.spaceXs),
                          Text(
                            'Stop trip',
                            style: AppTextStyles.headingH3.copyWith(
                              color: AppColorsDark.textOnDanger,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Keep holding...',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColorsDark.textOnDanger
                                  .withValues(alpha: 0.85),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.spaceLg),
              Text(
                'Release to keep driving',
                style: AppTextStyles.bodySmall,
              ),
              const Spacer(),
              Text(
                'Trip time 00:38:12',
                style: AppTextStyles.caption,
              ),
              const SizedBox(height: AppSpacing.spaceLg),
            ],
          ),
        ),
      ),
    );
  }
}

// 15 Trip Summary Screen
class TripSummaryScreen extends StatelessWidget {
  const TripSummaryScreen({super.key});

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
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      'assets/icons/ic_chevron_left.svg',
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        AppColorsDark.textPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.spaceXs),
                  Text('Trip summary', style: AppTextStyles.headingH3),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Today, 08:42 – 09:20 · Nasr City → New Cairo',
                style: AppTextStyles.caption,
              ),
              const SizedBox(height: AppSpacing.spaceLg),
              Center(
                child: Column(
                  children: [
                    Column(
              children: [
                SizedBox(
                  width: 220,
                  height: 115,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomPaint(
                        size: const Size(220, 110),
                        painter: _SemiCircleGaugePainter(
                          progress: 0.54,
                          trackColor: AppColorsDark.bgRaised,
                          progressColor: AppColorsDark.warningSolid,
                          strokeWidth: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text('54', style: AppTextStyles.displayScore),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: 220,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0',
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '100',
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
                    const SizedBox(height: AppSpacing.spaceXs),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 159, 6),
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Medium risk',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColorsDark.textOnWarning,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            'assets/icons/ic_alert_triangle.svg',
                            width: 12,
                            height: 12,
                            colorFilter: const ColorFilter.mode(
                              AppColorsDark.textOnWarning,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.spaceLg),
              Row(
                children: const [
                  Expanded(
                    child: _SummaryMetricBox(value: '38 min', label: 'Duration'),
                  ),
                  SizedBox(width: AppSpacing.spaceXs),
                  Expanded(
                    child: _SummaryMetricBox(value: '24 km', label: 'Distance'),
                  ),
                  SizedBox(width: AppSpacing.spaceXs),
                  Expanded(
                    child: _SummaryMetricBox(value: '3', label: 'Alerts'),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              Container(
                padding: const EdgeInsets.all(AppSpacing.spaceMd),
                decoration: BoxDecoration(
                  color: AppColorsDark.bgSurface,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: AppColorsDark.borderDefault),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Alerts by type', style: AppTextStyles.bodyStrong),
                    const SizedBox(height: AppSpacing.spaceMd),
                    _AlertProgressRow(
                      iconAsset: 'assets/icons/ic_eye_closed.svg',
                      label: 'Drowsiness',
                      count: '2',
                      progress: 0.70,
                      color: AppColorsDark.dangerSolid,
                    ),
                    const SizedBox(height: AppSpacing.spaceMd),
                    _AlertProgressRow(
                      iconAsset: 'assets/icons/ic_smartphone.svg',
                      label: 'Phone use',
                      count: '1',
                      progress: 0.45,
                      color: AppColorsDark.warningSolid,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              Text('Timeline', style: AppTextStyles.bodyStrong),
              const SizedBox(height: AppSpacing.spaceSm),
              const _TimelineRow(
                time: '08:42',
                iconAsset: 'assets/icons/ic_play.svg',
                iconColor: AppColorsDark.textSecondary,
                title: 'Trip started',
                subtitle: 'Nasr City',
              ),
              const _TimelineRow(
                time: '08:57',
                iconAsset: 'assets/icons/ic_eye_closed.svg',
                iconColor: AppColorsDark.dangerDefault,
                title: 'Drowsiness',
                subtitle: 'Eyes closed 2.1 s · alarm played',
              ),
              const _TimelineRow(
                time: '09:05',
                iconAsset: 'assets/icons/ic_smartphone.svg',
                iconColor: AppColorsDark.warningDefault,
                title: 'Phone use',
                subtitle: 'Phone in hand 6 s · alarm played',
              ),
              const _TimelineRow(
                time: '09:12',
                iconAsset: 'assets/icons/ic_eye_closed.svg',
                iconColor: AppColorsDark.dangerDefault,
                title: 'Drowsiness',
                subtitle: 'Head nodding · alarm played',
              ),
              const _TimelineRow(
                time: '09:20',
                iconAsset: 'assets/icons/ic_check_circle.svg',
                iconColor: AppColorsDark.safeDefault,
                title: 'Trip ended',
                subtitle: 'New Cairo · 38 min',
              ),
              const SizedBox(height: AppSpacing.spaceMd),
              Container(
                padding: const EdgeInsets.all(AppSpacing.spaceMd),
                decoration: BoxDecoration(
                  color: AppColorsDark.bgSurface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(color: AppColorsDark.borderDefault),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ic_check_circle.svg',
                      width: 18,
                      height: 18,
                      colorFilter: const ColorFilter.mode(
                        AppColorsDark.textPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.spaceSm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trip summary uploaded',
                            style: AppTextStyles.labelDefault,
                          ),
                          Text(
                            'Only the summary was sent. No video left the phone.',
                            style: AppTextStyles.caption,
                          ),
                        ],
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
                    'Done',
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

class _SummaryMetricBox extends StatelessWidget {
  final String value;
  final String label;

  const _SummaryMetricBox({required this.value, required this.label});

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
          Text(value, style: AppTextStyles.bodyStrong),
          const SizedBox(height: 2),
          Text(label, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}

class _AlertProgressRow extends StatelessWidget {
  final String iconAsset;
  final String label;
  final String count;
  final double progress;
  final Color color;

  const _AlertProgressRow({
    required this.iconAsset,
    required this.label,
    required this.count,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              iconAsset,
              width: 14,
              height: 14,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            const SizedBox(width: 6),
            Text(label, style: AppTextStyles.labelDefault),
            const Spacer(),
            Text(count, style: AppTextStyles.labelDefault),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.full),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: AppColorsDark.bgRaised,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}

class _TimelineRow extends StatelessWidget {
  final String time;
  final String iconAsset;
  final Color iconColor;
  final String title;
  final String subtitle;

  const _TimelineRow({
    required this.time,
    required this.iconAsset,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.spaceSm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 42,
            child: Text(time, style: AppTextStyles.caption),
          ),
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColorsDark.bgSurface,
              border: Border.all(color: iconColor),
            ),
            child: Center(
              child: SvgPicture.asset(
                iconAsset,
                width: 12,
                height: 12,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.spaceSm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.labelDefault),
                Text(subtitle, style: AppTextStyles.caption),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 class _SemiCircleGaugePainter extends CustomPainter {
  final double progress;
  final Color trackColor;
  final Color progressColor;
  final double strokeWidth;

  _SemiCircleGaugePainter({
    required this.progress,
    required this.trackColor,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    canvas.drawArc(rect, math.pi, math.pi, false, trackPaint);
    canvas.drawArc(rect, math.pi, math.pi * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant _SemiCircleGaugePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
