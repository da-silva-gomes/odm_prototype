import processing.serial.*;

color white = color(250, 250, 250);
color black = color(0, 0, 0);

String date = "8 9 10 11 12 13";
String months = "11nd June";
String what = "Jan Van Toorn, Out the poster. Interactive exhibition at Colégio das Artes";

int line_height = 16;
int index;

int buttonValue;
int buttonValue2;

float img_size, img_y, img_x;

PFont poppins, poppins_lighter;

PImage[] colagens = new PImage[7];

boolean usedA, usedB, usedP, usedR;

Serial myPort;
int serialReading;

void setup() {
  size(1300, 900);
  background(white);

  poppins = createFont("Poppins-Black", 120);
  poppins_lighter = createFont("Poppins-Regular", 120);
  
  String portName = Serial.list()[6];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  myPort.clear();

  for (int i = 0; i < colagens.length-4; i++) {
    println(colagens.length-2);
    colagens[i] = loadImage("recorte"+i+".png");

    img_size  = random(200, 600);
    img_y = random(img_size/2, height-img_size/2);
    img_x = random(img_size/2, width-img_size/2);

    imageMode(CENTER);
    image(colagens[i], img_x, img_y, img_size, img_size);
    filter(GRAY);
  }
}

void serialEvent(Serial myPort) {
  String input = "";

  if (myPort.available()>0) {
    input = myPort.readString();
  }    

  String[] numbers = split(trim(input), ":");
  buttonValue = int(numbers[1]);
  buttonValue2 = int(numbers[2]);
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
  
  //println(buttonValue, buttonValue2);

  if (buttonValue == 1) {
    if (!usedA) {
      colagens[5] = loadImage("recorte"+5+".png");

      img_size  = random(200, 600);
      img_y = random(img_size/2, height-img_size/2);
      img_x = random(img_size/2, width-img_size/2);

      imageMode(CENTER);
      image(colagens[5], img_x, img_y, img_size, img_size);
      filter(GRAY);
      usedA = true;
      save("screenshot.png");
    } else {
      println("snip already found");
    }
  }

  if (buttonValue2 == 1) {
    if (!usedB) {
      colagens[6] = loadImage("recorte"+6+".png");

      img_size  = random(200, 600);
      img_y = random(img_size/2, height-img_size/2);
      img_x = random(img_size/2, width-img_size/2);

      imageMode(CENTER);
      image(colagens[6], img_x, img_y, img_size, img_size);
      filter(GRAY);
      usedB = true;
      save("screenshot.png");
    } else {
      println("snip already found");
    }
  }
}

void keyPressed() {
  if (keyCode == ' ') {
    save("screenshot.png");
  }

  if (keyCode == 'P' || keyCode == 'p') {
    if (!usedP) {
      colagens[4] = loadImage("recorte"+4+".png");

      img_size  = random(200, 600);
      img_y = random(img_size/2, height-img_size/2);
      img_x = random(img_size/2, width-img_size/2);

      imageMode(CENTER);
      image(colagens[4], img_x, img_y, img_size, img_size);
      filter(GRAY);
      usedP = true;
      save("screenshot.png");
    } else {
      println("snip already found");
    }
  }

  if (keyCode == 'R' || keyCode == 'r') {
    if (!usedR) {
      colagens[3] = loadImage("recorte"+3+".png");

      img_size  = random(200, 600);
      img_y = random(img_size/2, height-img_size/2);
      img_x = random(img_size/2, width-img_size/2);

      imageMode(CENTER);
      image(colagens[3], img_x, img_y, img_size, img_size);
      filter(GRAY);
      usedR = true;
      save("screenshot.png");
    } else {
      println("snip already found");
    }
  }
}
