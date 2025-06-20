import 'package:desafio_flutter/core/constants/app_colors.dart';
import 'package:desafio_flutter/presentation/widgets/info_christmas_widget.dart';
import 'package:flutter/material.dart';

class CounterXmasWordWidget extends StatelessWidget {
  final int total;
  const CounterXmasWordWidget({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16),
      height: size.height * .5,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'Total de "XMAS" encontrados:',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          Text(
            '$total',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          const InfoChristmasWidget(),
        ],
      ),
    );
  }
}
