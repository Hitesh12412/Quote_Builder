import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quote_builder/main.dart'; // Make sure this path matches your app name

void main() {
  testWidgets('App launches and shows title', (WidgetTester tester) async {
    await tester.pumpWidget(const QuoteBuilderApp());

    expect(find.text('Product Quote Builder'), findsOneWidget);
  });
}
