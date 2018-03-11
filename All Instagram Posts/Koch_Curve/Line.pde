class Line
{
  PVector start, end, distanceVersor;
  float angle, distance;

  Line(float startX, float startY, float endX, float endY)
  {
    start = new PVector(startX, startY);
    end = new PVector(endX, endY);
    distanceVersor = new PVector(endX-startX, endY-startY);
    angle = atan2(distanceVersor.y,distanceVersor.x);
    distance = dist(startX, startY, endX, endY);
  }


  void draw()
  {
    line(start.x, start.y, end.x, end.y);
  }
}