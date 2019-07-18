float[][] before;
float[][] current;

int r;
int c;

void setup() {
  size(1000, 1000);
  
  r = height;
  c = width;

  current = new float[c][r];
  before = new float[c][r];
  
}

void mousePressed() {
  
  before[mouseX][mouseY] = 255;
  
}

void draw() {
  background(103,160,252);
  loadPixels();
    for (int i = 1; i < c - 1; i++) {
      for (int j = 1; j < r - 1; j++) {

        current[i][j] = (before[i + 1][j]
          + before[i - 1][j]
          + before[i][j - 1]
          + before[i][j + 1]) / 2
          - current[i][j];

        int index = i + j * c;
        //pixels[index] = color(current[i][j]);
        pixels[index] = color(before[i][j],current[i][j],100);
      }
    }
  updatePixels();

  float[][] temp = before;
  before = current;
  current = temp;
}
