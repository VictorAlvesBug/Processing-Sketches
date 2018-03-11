class Linha
{
  PVector inicio, fim;
  int valInicio=0, valFim=0;
  String tipo;
  
  Linha(String t)
  {
    this.tipo = t;
    
    inicio = new PVector((int)random(maxCols), (int)random(maxRows));
    fim = new PVector((int)random(maxCols), (int)random(maxRows));
    
    for (int row=0; row<maxRows; row++)
    {
      for (int col=0; col<maxCols; col++)
      {
        if(casa[col][row].index == inicio)
        {
          valInicio = casa[col][row].num;
        }
        
        if(casa[col][row].index == fim)
        {
          valFim = casa[col][row].num;
        }
      }
    }
  }
  
  void show()
  {
    strokeWeight(5);
    
    if(tipo == "Snake")
    {
      stroke(0, 128, 0);
    }
    else
    {
      stroke(92, 51, 23);
    }
    
    line(35+inicio.x*70, 35+inicio.y*70, 35+fim.x*70, 35+fim.y*70);
  }
}