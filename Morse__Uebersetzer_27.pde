import java.io.*;
import java.lang.*;
String input = "", morseCode = "";
PFont font;
int switchCase, entroCount, len = 2, lenIter = 2, usedChars = 0;
float entropy, entropyAlt, medianLen;
int entropyInt, charCount, size, wordLenIndex = 2;
float pI;
char [] entroArr = new char [100];
int [] countArray = new int [37];
int [] wordLen = new int [37];
float [] countArrayPI = new float [37];
boolean charExists = false;
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
    
    wordLen[0] = 1;
    wordLen[1] = 1;
    println(wordLen.length);
    while(wordLenIndex < wordLen.length - 1){
      for(int i = 0; i < lenIter && wordLenIndex < wordLen.length - 1; i++){
          wordLen[wordLenIndex] = len;
          wordLenIndex++;
          //println(wordLenIndex +  " = " + len + " / " + wordLen[(int)(wordLenIndex)] + " -- " + i);
      }
    len++;
    lenIter += lenIter;
    }
    
  size(720,480);
  surface.setResizable(true);
  font = createFont("arial", 10);
  textFont(font, 30);
}

void draw(){  
  background(255); 
  for (int i = 0;i < input.length(); i++){
    if((input.charAt(i) >= 'A' && input.charAt(i) <= 'Z') || (input.charAt(i) >= '0' && input.charAt(i) <= '9') || (input.charAt(i) >= 'a' && input.charAt(i) <= 'z')){
      if((input.charAt(i) <= 'Z')&&(input.charAt(i) >= 'A')){
        switchCase = 32;
      }
      else{
        switchCase = 0;  
      }
      morseCode += morseTransl.get((char)((input.charAt(i)) + switchCase));
      size++;      
      
          if(input.charAt(i) >= '0' && input.charAt(i) <= '9'){
        countArray [((int)(input.charAt(i)) - 22)] += 1;
      }
      else{
          countArray [((int)(input.charAt(i)) - 97 + switchCase)] += 1;
      }
               
    }
    if(input.charAt(i) == (int)32){
        countArray [36] += 1;
        size++;
        println("ja: " + countArray[36]);
    }
   }
   
   for(int i = 0; i < countArrayPI.length; i++){
     //print(i + " <--");
     countArrayPI[i] = (float)countArray[i] / size;
     if(countArrayPI[i] != 0){
       entropyAlt -= countArrayPI[i] * (Math.log(countArrayPI[i]) / Math.log(2));
     }
   }
   
   for(int i = 0; i < countArrayPI.length; i++){
     if(countArrayPI[i] != 0){
       println("pi(" + countArray[i] + ") * Ni(" + wordLen[usedChars] + );
       medianLen += countArray[i] * wordLen[usedChars];
       usedChars++;
     }
   }
 
  //draw
  textAlign(CENTER, CENTER);
  stroke(#757575);
  line(width * 0.5, height * 0.0925, width * 0.5, height * 0.5 - 50);
  line(width * 0.5, height * 0.5 + 50, width * 0.5, height - height * 0.0925);         
  fill(#757575);
  text(morseCode, width * 0.526, height * 0.0925, width * 0.3697, height *  0.8148);
  text(input, width * 0.10416, height * 0.0925, width * 0.3697, height * 0.8148);
  if(input.length() < 1){
   fill(#3E68E7);
   text("Bitte Eingabe tätigen!", width * 0.5, height * 0.5); 
  }
  else{
   fill(#3E68E7);
   text("H: " + entropyAlt + " Bits", width * 0.5, height * 0.03);
   text("L: " + medianLen + " Bits", width * 0.5, height * 0.5);
   text("R: " + (medianLen - entropyAlt) + " Bits", width * 0.5, height * 0.95);
  }
  //parameter reset
  morseCode = "";
  entroCount = 0;
  size = 0;
  entropy = 0;
  entropyAlt = 0;
  countArray = new int [37];
  len = 1;
  lenIter = 2;
  usedChars = 0;
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
