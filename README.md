# On The Horse Cafeteria

An offline-first Flutter Android app with a locally bundled menu and cafe
branding. Customers can browse menu categories, build a cart, review itemized
totals, and prepare an order message for WhatsApp.

The menu includes sandwiches, meals, fresh juices, soda, soft drinks, coffee,
hot drinks, waffles, and smoothies. Prices are in EGP.

The Android launcher and web app icons use the cafe seal artwork in
`assets/app_icon.png`; Android adaptive icons use `assets/app_icon_foreground.png`.
Regenerate the configured icons with `dart run flutter_launcher_icons`.

## Run

Open the project in Android Studio or run it with Flutter:

```sh
flutter pub get
flutter run
```

To build an Android APK:

```sh
flutter build apk
```

Browsing and preparing an order work offline. Sending an order requires
WhatsApp and a network connection; checkout opens WhatsApp with the order
addressed to +20 10 36994744, and the customer must tap Send.
