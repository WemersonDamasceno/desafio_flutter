import 'package:desafio_flutter/presentation/views/xmas_counter_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XmasApp());

class XmasApp extends StatelessWidget {
  const XmasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: XmasCounterPage(),
    );
  }
}
