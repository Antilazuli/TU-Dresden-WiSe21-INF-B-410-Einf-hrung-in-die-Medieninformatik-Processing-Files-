import java.io.*;
import java.lang.*;
String input = "", morseCode = "";
PFont font;
int countUsedChars = 0,
    upperCaseConvert, 
    roundSetting = 2,
    lastI,
    morseCodeStringSize,
    charCount;
int [] countArray = new int [37];
int [] wordLen = new int [37];
float entropy,
      entropyAlt,
      medianLen,
      redundancy,
      pI;
float [] countArrayPI = new float [37];
char [] entroArr = new char [100];
HashMap<Character, String> morseTransl = new HashMap<Character, String>();

void setup(){ 
    morseTransl.put('a', ".- ");
    morseTransl.put('b', "-... ");
    morseTransl.put('c',  "-.-. ");
    morseTransl.put('d',  "-.. ");
    morseTransl.put('e',    ". ");
    morseTransl.put('f', "..-. ");
    morseTransl.put('g',  "--. ");
    morseTransl.put('h', ".... ");
    morseTransl.put('i',   ".. ");
    morseTransl.put('j', ".--- ");
    morseTransl.put('k',   "-.- ");
    morseTransl.put('l', ".-.. ");
    morseTransl.put('m',   "-- ");
    morseTransl.put('n',   "-. ");
    morseTransl.put('o',  "--- ");
    morseTransl.put('p', ".--. ");
    morseTransl.put('q', "--.- ");
    morseTransl.put('r', ".-. ");
    morseTransl.put('s',  "... ");
    morseTransl.put('t',   "- ");
    morseTransl.put('u',  "..- ");
    morseTransl.put('v', "...- ");
    morseTransl.put('w',  ".-- ");
    morseTransl.put('x', "-..- ");
    morseTransl.put('y', "-.-- ");
    morseTransl.put('z', "--.. ");
    morseTransl.put('1', ".---- ");
    morseTransl.put('2',"..--- ");
    morseTransl.put('3', "...-- ");
    morseTransl.put('4', "....- ");
    morseTransl.put('5', "..... ");
    morseTransl.put('6', "-.... ");
    morseTransl.put('7', "--... ");
    morseTransl.put('8', "---.. ");
    morseTransl.put('9', "----. ");
    morseTransl.put('0', "----- ");   
  size(820,580);
  surface.setResizable(true);
  font = createFont("arial", 10);
  textFont(font, 30);
}

void draw(){  
  background(255); 
  for (int i = 0;i < input.length(); i++){
    if((input.charAt(i) >= 'A' && input.charAt(i) <= 'Z') || (input.charAt(i) >= '0' && input.charAt(i) <= '9') || (input.charAt(i) >= 'a' && input.charAt(i) <= 'z')){
      if((input.charAt(i) <= 'Z')&&(input.charAt(i) >= 'A')){
        upperCaseConvert = 32;
      }
      else{
        upperCaseConvert = 0;  
      }
      morseCode += morseTransl.get((char)((input.charAt(i)) + upperCaseConvert));
      morseCodeStringSize++;        
          if(input.charAt(i) >= '0' && input.charAt(i) <= '9'){
            countArray [((int)(input.charAt(i)) - 22)] += 1;
          }
          else{
            countArray [((int)(input.charAt(i)) - 97 + upperCaseConvert)] += 1;
          }            
    }
    if(input.charAt(i) == (int)32){
      countArray [36] += 1;
      morseCodeStringSize++;
    }
   }   
   for(int i = 0; i < countArrayPI.length; i++){
     countArrayPI[i] = (float)countArray[i] / morseCodeStringSize;
     if(countArrayPI[i] != 0){
       entropyAlt -= countArrayPI[i] * (Math.log(countArrayPI[i]) / Math.log(2));
     }
   } 
   for(int i = 0; i < countArrayPI.length; i++){
     if(countArrayPI[i] != 0){
       countUsedChars++;
       medianLen += (float)countArrayPI[i] * countUsedChars;
       lastI = i;       
     }
   }
   medianLen = medianLen - countArrayPI[lastI] * countUsedChars + countArrayPI[lastI] * (countUsedChars - 1);
   redundancy  = medianLen - entropyAlt;
 
  //on screen //
  textAlign(CENTER, CENTER);
  stroke(#757575);
  line(width * 0.5, height * 0.0925, width * 0.5, height * 0.5 - 50);
  line(width * 0.5, height * 0.5 + 50, width * 0.5, height - height * 0.0925);         
  fill(#757575);
  text(input, width * 0.05416, height * 0.0925, width * 0.3197, height * 0.8148);
  text(morseCode, width * 0.626, height * 0.0925, width * 0.3197, height *  0.8148);
  if(input.length() < 1){
   fill(#3E68E7);
   text("Bitte Eingabe t??tigen!", width * 0.5, height * 0.5); 
  }
  else{
   fill(#3E68E7);
   text("H: " + Math.round(Math.pow(10.0, roundSetting) * entropyAlt) / Math.pow(10.0, roundSetting) + " Bits", width * 0.5, height * 0.03);
   text("L: " + Math.round(Math.pow(10.0, roundSetting) * medianLen) / Math.pow(10.0, roundSetting) + " Bits", width * 0.5, height * 0.5);
   text("R: " + Math.round(Math.pow(10.0, roundSetting) * redundancy) / Math.pow(10.0, roundSetting) + " Bits", width * 0.5, height * 0.95);
  }
  //parameter reset //
  morseCode = "";
  morseCodeStringSize = 0;
  entropy = 0;
  entropyAlt = 0;
  countArray = new int [37];
  countUsedChars = 0;
  medianLen = 0;
}

void keyPressed(){
  if (keyCode == BACKSPACE){
    if (input.length() > 0){
      input = input.substring(0, input.length()-1);
    }
  } 
  else if (keyCode == DELETE){
    input = "";
  } 
  else if (key >= (char)32 && key <= (char)255){
      input += key;
  }
}
