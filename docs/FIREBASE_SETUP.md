# Firebase setup (Challenge 2)

## 1. Create a Firebase project

1. Go to [Firebase Console](https://console.firebase.google.com/) → **Add project**.
2. Enable **Google Analytics** only if you want (optional for this assignment).

## 2. Add an Android app

1. Project overview → **Add app** → **Android**.
2. **Android package name** must match `applicationId` in `android/app/build.gradle.kts`:  
   `com.comp5450.handyman_portfolio`
3. Download **`google-services.json`** and place it in:  
   `android/app/google-services.json`

## 3. Enable Firestore

1. Build → **Firestore Database** → **Create database**.
2. Start in **test mode** for quick setup (matches `firestore.rules` in this repo for dev).
3. Later, publish rules: `firebase deploy --only firestore:rules` (optional).

## 4. Run the Flutter app

```bash
cd handyman-portfolio   # or challenges/challenge-2
flutter pub get
flutter run
```

On first launch with a **new** empty database, the app **auto-seeds** collections:

- `services`
- `projects`
- `reviews`

from `lib/data/mock_data.dart`. The **Contact** form writes to `contact_messages`.

## 5. If Firebase is not configured

If `google-services.json` is missing or `Firebase.initializeApp()` fails, the app **falls back to the mock repository** so you can still develop and run tests.

## 6. (Optional) FlutterFire CLI

For iOS / Web / multiple platforms:

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

Then follow the CLI prompts. Android still needs `google-services.json` from the console.

## 7. Citations

- [FlutterFire](https://firebase.flutter.dev/)
- [Add Firebase to Android](https://firebase.google.com/docs/android/setup)
