# Drive Guard AI - Flutter Project Setup

1. Copy the `assets/` folder from `Drive Guard - Flutter handoff.zip` into the root of this project folder (next to `pubspec.yaml` and `lib/`).
2. If you haven't added the `.ttf` font files yet, either place `Inter-*.ttf` inside `assets/fonts/` or temporarily comment out the `fonts:` section in `pubspec.yaml` (the UI will cleanly fall back to system sans-serif while keeping all exact weights and sizes).
3. Open this folder in Visual Studio Code and run:
   ```bash
   flutter pub get
   flutter run
   ```
4. Screen navigation order included in the app:
   - **01 Onboarding · Stay alert** -> Next
   - **02 Onboarding · Alerts** -> Next
   - **03 Onboarding · Privacy** -> Get started / Sign in
   - **04 Login** -> Sign in (or Create one -> **05 Register**)
   - **05 Register** -> Create account
   - **06 Permissions** -> Continue
   - **07 Calibration** -> Calibrate / Continue to Dashboard
   - **08 Home** (with Bottom Nav: **08 Home**, **16 History**, **17 Settings** + Manager Message sheet **18**)
   - **09 Start Trip · Countdown** -> **10 Live Monitoring · Safe** -> **11 Warning** -> **12 Alert · Drowsiness** -> **13 Alert · Phone use** -> **14 Stop Trip · Hold** -> **15 Trip Summary**
