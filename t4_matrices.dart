import 'dart:math';

void main() {
  Matrix m1 = new Matrix(2, 2);
  print(m1.matrix);

  Matrix m2 = new Matrix(2, 2);

  print(m2.matrix);
  print('Addition');
  print(m1 + (m2));
  print('Subtraction');
  print((m1 - m2));

  print('Multiply');
  Matrix m4 = new Matrix.Fill(3, 3, 1);
  Matrix m5 = new Matrix.Fill(3, 3, 1);
  print(m4);
  print(m5);
  print((m4 * m5));

  print("\nTest");
  Matrix m6 = Matrix.fromList([
    [1, 2, 3]
  ]);
  print(m6);
  print(m6.shape);

  print('Transpose');
  Matrix m7 = Matrix(2, 3);
  print(m7);
  print('transposed:');
  print(m7.transpose());
}

class Matrix {
  List<List<num>> matrix = [[]];

  String get shape {
    return '${this.rows}x${this.cols}';
  }

  factory Matrix([int rows = 0, int cols = 0]) {
    if (rows < 0 || cols < 0) throw Exception('dimensions cannot be negative');
    return Matrix.fromList(List.generate(
        rows, (index) => List.generate(cols, (index) => Random().nextInt(10))));
  }
  Matrix.Zero([int rows = 0, int cols = 0]) {
    this.matrix = List.generate(rows, (_) => List.generate(cols, (_) => 0));
  }
  Matrix.Fill([int rows = 0, int cols = 0, num fill = 0]) {
    this.matrix = List.generate(rows, (_) => List.generate(cols, (_) => fill));
  }
  Matrix.fromList(List<List<int>> x) {
    this.matrix = x;
  }
  int get rows {
    return this.matrix.length;
  }

  int get cols {
    return this.matrix[0].length;
  }

  Matrix operator +(Matrix m2) {
    if (!((this.rows == m2.rows) && (this.cols == m2.cols)))
      throw Exception(
          'Matrices need to be of same shape for this operation to work');
    Matrix res = Matrix.Zero(this.rows, this.cols);
    for (var i = 0; i < this.rows; i++) {
      for (var j = 0; j < this.cols; j++) {
        res.matrix[i][j] = this.matrix[i][j] + m2.matrix[i][j];
      }
    }
    return res;
  }

  @override
  String toString() {
    return '${this.shape}\n' + this.matrix.toString();
  }

  Matrix operator -(Matrix m2) {
    if (!((this.rows == m2.rows) && (this.cols == m2.cols)))
      throw Exception(
          'Matrices need to be of same shape for this operation to work');
    Matrix res = Matrix.Zero(this.rows, this.cols);
    for (var i = 0; i < this.rows; i++) {
      for (var j = 0; j < this.cols; j++) {
        res.matrix[i][j] = this.matrix[i][j] - m2.matrix[i][j];
      }
    }
    return res;
  }

  Matrix operator *(Matrix m2) {
    if (!((this.cols == m2.rows)))
      throw Exception(
          'Matrices need to be of m*n and n*m shape for this operation to work');
    Matrix res = new Matrix.Zero(this.rows, m2.cols);
    int i_limit = this.rows;
    int j_limit = m2.cols;
    int k_limit = m2.rows;
    for (int i = 0; i < i_limit; i++) {
      for (int j = 0; j < j_limit; j++) {
        for (int k = 0; k < k_limit; k++) {
          res.matrix[i][j] += this.matrix[i][k] * this.matrix[k][j];
        }
      }
    }
    return res;
  }

  Matrix transpose() {
    Matrix res = new Matrix.Zero(this.cols, this.rows);
    for (int i = 0; i < this.rows; i++) {
      for (int j = 0; j < this.cols; j++) {
        res.matrix[j][i] = this.matrix[i][j];
      }
    }
    return res;
  }
}
