import processing.serial.*;
import voce.*;

Serial port;
PFont font;

int ledg = 6;
int ledb = 7;
int ledr = 5;
int motor = 4;
String s;

void setup() 
{
  size(500, 100);
  voce.SpeechInterface.init(sketchPath+"/code/", true, true, sketchPath+"/data/", "test");
  println("Available serial ports:");
  println(Serial.list());
  port = new Serial(this, Serial.list()[0], 9600);
  font = loadFont("TektonPro-Bold-20.vlw"); 
  textFont(font); 
  String t = "VIKI_Proto - Controlling LEDs and Motor over Serial Ports.";
  text(t, 10, 55);
}

void draw()
{
  while (voce.SpeechInterface.getRecognizerQueueSize () > 0)
  {
    s = voce.SpeechInterface.popRecognizedString();
    if (s.equals("green"))
    {
      port.write (ledg);
      println ("Green Turned on.");
    }
    else if (s.equals("blue"))
    {
      port.write (ledb);
      println ("Blue Turned on.");
    }
    else if (s.equals("red"))
    {
      port.write (ledr);
      println ("Red Turned on.");
    }
    else
    {
      port.write (motor);
      println ("Motor Running.");
    }
  }
}

