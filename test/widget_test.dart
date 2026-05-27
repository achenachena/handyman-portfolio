import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:handyman_portfolio/app_entry.dart';

void main() {
  testWidgets('App shell renders with Home tab selected', (tester) async {
    await tester.pumpWidget(const AppEntry(forceMock: true));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsWidgets);
    expect(find.byType(NavigationBar), findsOneWidget);
  });

  testWidgets('Bottom nav switches to Services tab', (tester) async {
    await tester.pumpWidget(const AppEntry(forceMock: true));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Services').last);
    await tester.pumpAndSettle();

    expect(find.text('Our Services'), findsOneWidget);
  });

  testWidgets('Bottom nav switches to Portfolio tab', (tester) async {
    await tester.pumpWidget(const AppEntry(forceMock: true));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Portfolio').last);
    await tester.pumpAndSettle();

    expect(find.text('A selection of recent projects.'), findsOneWidget);
  });

  testWidgets('Bottom nav switches to Reviews tab', (tester) async {
    await tester.pumpWidget(const AppEntry(forceMock: true));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Reviews').last);
    await tester.pumpAndSettle();

    expect(find.text('Customer Reviews'), findsOneWidget);
  });

  testWidgets('Bottom nav switches to Contact tab', (tester) async {
    await tester.pumpWidget(const AppEntry(forceMock: true));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Contact').last);
    await tester.pumpAndSettle();

    expect(find.text('Get In Touch'), findsOneWidget);
  });

  testWidgets('About page is accessible via info button', (tester) async {
    await tester.pumpWidget(const AppEntry(forceMock: true));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.info_outline));
    await tester.pumpAndSettle();

    expect(find.text('About Me'), findsOneWidget);
    expect(find.text('Jake Morrison'), findsOneWidget);
  });

  testWidgets('Contact form validates empty fields', (tester) async {
    await tester.pumpWidget(const AppEntry(forceMock: true));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Contact').last);
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('Send Message'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Send Message'));
    await tester.pumpAndSettle();

    expect(find.text('Required'), findsWidgets);
  });
}
