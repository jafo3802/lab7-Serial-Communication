const int xPin = A0;
const int yPin = A1;
const int swPin = 2;

const int button1 = 10;
const int button2 = 9;

const int rLED = 4;
const int bLED = 5;
const int gLED = 6;

void setup()
{
  pinMode(xPin, INPUT);
  pinMode(yPin, INPUT);
  pinMode(swPin, INPUT_PULLUP);

  pinMode(button1, INPUT);
  pinMode(button2, INPUT);

  pinMode(rLED, OUTPUT);
  pinMode(bLED, OUTPUT);
  pinMode(gLED, OUTPUT);

  Serial.begin(9600);
}

void loop()
{  

  int x = analogRead(xPin);
  int y = analogRead(yPin);
  int sw = digitalRead(swPin);

  int b1 = digitalRead(button1);
  int b2 = digitalRead(button2);

    digitalWrite(gLED, LOW);
    digitalWrite(rLED, LOW);
    digitalWrite(bLED, LOW);

  if(sw == LOW){
    digitalWrite(gLED, HIGH);
  }
  if(b1 == HIGH){
    digitalWrite(bLED, HIGH);
  }
  if(b2 == HIGH){
    digitalWrite(rLED, HIGH);
  }


  //Serial.print("b1:1;b2:0;xVal:435;yVal:957;swVal:0");
  
  Serial.print("xVal:");
  Serial.print(x);
  Serial.print(";yVal:");
  Serial.print(y);
  Serial.print(";swVal:");
  Serial.print(sw);
  Serial.print(";b1:");
  Serial.print(b1);
  Serial.print(";b2:");
  Serial.println(b2);
}
