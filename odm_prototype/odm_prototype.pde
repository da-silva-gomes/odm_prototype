color white = color(250, 250, 250);
color black = color(0, 0, 0);

String date = "8 9 10 11 12 13";
String months = "11nd June";
String what = "Jan Van Toorn, Out the poster. Interactive exhibition at Colégio das Artes";

int line_height = 16;
int index;

float img_size, img_y, img_x;

PFont poppins, poppins_lighter;

PImage[] colagens = new PImage[7];

void setup() {
  size(1300, 900);
  background(white);

  poppins = createFont("Poppins-Black", 120);
  poppins_lighter = createFont("Poppins-Regular", 120);

  for (int i = 1; i < colagens.length; i++) {
    colagens[i] = loadImage("recorte"+i+".png");

    img_size  = random(200, 600);
    img_y = random(img_size/2, height-img_size/2);
    img_x = random(img_size/2, width-img_size/2);

    //index = int(random(1, colagens.length));
    //println(index);

    imageMode(CENTER);
    image(colagens[i], img_x, img_y, img_size, img_size);
    filter(GRAY);
  }
}

void draw() {
  fill(black);
  textFont(poppins_lighter);
  textSize(18);
  text(months, line_height+10, line_height*2);
  text(what, line_height+10, height-line_height-120);
  textFont(poppins);
  textSize(140);
  text(date, line_height, height-line_height);
}

void keyPressed() {
  if (keyCode == ' ') {
    save("screenshot.png");
  }
}
