import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:on_the_horse_cafeteria/main.dart';

void main() {
  test('WhatsApp order link encodes the message for the cafe number', () {
    final uri = buildWhatsAppOrderUri('Order: burger & fries');

    expect(uri.scheme, 'https');
    expect(uri.host, 'wa.me');
    expect(uri.path, '/201036994744');
    expect(uri.queryParameters['text'], 'Order: burger & fries');
  });

  test('added menu selections and prices are available offline', () {
    expect(findMenuItem('Red Tea')?.price, 10);
    expect(findMenuItem('Cappuccino (Double)')?.price, 70);
    expect(findMenuItem('Mix Waffle')?.price, 80);
    expect(findMenuItem('Strawberry Passion Fruit Smoothie')?.price, 60);
  });

  testWidgets('customers can add a menu item and review checkout', (
    tester,
  ) async {
    await tester.pumpWidget(const OnTheHorseApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome'), findsOneWidget);
    expect(find.text('On The Horse Cafeteria'), findsOneWidget);
    await tester.tap(find.byKey(const Key('welcome-enter-menu')));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to On The Horse'), findsOneWidget);
    expect(find.text('OUR MENU'), findsOneWidget);

    await tester.tap(find.byTooltip('Add Fries'));
    await tester.pumpAndSettle();
    expect(find.text('1 item'), findsOneWidget);
    expect(find.text('EGP 50  ·  Checkout'), findsOneWidget);

    await tester.tap(find.text('EGP 50  ·  Checkout'));
    await tester.pumpAndSettle();
    expect(find.text('Review your order'), findsOneWidget);
    expect(find.text('1 × Fries'), findsOneWidget);
    expect(find.text('Send order on WhatsApp'), findsOneWidget);
  });
}
