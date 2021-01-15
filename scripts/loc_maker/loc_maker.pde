int im_x = 4500;
int im_y = 2234;
float im_scal = 0.3;
int mX=-1;
int mY=-1;
PImage img;

boolean makeTextbox = false;
String curr_name = "";
ArrayList<City> arr = new ArrayList<City>();

void settings(){
  im_x *= im_scal;
  im_y *= im_scal;
  size(im_x, im_y);
}
void setup(){
  img = loadImage("../../data/map.png");
}

void draw(){
  imageMode(CORNER);
  image(img, 0,0, width, height);
  
  text( mouseX+ "," + mouseY, mouseX, mouseY);
  
  //done box
  
  fill(255);
  rect(0,0,10,10);
  
  if(makeTextbox){
    //text field
    fill(255);
    rect(im_x*0.3, im_y*0.3, 400,200);
    fill(0);
    text(curr_name, im_x*0.3 + 150, im_y*0.3 + 100);
    
    
    //enter box
    fill(255,0,0);
    rect(im_x*0.3, im_y*0.3+300, 400,100);
    fill(0);
    text("Enter",im_x*0.3 + 190, im_y*0.3+350 );
  }
}


void mousePressed(){
  if(makeTextbox){
      if (mouseX > im_x*0.3 && mouseX < im_x*0.3 + 400 && mouseY > im_y*0.3+300 && mouseY < im_y*0.3+400){
         arr.add(new City(mX, mY, curr_name));
         curr_name = "";
         makeTextbox = false;
         return;
      }
  }
  else{
    if (mouseX > 0 && mouseX < 10 && mouseY > 0 && mouseY < 10){
       writetoFile();
    }
    else{
      //get mouse info
      mX = mouseX;
      mY = mouseY;
      
      //prompt text box
      makeTextbox = true;
    }
  }
  
  
}

void keyPressed(){
  if(makeTextbox){
    if(keyCode != 8 && keyCode != 16){
      curr_name += key;
    }
    else if(key == BACKSPACE){
      curr_name = curr_name.substring(0,curr_name.length()-1);
    }
  }
}

void writetoFile(){
  String file = "../../data/custom_loc.txt";
  PrintWriter output;
  output = createWriter(file);
  
  for(City c: arr){
    output.println(c.getString());
  }
  
  output.close();
  exit();
}

class City{
  int mX;
  int mY;
  String name;
  
  City(int mX, int mY, String name){
    this.mX = mX;
    this.mY = mY;
    this.name = name;
  }
  
  String getString(){
    return name + "\t" + mX + "\t" + mY;
  }
}
