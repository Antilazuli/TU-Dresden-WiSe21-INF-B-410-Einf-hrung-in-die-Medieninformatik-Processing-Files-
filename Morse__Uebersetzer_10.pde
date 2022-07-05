String input = "", morseCode = "";
PFont font;
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
  size(1920,1080);
  font = createFont("roboto",10);
  textFont(font,30);
}

void draw(){  
  background(255);
  stroke(#757575);
  line(960, 100, 960, 490);
  line(960, 590, 960, 980);
  fill(#757575);
  text(input, 200, 100, 710, 880);
  if(input.length() < 1){
   textAlign(CENTER,CENTER);
   fill(#3E68E7);
   text("Bitte Eingabe tätigen!", 0, 0, width, height); 
  }  
  for (int i = 0;i < input.length(); i++){
    if((input.charAt(i) >= 'A' && input.charAt(i) <= 'Z') || (input.charAt(i) >= '0' && input.charAt(i) <= '9') || (input.charAt(i) >= 'a' && input.charAt(i) <= 'z')){
      if((input.charAt(i) <= 'Z')&&(input.charAt(i) >= 'A')){
        morseCode += morseTransl.get((char)((input.charAt(i)) + 32));
      }
      else{
        morseCode += morseTransl.get(input.charAt(i));  
      }
    }
  }
  fill(#757575);
  text(morseCode, 1010, 100, 710, 880);
  morseCode = "";  
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
