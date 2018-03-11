float escala = 0;

ArrayList<Line> segment = new ArrayList<Line>();
ArrayList<Line> previousSegment = new ArrayList<Line>();

void setup()
{
  size(800, 800);

  noCursor();

  float lados = 6;

  float raio = 300;

  for (float i=0; i<TWO_PI; i += TWO_PI/lados)
  {
    segment.add(new Line( 
      raio*cos(i), 
      raio*sin(i), 
      raio*cos(i + TWO_PI/lados), 
      raio*sin(i + TWO_PI/lados)
      ));
  }
}

void draw()
{
  background(0);
  translate(width/2, height/2);

  stroke(255);

  for (int i=0; i<segment.size(); i++)
  {
    segment.get(i).draw();
  }
}

void mouseClicked()
{
  previousSegment.clear();

  for (int i=0; i<segment.size(); i++)
  {
    previousSegment.add(segment.get(i));
  }

  segment.clear();

  for (int i=0; i<previousSegment.size(); i++)
  {
    Line line = new Line(
      previousSegment.get(i).start.x, 
      previousSegment.get(i).start.y, 
      previousSegment.get(i).end.x, 
      previousSegment.get(i).end.y
      );

    /// PONTOS DE 0 A 4
    ///  0 --> PONTO INICIAL DA LINHA ANTERIOR
    ///  1 --> FIM DO PRIMEIRO TERÇO DA LINHA ANTERIOR
    ///  2 --> PICO DO TRIANGULO CENTRAL
    ///  1 --> FIM DO SEGUNDO TERÇO DA LINHA ANTERIOR
    ///  4 --> PONTO FINAL DA LINHA ANTERIOR

    PVector PONTO_INICIAL_DA_LINHA_ANTERIOR = new PVector(
      line.start.x, 
      line.start.y
      );

    PVector FIM_DO_PRIMEIRO_TERCO_DA_LINHA_ANTERIOR = new PVector(
      line.start.x+(1/3.0)*line.distanceVersor.x, 
      line.start.y+(1/3.0)*line.distanceVersor.y
      );

    PVector PICO_DO_TRIANGULO_CENTRAL = new PVector(
      FIM_DO_PRIMEIRO_TERCO_DA_LINHA_ANTERIOR.x + (1/3.0)*line.distance*cos(line.angle - PI/3), 
      FIM_DO_PRIMEIRO_TERCO_DA_LINHA_ANTERIOR.y + (1/3.0)*line.distance*sin(line.angle - PI/3)
      );

    PVector FIM_DO_SEGUNDO_TERCO_DA_LINHA_ANTERIOR = new PVector(
      PICO_DO_TRIANGULO_CENTRAL.x + (1/3.0)*line.distance*cos(line.angle + PI/3), 
      PICO_DO_TRIANGULO_CENTRAL.y + (1/3.0)*line.distance*sin(line.angle + PI/3)
      );

    PVector PONTO_FINAL_DA_LINHA_ANTERIOR = new PVector(
      line.end.x, 
      line.end.y
      );


      segment.add(new Line(
        PONTO_INICIAL_DA_LINHA_ANTERIOR.x, 
        PONTO_INICIAL_DA_LINHA_ANTERIOR.y, 
        FIM_DO_PRIMEIRO_TERCO_DA_LINHA_ANTERIOR.x, 
        FIM_DO_PRIMEIRO_TERCO_DA_LINHA_ANTERIOR.y
        ));
        
      segment.add(new Line(
        FIM_DO_PRIMEIRO_TERCO_DA_LINHA_ANTERIOR.x, 
        FIM_DO_PRIMEIRO_TERCO_DA_LINHA_ANTERIOR.y, 
        PICO_DO_TRIANGULO_CENTRAL.x, 
        PICO_DO_TRIANGULO_CENTRAL.y
        ));
        
      segment.add(new Line(
        PICO_DO_TRIANGULO_CENTRAL.x, 
        PICO_DO_TRIANGULO_CENTRAL.y, 
        FIM_DO_SEGUNDO_TERCO_DA_LINHA_ANTERIOR.x, 
        FIM_DO_SEGUNDO_TERCO_DA_LINHA_ANTERIOR.y
        ));
        
      segment.add(new Line(
        FIM_DO_SEGUNDO_TERCO_DA_LINHA_ANTERIOR.x, 
        FIM_DO_SEGUNDO_TERCO_DA_LINHA_ANTERIOR.y, 
        PONTO_FINAL_DA_LINHA_ANTERIOR.x, 
        PONTO_FINAL_DA_LINHA_ANTERIOR.y
        ));
  }
}