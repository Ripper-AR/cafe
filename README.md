# On The Horse Cafeteria

An offline-first Flutter app with a locally bundled menu and cafe branding.
Browse menu categories, build an order, review itemized totals, and prepare an
order message for WhatsApp.

The menu includes sandwiches, meals, fresh juices, soda, soft drinks, coffee,
hot drinks, waffles, and smoothies. Menu item names are shown in English and
Arabic; prices are in EGP.

The Android launcher and web app icons use the cafe seal artwork in
`assets/app_icon.png`; Android adaptive icons use
`assets/app_icon_foreground.png`. iOS uses the same cafe seal as its app icon.
Regenerate icons with
`dart run flutter_launcher_icons`.

## Run

Open the project in Android Studio or use Flutter:

```sh
flutter pub get
flutter run
```

To build an Android APK:

```sh
flutter build apk
```

To run or build for iOS, use macOS with Xcode installed:

```sh
flutter run -d ios
flutter build ios
```

Browsing and preparing an order work offline. Sending requires WhatsApp and a
network connection. Checkout opens WhatsApp addressed to +20 10 36994744 with
the order ready; the customer must tap Send.
