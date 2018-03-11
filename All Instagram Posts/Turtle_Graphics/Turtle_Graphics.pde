Turtle turtle;
String input="  Victor   ";
boolean enter = true;

void setup()
{
  size(800, 800);
  turtle = new Turtle(0, 0, -PI);
}

void draw()
{
  background(255);

  stroke(0);

  if (enter)
  {
    InterpretarTexto(input);
  }
}

void InterpretarTexto(String texto)
{
  String trecho = "";

  /// Trim();
  String novoTexto = "";
  boolean inicio = true;

  for (int i=0; i<texto.length(); i++)
  {
    if (texto.charAt(i) != ' ' || !inicio)
    {
      inicio = false;
      novoTexto += texto.charAt(i);
    }
  }

  while (novoTexto.charAt(novoTexto.length()-1) == ' ')
  {
    novoTexto = novoTexto.substring(0, novoTexto.length()-1);
  }
  texto = novoTexto;
  /// Trim();

  

  boolean insideParenteses = false;

  for (int i=0; i<texto.length(); i++)
  {
    char c = texto.charAt(i);
    
    if (c == '(')
    {
      insideParenteses = true;
    }
    
    switch();
    if (c != '(' && c != ')' && c != ';')
    {
      trecho+=texto.charAt(i);
    } else
    {
      switch(trecho)
      {
        case "Rotate":
        break;
        case "GoForward":
        break;
        case "RIGHT":
        break;
        case "LEFT":
        break;
      }
    }
  }
}

void keyPressed()
{
  /*if (key == )
   {
   }*/
}