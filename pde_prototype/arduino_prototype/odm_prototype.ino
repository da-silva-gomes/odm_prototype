int buttonPin = 2;
int buttonPin2 = 4;

int buttonState;
int buttonState2;

int buttonValue;
int buttonValue2;

void setup() {
  Serial.begin (9600);

  pinMode(buttonPin, INPUT);
  pinMode(buttonPin2, INPUT);
  
}

void loop() {

  buttonState = digitalRead(buttonPin);

  buttonState2 = digitalRead(buttonPin2);

  if (buttonState == HIGH) {
    buttonValue = 1;
  } else {
    buttonValue = 0;
  }

  if (buttonState2 == HIGH) {
    buttonValue2 = 1;
  } else {
    buttonValue2 = 0;
  }

  Serial.print("B:");
  delay(1);
  Serial.print(buttonValue);
  delay(1);
  Serial.print(":");
  delay(1);
  Serial.println(buttonValue2);
  delay(200);

}
