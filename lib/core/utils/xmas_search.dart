import 'package:desafio_flutter/core/utils/position_interator.dart';

class XmasSearcher {
  final List<String> _lines;
  final String _targetWord = "XMAS";

  final List<List<int>> _directions = [
    [0, 1],
    [1, 0],
    [0, -1],
    [-1, 0],
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1],
  ];

  XmasSearcher(this._lines);

  int countOccurrences() {
    int count = 0;
    final rows = _lines.length;
    final cols = _lines.isNotEmpty ? _lines[0].length : 0;

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        for (var dir in _directions) {
          if (_checkWordAt(r, c, dir[0], dir[1])) {
            count++;
          }
        }
      }
    }

    return count;
  }

  bool _checkWordAt(int row, int col, int rowStep, int colStep) {
    final iterator = PositionIterator(_lines, row, col, rowStep, colStep);

    for (int i = 0; i < _targetWord.length; i++) {
      final char = iterator.next();
      if (char == null || char != _targetWord[i]) {
        return false;
      }
    }
    return true;
  }
}
