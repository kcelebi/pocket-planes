Game g;
final int PASSENGER = 0;
final int CARGO = 1;

PImage img;
int im_x = 4500;
int im_y = 2234;
float im_scal = 0.3;



void settings(){
  im_x *= im_scal;
  im_y *= im_scal;
  size(im_x, im_y);
}

void setup(){
  img = loadImage("../../data/map.png");
  g = new Game(7,1);
   
  //setup tests
  
  //Object[] goods = {new Passenger(50,55,52), new Cargo(60,55,52), new Cargo(20,55,52), new Passenger(30,55,52), new Passenger(1000,51,52)};
  //int[] types = {0,1,1,0,0};
  
  //g.makeCharter(goods, g.cities[52].planes[0],types, 55);
  //Passenger p1 = new Passenger(30,52,51); //passenger in Berlin flying to Muncih for $30
  //Passenger p2 = new Passenger(10,53,54); //passenger in Brussels flying to Prague for $10
  //g.makeCharter(p1, g.cities[p1.location].planes[0],PASSENGER,p1.destination);
  //g.makeCharter(p2, g.cities[p2.location].planes[0],PASSENGER,p2.destination);
}

void draw(){
  //background(0);
  imageMode(CORNER);
  image(img,0,0,width,height);

  drawNA();
  drawEU();
  drawFlights();
  
  /*g.run();
  if(g.T == g.gameLength){
    exit();
  }*/
}

void drawNA(){
  String[] NA_loc = loadStrings("../../data/loc/NA_loc.txt");
  for(String s: NA_loc){
    String[] spl = s.split("\t");
    fill(255,0,0);
    ellipse(int(spl[1]), int(spl[2]),5,5);
  }
}

void drawEU(){
  String[] EU_loc = loadStrings("../../data/loc/EU_loc.txt");
  for(String s: EU_loc){
    String[] spl = s.split("\t");
    fill(255,0,0);
    ellipse(int(spl[1]), int(spl[2]),5,5);
  }
}

void drawFlights(){
  Flight[] fl = g.ongoing_flights;
  
  for(Flight f: fl){
    
  }
}
