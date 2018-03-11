class Button
{
  PVector pos, index;
  color cor;
  
  Button(int i, int j, color c)
  {
    this.index = new PVector(i, j);
    this.pos = new PVector(150+i*200, height/2-100+j*200);
    this.cor = c;
  }
  
  void show()
  {
    stroke(128);
    strokeWeight(5);
    fill(this.cor);
    rect(this.pos.x, this.pos.y, 150, 150, 40);
  }
  
  void click()
  {
    if (this.index.y * 3 + this.index.x == indice)
    {
      score++;
    }
    
    ShuffleColors();
  }
}