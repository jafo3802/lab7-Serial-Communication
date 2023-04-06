const int xPin = A0;
const int yPin = A1;
const int swPin = 2;

void setup()
{
  pinMode(xPin, INPUT);
  pinMode(yPin, INPUT);
  pinMode(swPin, INPUT_PULLUP);
  Serial.begin(9600);
}

void loop()
{  

  int x = analogRead(xPin);
  int y = analogRead(yPin);
  int sw = digitalRead(swPin);

  //Serial.print("xVal:435;yVal:957;swVal:0");
  Serial.print("xVal:");
  Serial.print(x);
  Serial.print(";yVal:");
  Serial.print(y);
  Serial.print(";swVal:");
  Serial.println(sw);
}
