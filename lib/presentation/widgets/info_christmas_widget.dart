import 'package:desafio_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class InfoChristmasWidget extends StatelessWidget {
  const InfoChristmasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.infoColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🎄 O que significa XMAS?',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '"XMAS" é uma forma abreviada de "Christmas" (Natal, em inglês).',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
