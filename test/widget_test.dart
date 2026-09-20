import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_first_app/main.dart';

void main() {
  testWidgets('navigates from home to detail and back to home',
      (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Layanan Kami'), findsOneWidget);

    await tester.tap(find.text('Web Development'));
    await tester.pumpAndSettle();

    expect(find.text('Deskripsi'), findsOneWidget);
    expect(find.text('Pesan Sekarang'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.text('Layanan Kami'), findsOneWidget);
  });

  testWidgets('order button toggles confirmation state via setState',
      (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Web Development'));
    await tester.pumpAndSettle();

    expect(find.text('Pesan Sekarang'), findsOneWidget);
    await tester.ensureVisible(find.text('Pesan Sekarang'));
    await tester.tap(find.text('Pesan Sekarang'));
    await tester.pumpAndSettle();

    expect(find.text('Pesanan Dikonfirmasi — 1 item'), findsOneWidget);
    expect(find.text('Pesan Sekarang'), findsNothing);
  });

  testWidgets('favorite button toggles icon via setState', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Web Development'));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets('quantity stepper updates total via setState', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Web Development'));
    await tester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('Rp 1.000.000'), findsNWidgets(2));

    await tester.tap(find.byIcon(Icons.add_circle_outline));
    await tester.pumpAndSettle();
    expect(find.text('2'), findsOneWidget);
    expect(find.text('Rp 2.000.000'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove_circle_outline));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.remove_circle_outline));
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove_circle_outline));
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);
  });
}