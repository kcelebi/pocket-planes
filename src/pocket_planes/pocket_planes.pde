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
  g = new Game(7, 1, 0, 5, 12, 30000, 20, new Flight[MAX_FLIGHT], new City[MAX_CITIES], new Plane[MAX_PLANE]);
  frameRate(1);

  //load locations info
  loadNA();
  loadEU();

  Item[] goods = {new Item(250, 5, 74, true), new Item(400, 5, 74, false), new Item(100, 5, 78, true)};
  
  int cit_ind = 0;
  for(int i=0; i < g.cities.length; i++){
    if(g.cities[i].owned){
      cit_ind = i;
      break;
    }
  }

  g.makeCharter(goods, g.cities[cit_ind].planes[0],74);
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
      stroke(0,255,0);
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
