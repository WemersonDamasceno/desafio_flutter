class PositionIterator {
  final List<String> lines;
  final int rowStep;
  final int colStep;

  int currentRow;
  int currentCol;

  PositionIterator(
    this.lines,
    this.currentRow,
    this.currentCol,
    this.rowStep,
    this.colStep,
  );

  String? next() {
    // Verifica se a posição atual está dentro dos limites da lista
    if (currentRow < 0 || currentRow >= lines.length) return null;
    if (currentCol < 0 || currentCol >= lines[currentRow].length) return null;

    // Pega o caractere da posição atual
    String char = lines[currentRow][currentCol];

    // Move para a próxima posição na direção (rowStep, colStep)
    currentRow += rowStep;
    currentCol += colStep;

    // Retorna o caractere encontrado
    return char;
  }
}
