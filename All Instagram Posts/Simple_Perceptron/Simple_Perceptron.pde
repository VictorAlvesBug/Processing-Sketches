Perceptron brain;

Point[] points = new Point[100];

int trainingIndex = 0;

void setup()
{
  //surface.setVisible(false);
  size(800, 800);
  // Perceptron(NumInputs)
  brain = new Perceptron(3);

  for (int p=0; p<points.length; p++)
  {
    points[p] = new Point();
  }
}

void draw()
{
  background(255);
  stroke(0);

  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));

  // Static line (goal)
  line(p1.pixelX(), p1.pixelY(), p2.pixelX(), p2.pixelY());

  Point p3 = new Point(-1, brain.guessY(-1));
  Point p4 = new Point(1, brain.guessY(1));

  // Moving line trying to reach the goal
  line(p3.pixelX(), p3.pixelY(), p4.pixelX(), p4.pixelY());

  //translate(width/2, height/2);

  for (Point pt : points)
  {
    pt.show();
  }

  // Testing Perceptron (guess an output to an input and test if it's correct)
  for (Point pt : points)
  {
    float[] inputs = {pt.x, pt.y, pt.bias};
    int target = pt.label;

    int guess = brain.guess(inputs);

    float px = pt.pixelX();
    float py = pt.pixelY();

    strokeWeight(5);

    if (guess == target)
    {
      // Draw a green check simbol over the point (CORRECT)
      fill(0, 128, 0);
      stroke(0, 128, 0);
      line(px-10, py, px, py+10);
      line(px, py+10, px+10, py-10);
    } else
    {
      // Draw a red cross simbol over the point (INCORRECT)
      fill(128, 0, 0);
      stroke(128, 0, 0);
      line(px-10, py-10, px+10, py+10);
      line(px-10, py+10, px+10, py-10);
    }

    strokeWeight(1);

    noStroke();
  }

  // Train each point bit a bit
  Point training = points[trainingIndex];
  float[] inputs = {training.x, training.y, training.bias};
  int target = training.label;
  brain.train(inputs, target);

  trainingIndex++;

  if (trainingIndex == points.length)
  {
    trainingIndex = 0;
  }
}