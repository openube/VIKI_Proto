int led1 = 13;
int led2 = 12;
int led3 = 11;
int motor = A1;
int in;

void setup()
{
  Serial.begin (9600);
  pinMode (led1, OUTPUT);
  pinMode (led2, OUTPUT);
  pinMode (led3, OUTPUT);
  pinMode (motor, OUTPUT);
}

void loop()
{
  if (Serial.available())
  {
    in = Serial.read();
    Serial.print (in);
    if (in == 6)
    {
      digitalWrite (led1, HIGH);
      digitalWrite (led2, LOW);
      digitalWrite (led3, LOW);
      analogWrite (motor, 0);
    }
    else if (in == 7)
    {
      digitalWrite (led2, HIGH);
      digitalWrite (led1, LOW);
      digitalWrite (led3, LOW);
      analogWrite (motor, 0);
    }
    else if (in == 5) 
    {
      digitalWrite (led3, HIGH);
      digitalWrite (led2, LOW);
      digitalWrite (led1, LOW);
      analogWrite (motor, 0);
    }
    else
    {
      analogWrite (motor, 255);
      digitalWrite (led3, LOW);
      digitalWrite (led2, LOW);
      digitalWrite (led1, LOW);
    }
  }
}


