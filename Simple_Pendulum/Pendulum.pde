class Pendulum
{
  PVector origem;
  float raio;
  float massa = 30;
  float angle = PI/4;
  float angle_vel = 0;
  float angle_acc = 0;
  float forca = 0;

  Pendulum(float r)
  {
    origem = new PVector(width/2, 50);
    this.raio = r;
  }

  void update()
  {
    // sin(angle) = forca / gravity
    forca = sin(angle)*gravity*massa/raio;
    angle_acc = forca / massa;
    angle_vel *= 0.999;
    angle_vel += angle_acc;
    angle += angle_vel;
  }

  void show()
  {
    pushMatrix();
    translate(origem.x, origem.y);
    PVector ponta = new PVector(raio*cos(PI/2 + angle), raio*sin(PI/2 + angle));
    line(0, 0, ponta.x, ponta.y);
    ellipse(ponta.x, ponta.y, massa, massa);
    popMatrix();
  }
}