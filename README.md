# WaterCan — Flutter Frontend

All 10 screens from your design, wired up with navigation and mock data (no backend yet).

## Screens included
1. Splash
2. Onboarding
3. Select Role
4. Login (Customer/Seller tabs)
5. Home (Customer)
6. Products (can size selection)
7. Cart
8. Checkout
9. Order Tracking
10. Orders + Profile (reachable via bottom nav)

## Run it on your Windows machine

1. Install Flutter SDK if you haven't: https://docs.flutter.dev/get-started/install/windows
2. Extract this zip, then in the project folder run:
   ```
   flutter pub get
   flutter run
   ```
   (Pick a connected device/emulator, or run `flutter run -d chrome` to preview in browser instantly without an emulator.)

## What's mocked right now
- Login just navigates to Home (no real auth)
- Seller list, cart totals, order tracking — all static mock data in `lib/models/models.dart`
- No persistence — state resets on app restart

## Next steps (when you're ready)
- Wire up your Node.js + Express API for auth, sellers, orders
- Add `http` or `dio` package for API calls
- Replace mock data in `models.dart` with real API responses
- Add state management (Provider/Riverpod) once data gets more dynamic

## Notes
- Colors/theme are in `lib/theme/app_theme.dart` — one place to tweak the blue palette
- Icons used instead of the illustration images from your mockup (splash/onboarding) — swap in your own assets under `assets/` and reference in `pubspec.yaml` if you want the exact look
