float sigmoid(float x)
{
  return 1 / (1 + exp(-x));
}

float derivative(float x)
{
  return x * (1 - x);
}

class NeuralNetwork
{
  int input_nodes;
  int hidden_nodes;
  int output_nodes;

  float lr = 0.01;
  float erroAceitavel = 0.1;
  boolean aceitavel = false;

  Matrix weights_ih;
  Matrix weights_ho;

  Matrix bias_i;
  Matrix bias_h;
  Matrix bias_o;

  NeuralNetwork(int numI, int numH, int numO)
  {
    input_nodes = numI;
    hidden_nodes = numH;
    output_nodes = numO;

    weights_ih = new Matrix(numH, numI);
    weights_ho = new Matrix(numO, numH);
    bias_h = new Matrix(numH, 1);
    bias_o = new Matrix(numO, 1);

    this.reset();
  }

  void reset()
  {
    weights_ih.randomize();
    weights_ho.randomize();
    bias_h.randomize();
    bias_o.randomize();
  }

  float[] feedforward(float[] inputs_array)
  {
    Matrix inputs = new Matrix(inputs_array);
    Matrix hidden = new Matrix(matrix.multiply(weights_ih, inputs));
    hidden.add_(bias_h); 
    hidden.sigmoidEach_();

    Matrix outputs = new Matrix(matrix.multiply(weights_ho, hidden));
    outputs.add_(bias_o);
    outputs.sigmoidEach_();

    return outputs.toArray();
  }

  Matrix guess(float[] inputs_array)
  {
    Matrix inputs = new Matrix(inputs_array);
    Matrix hidden = new Matrix(matrix.multiply(weights_ih, inputs));
    hidden.add_(bias_h); 
    hidden.sigmoidEach_();

    Matrix outputs = new Matrix(matrix.multiply(weights_ho, hidden));
    outputs.add_(bias_o);
    outputs.sigmoidEach_();

    return outputs;
  }

  void train(float[] inputs_array, float[] targets_array)
  {
    aceitavel = false;

    while (!aceitavel)
    {
      Matrix inputs = new Matrix(inputs_array);
      Matrix hidden = new Matrix(matrix.multiply(weights_ih, inputs));
      hidden.add_(bias_h); 
      hidden.sigmoidEach_();

      Matrix outputs = new Matrix(matrix.multiply(weights_ho, hidden));
      outputs.add_(bias_o);
      outputs.sigmoidEach_();

      Matrix targets = new Matrix(targets_array);
      // ERROR = TARGETS - OUTPUTS
      Matrix output_errors = new Matrix(matrix.subtract(targets, outputs));

      //outputs.transpose().printMatrix("outputs");
      //targets.transpose().printMatrix("targets");
      output_errors.transpose().printMatrix("output_errors");

      aceitavel = output_errors.aceitavel(erroAceitavel);

      /*if (aceitavel)
      {
        output_errors.transpose().printMatrix("output_errors");
      }*/

      // Change hidden to output weights gradient descent
      Matrix d_outputs = new Matrix(outputs.derivativeEach());

      d_outputs.multiply_(output_errors);
      d_outputs.multiply_(lr);

      Matrix hidden_T = new Matrix(hidden.transpose());

      Matrix delta_weights_ho = new Matrix(matrix.multiply(d_outputs, hidden_T));

      weights_ho.add_(delta_weights_ho);

      //delta_weights_ho.printMatrix("delta_weights_ho");

      // Calculate the hidden layer errors
      Matrix who_t = new Matrix(weights_ho.transpose());
      Matrix hidden_errors = new Matrix(matrix.multiply(who_t, output_errors));

      // Change input to hidden weights gradient descent
      Matrix d_hidden = new Matrix(hidden.derivativeEach());

      d_hidden.multiply_(hidden_errors);
      d_hidden.multiply_(lr);

      Matrix inputs_T = new Matrix(inputs.transpose());

      Matrix delta_weights_ih = new Matrix(matrix.multiply(d_hidden, inputs_T));

      weights_ih.add_(delta_weights_ih);

      //Matrix who_delta = matrix.multiplyNum(lr, output_errors).multiply(outputs.derivativeEach());
    }
  }
}