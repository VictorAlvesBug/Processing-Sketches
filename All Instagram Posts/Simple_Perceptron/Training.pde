float f(float x)
{
  // y = mx + b
  return 0.89 * x - 0.1;
}

class Point
{
  float x, y, bias;
  int label;

  Point()
  {
    x = random(-1, 1);
    y = random(-1, 1);
    
    bias = 1;

    this.setLabel();
  }

  Point(float x_, float y_)
  {
    x = x_;
    y = y_;
    bias = 1;

    this.setLabel();
  }

  void setLabel()
  {
    if (y > f(x))
    {
      label = 1;
    } else
    {
      label = -1;
    }
  }

  float pixelX()
  {
    return map(x, -1, 1, 0, width);
  }

  float pixelY()
  {
    return map(y, -1, 1, height, 0);
  }

  void show()
  {
    stroke(0);

    if (label == 1)
    {
      fill(255);
    } else
    {
      fill(0);
    }

    float px = pixelX();
    float py = pixelY();

    ellipse(px, py, 20, 20);
  }
}