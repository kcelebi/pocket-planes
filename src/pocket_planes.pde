Game g;
final int PASSENGER = 0;
final int CARGO = 1;

PImage img;

void setup(){
  size(1000,800);
  img = loadImage("data/world.png");
  randomSeed(0);
  //g = new Game(7,1);
   
  //setup tests
  /*for(City c: g.owned_cities){
    if(c!= null){
        Object[] goods = new Object[c.planes[0].passenger_cap + c.planes[0].cargo_cap];
        int[] types = new int[c.planes[0].passenger_cap + c.planes[0].cargo_cap];
        int[] dests = {0,0,0,0,0};
        for(int i=0; i < c.planes[0].passenger_cap + c.planes[0].cargo_cap; i++){
          int r = int(random(2));
          switch(r){
            case PASSENGER:
              int d  =int(random(51,55));
              goods[i] = new Passenger(int(random(300)), d, c.code);
              dests[d -51] +=1;
              types[i] = PASSENGER;
              break;
            case CARGO:
              d  =int(random(51,55));
              goods[i] = new Cargo(int(random(300)), d, c.code);
              dests[ d -51] +=1;
              types[i] = CARGO;
              break;
          }
        }
        int maxind=0;
        int max =0;
        for(int j=0; j < dests.length; j++){
          if( dests[j]>= max){
            max = dests[j];
            maxind = j;
          }
        }
        
        g.makeCharter(goods, c.planes[0],types,maxind+51);
    }
  }*/
  
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
  float w_start = 180;
  float w_end = -180;
  float h_start = 90;
  float h_end = -90;
  
  float mapX1 = 0;
  float mapX2 = width;
  float mapY1 = 0;
  float mapY2 = height;
  String[] lines = loadStrings("data/loc.txt");
  for(int i=0; i < 3; i++){
    String[] pieces = lines[i].split(" ");
    //println(pieces[0]); // city name
    //might be issue w names that have spaces
    fill(255,0,0);
    //float lat = width/360* (180 + float(pieces[1]));
    //float lon = height/180 * (90-float(pieces[2]));
    float x = 500- (map(float(pieces[2]),w_start,w_end,mapX1,mapX2) - 500);
    float y = map(float(pieces[1]),h_start,h_end,mapY1,mapY2);

    println("(" + x + "," + y + ")");
    ellipse(x, y,10,10);
  }
  println("0000000000000000");
  /*int xgran = 20;
  int ygran = 20;
  for(int i=0; i < xgran; i++){
    for(int j=0; j < ygran; j++){
      fill(0);
      textSize(8);
      text("(" + i*width/xgran + "," + j*height/ygran + ")", i*width/xgran,j*height/ygran);
      fill(255,0,0);
      ellipse(i*width/xgran,j*height/ygran,5,5);
    }
  }*/
  
  /*g.run();
  if(g.T == g.gameLength){
    exit();
  }*/
}
