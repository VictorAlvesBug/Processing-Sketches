

class Matrix
{
  float[][] matrix;

  Matrix(int numRows, int numCols)
  {
    this.matrix = new float[numRows][numCols];

    for (int row=0; row<this.matrix.length; row++)
    {
      for (int col=0; col<this.matrix[0].length; col++)
      {
        this.matrix[row][col] = 0;
      }
    }
  }

  Matrix(Matrix arr)
  {
    this.matrix = arr.matrix;
  }

  Matrix(float[][] arr)
  {
    this.matrix = arr;
  }

  Matrix(float[] vect)
  {
    this.matrix = new float[vect.length][1];

    for (int row=0; row<vect.length; row++)
    {
      this.matrix[row][0] = vect[row];
    }
  }

  // Aij.random(-1, 1)
  void randomize()
  {
    for (int row=0; row<this.matrix.length; row++)
    {
      for (int col=0; col<this.matrix[0].length; col++)
      {
        this.matrix[row][col] = random(-1, 1);
      }
    }
  }

  // A + B
  Matrix add(Matrix a, Matrix b)
  {
    Matrix result = new Matrix(a.matrix.length, a.matrix[0].length);

    for (int row=0; row<a.matrix.length; row++)
    {
      for (int col=0; col<a.matrix[0].length; col++)
      {
        result.matrix[row][col] = a.matrix[row][col] + b.matrix[row][col];
      }
    }

    return result;
  }

  // A + B
  Matrix add(Matrix a)
  {
    Matrix result = new Matrix(this.matrix.length, this.matrix[0].length);

    for (int row=0; row<this.matrix.length; row++)
    {
      for (int col=0; col<this.matrix[0].length; col++)
      {
        result.matrix[row][col] += a.matrix[row][col];
      }
    }

    return result;
  }

  // A + B
  void add_(Matrix a)
  {
    for (int row=0; row<this.matrix.length; row++)
    {
      for (int col=0; col<this.matrix[0].length; col++)
      {
        this.matrix[row][col] += a.matrix[row][col];
      }
    }
  }

  // A - B
  Matrix subtract(Matrix a, Matrix b)
  {
    Matrix result = new Matrix(a.matrix.length, a.matrix[0].length);

    for (int row=0; row<result.matrix.length; row++)
    {
      for (int col=0; col<result.matrix[0].length; col++)
      {
        result.matrix[row][col] = a.matrix[row][col] - b.matrix[row][col];
      }
    }

    return result;
  }

  // A - B
  Matrix subtract(Matrix a)
  {
    Matrix result = new Matrix(this.matrix.length, this.matrix[0].length);

    for (int row=0; row<this.matrix.length; row++)
    {
      for (int col=0; col<this.matrix[0].length; col++)
      {
        result.matrix[row][col] -= a.matrix[row][col];
      }
    }

    return result;
  }

  // A - B
  void subtract_(Matrix a)
  {
    for (int row=0; row<this.matrix.length; row++)
    {
      for (int col=0; col<this.matrix[0].length; col++)
      {
        this.matrix[row][col] -= a.matrix[row][col];
      }
    }
  }

  // A * B
  Matrix multiply(Matrix a)
  {
    Matrix result = new Matrix(this.matrix.length, a.matrix[0].length);

    for (int row=0; row<result.matrix.length; row++)
    {
      for (int col=0; col<result.matrix[0].length; col++)
      {
        float sum = 0;

        for (int i=0; i<a.matrix[0].length; i++)
        {
          sum += this.matrix[row][i] * a.matrix[i][col];
        }

        result.matrix[row][col] = sum;
      }
    }

    return result;
  }

  // A * B
  void multiply_(Matrix a)
  {
    Matrix result = new Matrix(this.matrix.length, a.matrix[0].length);

    for (int row=0; row<result.matrix.length; row++)
    {
      for (int col=0; col<result.matrix[0].length; col++)
      {
        float sum = 0;

        for (int i=0; i<a.matrix[0].length; i++)
        {
          sum += this.matrix[row][i] * a.matrix[i][col];
        }

        result.matrix[row][col] = sum;
      }
    }
    this.matrix = result.matrix;
  }

  // A * B
  Matrix multiply(Matrix a, Matrix b)
  {
    Matrix result = new Matrix(a.matrix.length, b.matrix[0].length);

    for (int row=0; row<result.matrix.length; row++)
    {
      for (int col=0; col<result.matrix[0].length; col++)
      {
        float sum = 0;

        for (int i=0; i<a.matrix[0].length; i++)
        {
          sum += a.matrix[row][i] * b.matrix[i][col];
        }

        result.matrix[row][col] = sum;
      }
    }

    return result;
  }

  // n * A
  Matrix multiply(float n, Matrix a)
  {
    Matrix result = new Matrix(a.matrix.length, a.matrix[0].length);

    for (int row=0; row<result.matrix.length; row++)
    {
      for (int col=0; col<result.matrix[0].length; col++)
      {
        result.matrix[row][col] = n * a.matrix[row][col];
      }
    }

    return result;
  }

  // n * A
  Matrix multiply(float n)
  {
    Matrix result = new Matrix(this.matrix.length, this.matrix[0].length);

    for (int row=0; row<result.matrix.length; row++)
    {
      for (int col=0; col<result.matrix[0].length; col++)
      {
        result.matrix[row][col] = n * this.matrix[row][col];
      }
    }

    return result;
  }

  // n * A
  void multiply_(float n)
  {
    for (int row=0; row<this.matrix.length; row++)
    {
      for (int col=0; col<this.matrix[0].length; col++)
      {
        this.matrix[row][col] = n * this.matrix[row][col];
      }
    }
  }

