import 'package:flutter/material.dart';
import 'screens/quote_form_screen.dart';

void main() {
  runApp(const QuoteBuilderApp());
}

class QuoteBuilderApp extends StatelessWidget {
  const QuoteBuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Quote Builder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const QuoteFormScreen(),
    );
  }
}
