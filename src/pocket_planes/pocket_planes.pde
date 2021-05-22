import java.util.Map;

Game g;
final int PASSENGER = 0;
final int CARGO = 1;

final int MAX_FLIGHT = 300; //max number of flights at one time
final int MAX_CITIES = 300; //num of cities
final int MAX_PLANE = 37;


PImage img;
int im_x = 4500;
int im_y = 2234;
float im_scal = 0.3;

d_City[] NA_loc = new d_City[300];
d_City[] EU_loc = new d_City[300];

HashMap<String,PVector> map = new HashMap<String,PVector>();

void settings(){
  im_x *= im_scal;
  im_y *= im_scal;
  size(im_x, im_y);
}

void setup(){
  img = loadImage("../../data/map.png");
  g = new Game(15, 1, 0, 5, 12, 30000, 20, new Flight[MAX_FLIGHT], new City[MAX_CITIES], new Plane[MAX_PLANE]);
  frameRate(1);

  //load locations info
  loadNA();
  loadEU();

  
  
  int cit_ind = 51;
  
  Item[] goods = {new Item(250, 5, cit_ind, true)};
  g.makeCharter(goods, g.cities[cit_ind].planes[0],5);
  
  Item[] goods2 = {new Item(100, 10, cit_ind+1, false)};
  g.makeCharter(goods2, g.cities[cit_ind+1].planes[0],10);
}

void draw(){
  //background(0);
  imageMode(CORNER);
  image(img,0,0,width,height);

  //draw cities
  drawNA();
  drawEU();

  g.run();
  if(g.T == g.gameLength){
    println("Game done!");
    exit();
  }

  //draw flights
  drawFlights();
}

void loadNA(){
  String[] NA = loadStrings("../../data/loc/NA_loc.txt");
  for(int i=0; i < NA.length; i++){
    String[] spl = NA[i].split("\t");
    NA_loc[i] = new d_City(int(spl[1]), int(spl[2]), spl[0]);
  }
}

void loadEU(){
  String[] EU = loadStrings("../../data/loc/EU_loc.txt");
  for(int i=0; i < EU.length; i++){
    String[] spl = EU[i].split("\t");
    EU_loc[i] = new d_City(int(spl[1]), int(spl[2]), spl[0]);
  }
}

void drawNA(){
  for(d_City s: NA_loc){
    if(s != null){
      fill(255,0,0);
      stroke(0);
      strokeWeight(1);
      ellipse(s.loc.x, s.loc.y,5,5);
    }
  }
}

void drawEU(){
  for(d_City s: EU_loc){
    if(s != null){
      fill(255,0,0);
      stroke(0);
      strokeWeight(1);
      ellipse(s.loc.x, s.loc.y,5,5);
    }
  }
}

void drawFlights(){
  Flight[] fl = g.ongoing_flights;
  
  for(Flight f: fl){
    if(f != null){
      PVector origin = map.get(g.city_codes[f.origin]);
      PVector dest = map.get(g.city_codes[f.destination]);
      strokeWeight(4);
      stroke(196,68,173);
      println(origin.x);
      line(origin.x, origin.y, dest.x,dest.y);
    }
  }
}

class d_City{
  PVector loc;
  String name;

  d_City(int x,int y, String name){
    loc = new PVector(x,y);
    this.name = name;
    map.put(name, loc);
  }
}
