class NeuralNetwork
{
  Weight[][] Weight_InputsToHiddens;
  Weight[][] Weight_HiddensToOutputs;
  float LearnRate = 0.5f, precision = 0.0001f;
  int geracao = 0, maxGeracao = 10000000;
  Neuron[] hiddens, outputs;

  NeuralNetwork(int numInputs, int numHiddens, int numOutputs)
  {
    this.Weight_InputsToHiddens = new Weight[numInputs][numHiddens];
    this.Weight_HiddensToOutputs = new Weight[numHiddens][numOutputs];

    this.hiddens = new Neuron[numHiddens];

    for (int h=0; h<numHiddens; h++)
    {
      this.hiddens[h] = new Neuron();

      for (int i=0; i<numInputs; i++)
      {
        Weight_InputsToHiddens[i][h] = new Weight();
        Weight_InputsToHiddens[i][h].value = 0.1f;//random(1);
      }
    }

    for (int o=0; o<numOutputs; o++)
    {
      for (int h=0; h<numHiddens; h++)
      {
        Weight_HiddensToOutputs[h][o] = new Weight();
        Weight_HiddensToOutputs[h][o].value = 0.1f;//random(1);
      }
    }
  }

  void train(float[] inputsValue, float[] targets)
  {
    geracao = 0;
    
    while (true && geracao<maxGeracao)
    {
      Neuron[] inputs = new Neuron[inputsValue.length];

      for (int i=0; i<inputs.length; i++)
      {
        inputs[i] = new Neuron();
        inputs[i].value = inputsValue[i];
      }

      // targets and outputs have the same length
      outputs = new Neuron[targets.length];

      ///   INPUTS TO HIDDENS
      for (int h=0; h<hiddens.length; h++)
      {
        float value = 0;

        for (int i=0; i<inputs.length; i++)
        {
          value += inputs[i].value*Weight_InputsToHiddens[i][h].value;
        }

        hiddens[h].value = value;
      }

      ///   HIDDENS TO OUTPUTS
      for (int o=0; o<outputs.length; o++)
      {
        this.outputs[o] = new Neuron();

        float value = 0;

        for (int h=0; h<hiddens.length; h++)
        {
          value += hiddens[h].value*Weight_HiddensToOutputs[h][o].value;
        }

        outputs[o].value = value;
      }

      /// CALCULATING OUTPUTS ERROR
      float[] err = new float[outputs.length];
      for (int o=0; o<outputs.length; o++)
      {
        err[o] = 10;

        outputs[o].error = targets[o] - outputs[o].value;

        print("( t=" + targets[o] + " - ");
        print("o=" + outputs[o].value + " = ");
        print("e=" + outputs[o].error + " );");
        println();
      }

      println();

      boolean finish = true;

      for (int o=0; o<outputs.length; o++)
      {
        if (abs(outputs[o].error) > precision)
        {
          finish = false;
        }
      }

      if (finish)
      {
        return;
      }

      /// CALCULATING HIDDENS ERROR
      for (int h=0; h<hiddens.length; h++)
      {
        float weightsSum = 0;

        for (int o=0; o<outputs.length; o++)
        {
          weightsSum += Weight_HiddensToOutputs[h][o].value;
        }

        float error = 0;

        for (int o=0; o<outputs.length; o++)
        {
          error += (Weight_HiddensToOutputs[h][o].value/weightsSum) * outputs[o].error;
        }

        hiddens[h].error = error;
      }

      /// CALCULATING THE NEW WEIGHTS_IH

      // I.erro[I] = Sum(W[I][H] * H.erro[H])
      // v = Sum(W[I][H] * H.erro[H])
      // WIH.value = WIH.value + LearnRate * H.erro[H] * (e^v / (e^v + 1)^2)

      // DeltaWij = Lr * Ei * sig(oi) * (1 - sig(oi))

      for (int i=0; i<inputs.length; i++)
      {
        float v = 0;

        for (int h=0; h<hiddens.length; h++)
        {
          v += Weight_InputsToHiddens[i][h].value * hiddens[h].error;
          //Weight_InputsToHiddens[i][h].delta = LearnRate * hiddens[h].error * derivative(sigmoid(outputs[o].value));
        }

        for (int h=0; h<hiddens.length; h++)
        {
          // WIH.value = WIH.value + LearnRate * H.erro[H] * (e^v / (e^v + 1)^2)
          Weight_InputsToHiddens[i][h].value += LearnRate * hiddens[h].error * derivative(sigmoid(hiddens[h].value));//( pow(exp(1), v) / pow(pow(exp(1), v)+1, 2));
        }
      }

      /// CALCULATING THE NEW WEIGHTS_HO

      for (int h=0; h<hiddens.length; h++)
      {
        float v = 0;

        for (int o=0; o<outputs.length; o++)
        {
          v += Weight_HiddensToOutputs[h][o].value * hiddens[o].error;
        }

        for (int o=0; o<outputs.length; o++)
        {
          // WHO.value = WHO.value + LearnRate * O.erro[O] * (e^v / (e^v + 1)^2)
          Weight_HiddensToOutputs[h][o].value += LearnRate * outputs[o].error * derivative(sigmoid(outputs[o].value));//( pow(exp(1), v) / pow(pow(exp(1), v)+1, 2) );
        }
      }
      
      //geracao++;
    }
  }
  
  void use(float[] inputsValue)
  {
      Neuron[] inputs = new Neuron[inputsValue.length];

      for (int i=0; i<inputs.length; i++)
      {
        inputs[i] = new Neuron();
        inputs[i].value = inputsValue[i];
      }

      ///   INPUTS TO HIDDENS
      for (int h=0; h<hiddens.length; h++)
      {
        float value = 0;

        for (int i=0; i<inputs.length; i++)
        {
          value += inputs[i].value*Weight_InputsToHiddens[i][h].value;
        }

        hiddens[h].value = value;
      }

      ///   HIDDENS TO OUTPUTS
      for (int o=0; o<outputs.length; o++)
      {
        this.outputs[o] = new Neuron();

        float value = 0;

        for (int h=0; h<hiddens.length; h++)
        {
          value += hiddens[h].value*Weight_HiddensToOutputs[h][o].value;
        }

        outputs[o].value = value;
      }

      ///   PRINT ANSWER
      for (int i=0; i<inputs.length; i++)
      {
        print(inputs[i].value);
        
        if(i != inputs.length-1)
        {
        print(" + ");///////////////////////
        }
      }
      
      print(" = ");
      
      for (int o=0; o<outputs.length; o++)
      {
        print(outputs[o].value);
      }
      
      float result = 0;///////////////////////
      
      for (int i=0; i<inputs.length; i++)
      {
        result += inputs[i].value;/////////////////////////
      }
      
      print(" ("+result+")");
      
      println();
      println("e = "+(result-outputs[0].value));
      
      println();
  }
}

float sigmoid(float value)
{
  return 1 / (1 + pow(exp(1.0f), -value));
}

float derivative(float value)
{
  return value * (1 - value);
}