  // At
  Matrix transpose()
  {
    Matrix result = new Matrix(this.matrix[0].length, this.matrix.length);

    for (int row=0; row<result.matrix.length; row++)
    {
      for (int col=0; col<result.matrix[0].length; col++)
      {
        result.matrix[row][col] = this.matrix[col][row];
      }
    }

    return result;
  }

  // A . B
  float dotProduct(Matrix a)
  {
    float result = 0;

    for (int row=0; row<a.matrix.length; row++)
    {
      for (int col=0; col<a.matrix[0].length; col++)
      {
        result += this.matrix[row][col] * a.matrix[row][col];
      }
    }

    return result;
  }

  // Aij * Bij
  Matrix Hadamard(Matrix a)
  {
    Matrix result = new Matrix(a.matrix.length, a.matrix[0].length);

    for (int row=0; row<result.matrix.length; row++)
    {
      for (int col=0; col<result.matrix[0].length; col++)
      {
        result.matrix[row][col] = this.matrix[row][col] * a.matrix[row][col];
      }
    }

    return result;
  }

  // Aij * Bij
  void Hadamard_(Matrix a)
  {
    for (int row=0; row<this.matrix.length; row++)
    {
      for (int col=0; col<this.matrix[0].length; col++)
      {
        this.matrix[row][col] = this.matrix[row][col] * a.matrix[row][col];
      }
    }
  }

  float determinant(Matrix a)
  {
    if (a.matrix.length != a.matrix[0].length)
    {
      return 0;
    } else
    {
      switch(a.matrix.length)
      {
      case 2:
        return a.matrix[0][0]*a.matrix[1][1] - a.matrix[0][1]*a.matrix[1][0];

      case 3:
        return 
          + a.matrix[0][0]*a.matrix[1][1]*a.matrix[2][2]
          + a.matrix[0][1]*a.matrix[1][2]*a.matrix[2][0]
          + a.matrix[0][2]*a.matrix[1][0]*a.matrix[2][1]
          - a.matrix[0][0]*a.matrix[1][2]*a.matrix[2][1]
          - a.matrix[0][1]*a.matrix[1][0]*a.matrix[2][2]
          - a.matrix[0][2]*a.matrix[1][1]*a.matrix[2][0];

      default:
        return 0;
      }
    }
  }

  /*Matrix map(func)
   {
   Matrix result.matrix = new Matrix(a.length, a[0].length);
   
   for (int row=0; row<result.length; row++)
   {
   for (int col=0; col<result[0].length; col++)
   {
   result.matrix[row][col] = func(a.matrix[row][col]);
   }
   }
   
   return result;
   }*/

  Matrix sigmoidEach()
  {
    Matrix result = new Matrix(this.matrix.length, this.matrix[0].length);

    for (int row=0; row<result.matrix.length; row++)
    {
      for (int col=0; col<result.matrix[0].length; col++)
      {
        result.matrix[row][col] = sigmoid(this.matrix[row][col]);
      }
    }

    return result;
  }

  void sigmoidEach_()
  {
    for (int row=0; row<this.matrix.length; row++)
    {
      for (int col=0; col<this.matrix[0].length; col++)
      {
        this.matrix[row][col] = sigmoid(this.matrix[row][col]);
      }
    }
  }

  Matrix derivativeEach(Matrix a)
  {
    Matrix result = new Matrix(a.matrix.length, a.matrix[0].length);

    for (int row=0; row<result.matrix.length; row++)
    {
      for (int col=0; col<result.matrix[0].length; col++)
      {
        result.matrix[row][col] = derivative(a.matrix[row][col]);
      }
    }

    return result;
  }

  Matrix derivativeEach()
  {
    Matrix result = new Matrix(this.matrix.length, this.matrix[0].length);

    for (int row=0; row<result.matrix.length; row++)
    {
      for (int col=0; col<result.matrix[0].length; col++)
      {
        result.matrix[row][col] = derivative(this.matrix[row][col]);
      }
    }

    return result;
  }

  void derivativeEach_()
  {
    for (int row=0; row<this.matrix.length; row++)
    {
      for (int col=0; col<this.matrix[0].length; col++)
      {
        this.matrix[row][col] = derivative(this.matrix[row][col]);
      }
    }
  }

  boolean aceitavel(float erroAveitavel)
  {
    boolean acceptable = true;

    for (int row=0; row<this.matrix.length; row++)
    {
      for (int col=0; col<this.matrix[0].length; col++)
      {
        if (abs(this.matrix[row][col]) > erroAveitavel)
        {
          acceptable = false;
        }
      }
    }

    return acceptable;
  }

  Matrix fromArray(float[] a)
  {
    Matrix result = new Matrix(a.length, 1);

    for (int row=0; row<a.length; row++)
    {
      result.matrix[row][0] = a[row];
    }

    return result;
  }

  Matrix fromArray(float[][] a)
  {
    return new Matrix(a);
  }

  float[] toArray()
  {
    float[] result = new float[this.matrix.length * this.matrix[0].length];

    for (int row=0; row<this.matrix.length; row++)
    {
      for (int col=0; col<this.matrix[0].length; col++)
      {
        result[col*this.matrix.length + row] = this.matrix[row][col];
      }
    }

    return result;
  }

  void printMatrix(String name)
  {
    print(name + " = ");
    for (int row=0; row<this.matrix.length; row++)
    {
      for (int col=0; col<this.matrix[0].length; col++)
      {
        print(this.matrix[row][col]+"   ");
      }
      println();
    }
  }
}