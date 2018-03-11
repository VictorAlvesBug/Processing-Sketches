float angulo = 0, raio = 100;
float StrokeWeight = 1;
PVector Stroke = new PVector(255, 255, 255);
PVector Fill = new PVector(255, 255, 255);
PVector cor;

void setup()
{
  size(900, 900);
  background(0);
}

void draw()
{
  translate(width/2, height/2);
  
  fill(0, 0, 0, 45);
  rect(-width/2-5, -height/2-5, width+10, height+10);
  
  rotate(angulo/3);
  
  raio = 150+75*sin(angulo);
  
  stroke(255);
  strokeWeight(1);
  noFill();
  //ellipse(0, 0, 2*raio, 2*raio);
  
  //cor = new PVector(50, 153, 204); // AZUL CLARO
  cor = new PVector(255, 128, 0); // LARANJA
  stroke(cor.x, cor.y, cor.z);
  
  float diametro = 8;
  
  PVector v1, v2, v3, v4;
  
  
  //noStroke();
  fill(cor.x, cor.y, cor.z);
  v1 = new PVector(raio*cos(angulo + (1/6.0)*TWO_PI), raio*sin(angulo + (1/6.0)*TWO_PI));
  v2 = new PVector(raio*cos(-angulo - (2/6.0)*TWO_PI), raio*sin(-angulo - (2/6.0)*TWO_PI));
  v3 = new PVector(raio*cos(angulo + (4/6.0)*TWO_PI), raio*sin(angulo + (4/6.0)*TWO_PI));
  v4 = new PVector(raio*cos(-angulo - (5/6.0)*TWO_PI), raio*sin(-angulo - (5/6.0)*TWO_PI));
  ellipse(v1.x, v1.y, diametro, diametro);
  ellipse(v2.x, v2.y, diametro, diametro);
  ellipse(v3.x, v3.y, diametro, diametro);
  ellipse(v4.x, v4.y, diametro, diametro);
  //stroke(0,0,255);
  line(v1.x, v1.y, v2.x, v2.y);
  line(v2.x, v2.y, v3.x, v3.y);
  line(v3.x, v3.y, v4.x, v4.y);
  line(v4.x, v4.y, v1.x, v1.y);
  //noStroke();
  fill(cor.x, cor.y, cor.z);
  v1 = new PVector(sin(angulo+PI/2)*2*raio*cos(2*PI/6), sin(angulo+PI/2)*2*raio*sin(2*PI/6));
  v2 = new PVector(sin(angulo+PI/2)*2*raio*cos(8*PI/6), sin(angulo+PI/2)*2*raio*sin(8*PI/6));
  v3 = new PVector(sin(angulo)*2*raio*cos(5*PI/6), sin(angulo)*2*raio*sin(5*PI/6));
  v4 = new PVector(sin(angulo)*2*raio*cos(11*PI/6), sin(angulo)*2*raio*sin(11*PI/6));
  //line(v3.x, v3.y, v4.x, v4.y);
  //stroke(0,0,255);
  line(v1.x, v1.y, v3.x, v3.y);
  line(v3.x, v3.y, v2.x, v2.y);
  line(v4.x, v4.y, v2.x, v2.y);
  line(v4.x, v4.y, v1.x, v1.y);
  
  //noStroke();
  fill(cor.x, cor.y, cor.z);
  v1 = new PVector(raio*cos(-angulo - (1/6.0)*TWO_PI), raio*sin(-angulo - (1/6.0)*TWO_PI));
  v2 = new PVector(raio*cos(angulo + (2/6.0)*TWO_PI), raio*sin(angulo + (2/6.0)*TWO_PI));
  v3 = new PVector(raio*cos(-angulo - (4/6.0)*TWO_PI), raio*sin(-angulo - (4/6.0)*TWO_PI));
  v4 = new PVector(raio*cos(angulo + (5/6.0)*TWO_PI), raio*sin(angulo + (5/6.0)*TWO_PI));
  ellipse(v1.x, v1.y, diametro, diametro);
  ellipse(v2.x, v2.y, diametro, diametro);
  ellipse(v3.x, v3.y, diametro, diametro);
  ellipse(v4.x, v4.y, diametro, diametro);
  //stroke(0,255,0);
  line(v1.x, v1.y, v2.x, v2.y);
  line(v2.x, v2.y, v3.x, v3.y);
  line(v3.x, v3.y, v4.x, v4.y);
  line(v4.x, v4.y, v1.x, v1.y);
  //noStroke();
  fill(cor.x, cor.y, cor.z);
  v1 = new PVector(sin(angulo)*2*raio*cos(1*PI/6), sin(angulo)*2*raio*sin(1*PI/6));
  v2 = new PVector(sin(angulo)*2*raio*cos(7*PI/6), sin(angulo)*2*raio*sin(7*PI/6));
  v3 = new PVector(sin(angulo+PI/2)*2*raio*cos(4*PI/6), sin(angulo+PI/2)*2*raio*sin(4*PI/6));
  v4 = new PVector(sin(angulo+PI/2)*2*raio*cos(10*PI/6), sin(angulo+PI/2)*2*raio*sin(10*PI/6));
  //line(v1.x, v1.y, v2.x, v2.y);
  //stroke(0,255,0);
  line(v1.x, v1.y, v3.x, v3.y);
  line(v3.x, v3.y, v2.x, v2.y);
  line(v4.x, v4.y, v2.x, v2.y);
  line(v4.x, v4.y, v1.x, v1.y);
  
  //noStroke();
  fill(cor.x, cor.y, cor.z);
  v1 = new PVector(raio*cos(angulo + (3/6.0)*TWO_PI), raio*sin(angulo + (3/6.0)*TWO_PI));
  v2 = new PVector(raio*cos(-angulo - (3/6.0)*TWO_PI), raio*sin(-angulo - (3/6.0)*TWO_PI));
  v3 = new PVector(raio*cos(angulo + (6/6.0)*TWO_PI), raio*sin(angulo + (6/6.0)*TWO_PI));
  v4 = new PVector(raio*cos(-angulo - (6/6.0)*TWO_PI), raio*sin(-angulo - (6/6.0)*TWO_PI));
  ellipse(v1.x, v1.y, diametro, diametro);
  ellipse(v2.x, v2.y, diametro, diametro);
  ellipse(v3.x, v3.y, diametro, diametro);
  ellipse(v4.x, v4.y, diametro, diametro);
  //stroke(255,0,0);
  line(v1.x, v1.y, v2.x, v2.y);
  line(v2.x, v2.y, v3.x, v3.y);
  line(v3.x, v3.y, v4.x, v4.y);
  line(v4.x, v4.y, v1.x, v1.y);
  //noStroke();
  fill(cor.x, cor.y, cor.z);
  v1 = new PVector(sin(angulo)*2*raio*cos(PI/2), sin(angulo)*2*raio*sin(PI/2));
  v2 = new PVector(sin(angulo)*2*raio*cos(3*PI/2), sin(angulo)*2*raio*sin(3*PI/2));
  v3 = new PVector(sin(angulo+PI/2)*2*raio*cos(0), sin(angulo+PI/2)*2*raio*sin(0));
  v4 = new PVector(sin(angulo+PI/2)*2*raio*cos(PI), sin(angulo+PI/2)*2*raio*sin(PI));
  //line(v1.x, v1.y, v2.x, v2.y);
  //stroke(255,0,0);
  line(v1.x, v1.y, v3.x, v3.y);
  line(v3.x, v3.y, v2.x, v2.y);
  line(v2.x, v2.y, v4.x, v4.y);
  line(v4.x, v4.y, v1.x, v1.y);
  
  angulo += 0.02;
}