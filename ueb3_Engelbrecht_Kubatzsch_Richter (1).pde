import java.io.*;
import java.lang.*;
PFont font;
int morseCodeStringSize,
    countUsedChars = 0,
    roundSetting = 2,
    upperCaseConvert, 
    lastI;
int [] charCountArray = new int [37];
int [] charSize = {5, 9, 11, 7, 1, 9, 9, 7, 3, 13, 9, 9, 7, 5, 11, 11, 13, 7, 5, 3, 7, 9, 9, 11, 13, 11, 19, 17, 15, 13, 11, 9, 11, 13, 15, 17, 7};
float medianLength,
      redundancy,
      entropy;
float [] charCountArrayPI = new float [37];
String input = "", morseCode = "";
HashMap<Character, String> morseTranslate = new HashMap<Character, String>();

void setup(){ 
    morseTranslate.put('a', ".- ");
    morseTranslate.put('b', "-... ");
    morseTranslate.put('c',  "-.-. ");
    morseTranslate.put('d',  "-.. ");
    morseTranslate.put('e',    ". ");
    morseTranslate.put('f', "..-. ");
    morseTranslate.put('g',  "--. ");
    morseTranslate.put('h', ".... ");
    morseTranslate.put('i',   ".. ");
    morseTranslate.put('j', ".--- ");
    morseTranslate.put('k',   "-.- ");
    morseTranslate.put('l', ".-.. ");
    morseTranslate.put('m',   "-- ");
    morseTranslate.put('n',   "-. ");
    morseTranslate.put('o',  "--- ");
    morseTranslate.put('p', ".--. ");
    morseTranslate.put('q', "--.- ");
    morseTranslate.put('r', ".-. ");
    morseTranslate.put('s',  "... ");
    morseTranslate.put('t',   "- ");
    morseTranslate.put('u',  "..- ");
    morseTranslate.put('v', "...- ");
    morseTranslate.put('w',  ".-- ");
    morseTranslate.put('x', "-..- ");
    morseTranslate.put('y', "-.-- ");
    morseTranslate.put('z', "--.. ");
    morseTranslate.put('1', ".---- ");
    morseTranslate.put('2',"..--- ");
    morseTranslate.put('3', "...-- ");
    morseTranslate.put('4', "....- ");
    morseTranslate.put('5', "..... ");
    morseTranslate.put('6', "-.... ");
    morseTranslate.put('7', "--... ");
    morseTranslate.put('8', "---.. ");
    morseTranslate.put('9', "----. ");
    morseTranslate.put('0', "----- ");   
  font = createFont("arial", 10);
  surface.setResizable(true);
  textFont(font, 30);
  size(820,580);
}

void draw(){  
  background(255); 
  //convert input to morse code//
  for (int i = 0; i < input.length(); i++){
    if((input.charAt(i) >= 'A' && input.charAt(i) <= 'Z') || (input.charAt(i) >= '0' && input.charAt(i) <= '9') || (input.charAt(i) >= 'a' && input.charAt(i) <= 'z') || (input.charAt(i) == (int)32)){
      if((input.charAt(i) <= 'Z') && (input.charAt(i) >= 'A')){
        upperCaseConvert = 32;
      }
      else{
        upperCaseConvert = 0;  
      }
      if(input.charAt(i) != (char)32){
        morseCode += morseTranslate.get((char)(input.charAt(i) + upperCaseConvert));
      }
      else{
        morseCode += " ";
      }
      morseCodeStringSize++;        
      if(input.charAt(i) >= '0' && input.charAt(i) <= '9'){
        charCountArray [(int)(input.charAt(i)) - 22] += 1;
      }
      else if(input.charAt(i) == (char)32){
        charCountArray [36] += 1;
      }
      else{
        charCountArray [(int)(input.charAt(i)) - 97 + upperCaseConvert] += 1;
      }            
    }
   }
   //fill array with probability for each char//
   for(int i = 0; i < charCountArrayPI.length; i++){
     charCountArrayPI[i] = (float)charCountArray[i] / morseCodeStringSize;
     if(charCountArrayPI[i] != 0){
       //calculate entropy//
       entropy -= charCountArrayPI[i] * (Math.log(charCountArrayPI[i]) / Math.log(2));
     }
   } 
   //calculate median char size//
   for(int i = 0; i < charCountArrayPI.length; i++){
     if(charCountArrayPI[i] != 0){
       medianLength += (float)charCountArrayPI[i] * charSize[i];
     }
   }
   //calculate redundancy//
   redundancy  = medianLength - entropy;
 
  //on screen draw//
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
   text("H: " + Math.round(Math.pow(10.0, roundSetting) * entropy) / Math.pow(10.0, roundSetting) + " Bits", width * 0.5, height * 0.03);
   text("L: " + Math.round(Math.pow(10.0, roundSetting) * medianLength) / Math.pow(10.0, roundSetting) + " Bits", width * 0.5, height * 0.5);
   text("R: " + Math.round(Math.pow(10.0, roundSetting) * redundancy) / Math.pow(10.0, roundSetting) + " Bits", width * 0.5, height * 0.95);
  }
  //parameter reset //
  charCountArray = new int [37];
  morseCodeStringSize = 0;
  countUsedChars = 0;
  medianLength = 0;
  morseCode = "";
  entropy = 0;
}

void keyPressed(){
  if (keyCode == BACKSPACE){
    if (input.length() > 0){
      input = input.substring(0, input.length() - 1);
    }
  } 
  else if (keyCode == DELETE){
    input = "";
  } 
  else if (key >= (char)32 && key <= (char)255){
      input += key;
  }
}
