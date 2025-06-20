import 'dart:async';

import 'package:desafio_flutter/core/constants/app_colors.dart';
import 'package:desafio_flutter/core/constants/app_images.dart';
import 'package:desafio_flutter/core/utils/xmas_search.dart';
import 'package:desafio_flutter/presentation/widgets/christmas_blinking_lights_widget.dart';
import 'package:desafio_flutter/presentation/widgets/counter_xmas_word_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XmasCounterPage extends StatefulWidget {
  const XmasCounterPage({super.key});

  @override
  State<XmasCounterPage> createState() => _XmasCounterPageState();
}

class _XmasCounterPageState extends State<XmasCounterPage> {
  int? total;

  @override
  void initState() {
    super.initState();
    _loadDefaultAsset(); // carrega o input.txt por padrão
  }

  Future<void> _loadDefaultAsset() async {
    final input = await rootBundle.loadString('assets/input.txt');
    final lines = input
        .split('\n')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    _processLines(lines);
  }

  void _processLines(List<String> lines) {
    final searcher = XmasSearcher(lines);
    final count = searcher.countOccurrences();

    setState(() => total = count);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: total == null
            ? const CircularProgressIndicator()
            : Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 56,
                    child: SizedBox(
                      width: size.width,
                      child: Image.asset(AppImages.header, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: size.height * .46,
                    left: 0,
                    right: 0,
                    child: const ChristmasBlinkingLights(),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CounterXmasWordWidget(
                      total: total ?? 0,
                      processLines: (lines) => _processLines(lines),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
