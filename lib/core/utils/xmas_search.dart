class XmasSearcher {
  final List<String> _lines;
  final String _targetWord = "XMAS";

  // Direções possíveis para formar a palavra (horizontal, vertical e diagonais)
  final List<List<int>> _directions = [
    [0, 1], // direita →
    [1, 0], // baixo ↓
    [0, -1], // esquerda ←
    [-1, 0], // cima ↑
    [1, 1], // diagonal ↘
    [1, -1], // diagonal ↙
    [-1, 1], // diagonal ↗
    [-1, -1], // diagonal ↖
  ];

  XmasSearcher(this._lines);

  int countOccurrences() {
    final matrix = _convertLinesToMatrix();
    final rowCount = matrix.length;
    final colCount = matrix[0].length;
    int totalCount = 0;

    // Passa por todas as posições da matriz (eixo Y, eixo X)
    for (int row = 0; row < rowCount; row++) {
      for (int col = 0; col < colCount; col++) {
        // Testa todas as direções possíveis a partir dessa posição
        for (final direction in _directions) {
          final rowStep = direction[0];
          final colStep = direction[1];

          // Se encontrar a palavra a partir daqui, incrementa o contador
          if (_isWordAt(matrix, row, col, rowStep, colStep)) {
            totalCount++;
          }
        }
      }
    }

    return totalCount;
  }

  /// Converte as linhas de texto para uma matriz de letras (List<List<String>>)
  List<List<String>> _convertLinesToMatrix() {
    return _lines.map((line) => line.split('')).toList();
  }

  /// Verifica se a palavra "XMAS" está presente a partir de uma posição (row, col)
  /// seguindo uma direção definida por rowStep e colStep
  bool _isWordAt(
    List<List<String>> matrix,
    int startRow,
    int startCol,
    int rowStep,
    int colStep,
  ) {
    for (int i = 0; i < _targetWord.length; i++) {
      final currentRow = startRow + rowStep * i;
      final currentCol = startCol + colStep * i;

      // Se sair da matriz, já retorna false
      if (currentRow < 0 ||
          currentRow >= matrix.length ||
          currentCol < 0 ||
          currentCol >= matrix[0].length) {
        return false;
      }

      // Se a letra atual da matriz for diferente da letra da palavra
      if (matrix[currentRow][currentCol] != _targetWord[i]) {
        return false;
      }
    }

    // Se passou por todas as letras e todas bateram, a palavra foi encontrada
    return true;
  }
}
