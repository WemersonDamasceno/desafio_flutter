import 'package:desafio_flutter/core/constants/app_colors.dart';
import 'package:desafio_flutter/core/utils/file_helper.dart';
import 'package:desafio_flutter/presentation/widgets/info_christmas_widget.dart';
import 'package:flutter/material.dart';

class CounterXmasWordWidget extends StatelessWidget {
  final int total;
  final Function processLines;

  const CounterXmasWordWidget(
      {super.key, required this.total, required this.processLines});

  Future<void> _pickFile({required VoidCallback snackbar}) async {
    final lines = await FileHelper.pickTextLines();
    if (lines != null) {
      processLines(lines);
    } else {
      snackbar();
    }
  }

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
      child: SingleChildScrollView(
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
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                _pickFile(snackbar: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nenhum arquivo selecionado.'),
                    ),
                  );
                });
              },
              iconAlignment: IconAlignment.end,
              icon: const Icon(
                Icons.file_upload,
                color: Colors.white,
                size: 30,
              ),
              label: const Text(
                'Selecionar arquivo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(size.width, 56),
                backgroundColor: AppColors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
