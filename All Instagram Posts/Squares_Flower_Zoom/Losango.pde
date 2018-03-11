class Losango
{
  int raio, angulo;
  float radius, angle, diagonalLosango, ladoLosango, diagonalExterior;
  PVector centroLosango, cor;

  Losango(int raio, int angulo, float radiusExterior, float diagonalExterior)
  {
    this.raio = raio;
    this.angulo = angulo;
    this.diagonalExterior = diagonalExterior;

    angle = map(this.angulo, 0, maxAngulo, 0, TWO_PI);
    angle += (this.raio%2)*(PI/maxAngulo);
    this.cor = new PVector(map(min(abs(angulo-0), abs(angulo-maxAngulo)), 0, maxAngulo/2, 255, 0), map(min(abs(angulo-maxAngulo/3), abs(angulo-4*maxAngulo/3)), 0, maxAngulo/2, 255, 0), map(min(abs(angulo+maxAngulo/3), abs(angulo-2*maxAngulo/3)), 0, maxAngulo/2, 255, 0));

    radius = radiusExterior - (this.diagonalExterior/2)*1.1;
    centroLosango = new PVector(radius*cos(angle), radius*sin(angle));
    diagonalLosango = dist(radius*cos(angle-PI/maxAngulo), radius*sin(angle-PI/maxAngulo), radius*cos(angle+PI/maxAngulo), radius*sin(angle+PI/maxAngulo));
    ladoLosango = diagonalLosango/sqrt(2);
    // d = l*sqrt(2)
    // l = d/sqrt(2)
  }

  void update()
  {
    boolean zoomIn = true;

    if (zoomIn)
    {
      amplitude += map(amplitude, 600, 1180, 0.01, 0.02);

      if (amplitude>=1180)
      {
        amplitude = 600.01;
      }
    }
    else
    {
      amplitude -= map(amplitude, 600, 1180, 0.01, 0.02);

      if (amplitude<600.01)
      {
        amplitude = 1180;
      }
    }

    centroLosango = new PVector(radius*cos(angle), radius*sin(angle));
    diagonalLosango = dist(radius*cos(angle-PI/maxAngulo), radius*sin(angle-PI/maxAngulo), radius*cos(angle+PI/maxAngulo), radius*sin(angle+PI/maxAngulo));
    ladoLosango = diagonalLosango/sqrt(2);
  }

  void draw()
  {
    noFill();
    //fill(255-cor.x, 255-cor.y, 255-cor.z);
    stroke(cor.x, cor.y, cor.z);
    strokeWeight(2);

    rectMode(CENTER);

    translate(centroLosango.x, centroLosango.y);
    rotate(PI/4 + angle);
    rect(0, 0, ladoLosango, ladoLosango);
    rotate(-PI/4 - angle);
    translate(-centroLosango.x, -centroLosango.y);
  }
}