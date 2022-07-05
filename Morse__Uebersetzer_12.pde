import java.util.Set;
import java.util.HashSet;
String input = "", morseCode = "";
PFont font;
int switchCase, entroCount;
char [] entroArr = new char [100];
boolean charExists = false;
HashMap<Character, String> morseTransl = new HashMap<Character, String>();
Set<Character> checkEntro = new HashSet();

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
  size(1920,1080);
  //surface.setResizable(true);
  font = createFont("roboto", 10);
  textFont(font, 30);
}

void draw(){  
  background(255);
  stroke(#757575);
  //line(width * 0.5, height * 0.0925, width * 0.5, height * 0.5 - 50);
  //line(width * 0.5, height * 0.5 + 50, width * 0.5, height - height * 0.0925);
  
  fill(#757575);
  text(input, width * 0.10416, height * 0.0925, width * 0.3697, height * 0.8148);
  if(input.length() < 1){
   textAlign(CENTER,CENTER);
   fill(#3E68E7);
   text("Bitte Eingabe tätigen!", 0, 0, width, height); 
  }  
  for (int i = 0;i < input.length(); i++){
    if((input.charAt(i) >= 'A' && input.charAt(i) <= 'Z') || (input.charAt(i) >= '0' && input.charAt(i) <= '9') || (input.charAt(i) >= 'a' && input.charAt(i) <= 'z')){
      if((input.charAt(i) <= 'Z')&&(input.charAt(i) >= 'A')){
        switchCase = 32;
        morseCode += morseTransl.get((char)((input.charAt(i)) + 32));
      }
      else{
        switchCase = 0;
        morseCode += morseTransl.get(input.charAt(i));  
      }
      //morseCode += morseTransl.get((char)((input.charAt(i)) + switchCase));
      //checkEntro.add((char)((input.charAt(i)) + switchCase));
      //for(int j = 97; j < 122; i++){
        //if(checkEntro.contains((char)(j))){
          //entroCount++;
          //println(entroCount);
        //}
      
      //}
   }
  fill(#757575);
  text(morseCode, 1010, 100);
  morseCode = "";
  //entroCount = 0;
  //checkEntro.clear();
  
  //print((int)('ß')+ " ");
  }
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
  else if ((key >= '!' && key <= '§')||(key == ' ')){
      input += key;
  }
}
