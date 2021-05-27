class Game{
  
  int gameLength; //in minutes
  int numAirports;
  int T;
  int region;
  final int NA = 0;
  final int EUROPE = 51;
  
  int numPlanes;
  Flight[] ongoing_flights;
  City[] cities;  // cities
  Plane[] owned_planes; //owned planes
  
  final int MAX_FLIGHT = 300; //max number of flights at one time
  final int MAX_CITIES = 300; //num of cities
  final int MAX_PLANE = 37;
  
  //LOAD FROM TEXT FILE
  String[] city_codes; //index is city_code, value is city name
  float[][] plane_info; //index is plane type,  {name, pass_cap, cargo_cap, range, vel, weight}
  String[] plane_names;
  
  //set up money
  int cash;
  int bux; 
  
  Game(int gameLength, int region, int T, int numAirports, int numPlanes, int cash, int bux, Flight[] ongoing_flights, City[] cities, Plane[] owned_planes){
    //set basic attributes
    this.T=T;
    this.region = region;
    this.gameLength = gameLength;
    this.numAirports = numAirports;// 5;
    this.numPlanes = numPlanes;//12;
    this.cash = cash;//30000;
    this.bux = bux;//20;
    this.ongoing_flights = ongoing_flights;//new Flight[MAX_FLIGHT];
    this.cities = cities;///new City[MAX_CITIES];
    this.owned_planes = owned_planes;//new Plane[MAX_PLANE];
    
    plane_info = new float[MAX_PLANE+2][5]; //arbitrary +2
    plane_names = new String[MAX_PLANE];  //arbitrary +2
    city_codes = new String[MAX_CITIES];
    
    
    //load the city and plane info to mem
    initPlane();
    initCity();
    
    //make starter cities
    initStarter();
    
    //print planes
    
    for(Plane p: owned_planes){
      if(p != null){
        println("PLANE " + p.PLANE_ID + ": " + p.name + " | " + city_codes[p.location]);
      }
      else{
        break;
      }
    }
    
    println("Ready");
    //start the main Game
    //main();
    
  }
  
  
  //the game
  void run(){
    
    if(T < gameLength){
      println("T: " + T);
      
      printInfo();
      if(T%4 == 0){println("--NEW JOBS--"); updateJobs();} //update jobs every 4 mins
      //increment Time
      T++;
      
      checkLanded();  //check for planes that have landed
      updateFlights(); //update flights
      
      //schedule new flights
      
      println();
      println("BANK: " + this.cash);
      println();
    }
    
  }
  
  Game copy(){
    return new Game(this.gameLength, this.region, this.T, this.numAirports, this.numPlanes, this.cash, this.bux, this.ongoing_flights, this.cities, this.owned_planes);
  }
  
  
  //load plane info from .txt file
  //{name, pass_cap, cargo_cap, range, vel, weight}
  void initPlane(){
    BufferedReader reader;
    String line;
    reader = createReader("../../data/planes.txt");
    int p=0;
    while(p < MAX_PLANE){
      try{
        line = reader.readLine();
      }
      catch (IOException e){
        print("planes.txt error: " + e);
        line = null;
      }
      String[] pieces = split(line,TAB);
      //assign name
      plane_names[p] = pieces[0];
      
      //assign attributes
      plane_info[p][0] = float(pieces[1]);  //pass_cap
      plane_info[p][1] = float(pieces[2]);  //cargo_cap
      plane_info[p][2] = float(pieces[3]);  //range
      plane_info[p][3] = float(pieces[4]);  //vel
      plane_info[p][4] = float(pieces[2]);  //weight
      p++;
    }
    
  }
  
  
  //load city codes from .txt file
  //also load city capacities? (job_max)
  //initial city levels? (grey, blue, red)
  void initCity(){
  BufferedReader reader;
    String line;
    reader = createReader("../../data/city.txt");
    int p=0; //iterate through file, look at each city
    while(p < 75){
      try{
        line = reader.readLine();
      }
      catch (IOException e){
        print("city.txt error: " + e);
        line = null;
      }
      
      String[] pieces = split(line,TAB);
      if(p > EUROPE-1 && p < EUROPE + 5){ //just 5 cities in europe for now, reorganize later
        //within starter, set owned
        cities[p] = new City(pieces[0],p,5*(1+int(pieces[3])),0, true); //make city
      }
      else{
         cities[p] = new City(pieces[0],p,5*int(pieces[2]),0, false); //make city
      }
      city_codes[p]= pieces[0]; //give name
      p++;
    }
  }
  
  
  //create starter cities [x]
  //based on region
  //codes are sorted based on region, so is just an int
  //and all values following (up to 6) are default cities
  //region :0 --> North America
  //region :1 --> Europe
  //give planes
  void initStarter(){
     /*switch(region){
       case 0: //NA
         for(int i=NA; i < EUROPE; i++){
           owned_cities[i] = cities[i];
         }
       case 1: //Europe
         for(int i=EUROPE; i < EUROPE+numAirports;i++){
           owned_cities[i-EUROPE] = cities[i];
           println(owned_cities[i-EUROPE].name);
         }
         println();
     }*/
     
     int h=0; //add 3 planes per location starting in region
     for(int i=0; i < numPlanes; i++){
        owned_planes[i] = new Plane(  //make planes
          plane_names[i], 
          int(plane_info[i][0]),
          int(plane_info[i][1]),
          int(plane_info[i][2]),
          int(plane_info[i][3]),
          plane_info[i][4],
          region*51+h); //location
        
        if(cities[region*51+h].owned){
          cities[region*51+h].receivePlane(owned_planes[i]); //give city plane
        }
        else{
          println("City not owned!!!!");
        }
        if(i%3 == 0){h++;}
     }

     //fix
     //Plane p = new Plane("Funda",0,0,0,0,0.1,5);
     //cities[5].receivePlane(p);
  }
  
  //add ongoing flight [x]
  void addFlight(Flight fl){
    int i=0;
    while(ongoing_flights[i]!=null){
      i++;
    }
    ongoing_flights[i] = fl;
  }
  
  //Fly an item out [x]
  void makeCharter(Item[] items, Plane p, int dest){
    //int curr_city = p.location;
    for(int i=0; i < items.length; i++){
      if(items[i].passQ()){
          p.loadPassenger(items[i]);
      }
      else{
          p.loadCargo(items[i]);
      }
    }
    addFlight(new Flight(T, calculateFlLength(/*curr_city,dest*/), p, dest, p.location)); //create flight
    cities[p.location].sendPlane(p); //send the plane from origin
    p.fly(dest); //fly the plane
  }
  
  //Plane Landing procotol, [x]
  void checkLanded(){
    println("--ARRIVALS--");
    println("############");
    for(Flight fl: ongoing_flights){
      if(fl != null && fl.ifLanded(T)){
        println("Plane " + fl.plane.PLANE_ID + " --> " + city_codes[fl.destination] + " | LANDED");
      }
    }
    
    for(int i=0; i < MAX_FLIGHT; i++){
        if(ongoing_flights[i] != null && ongoing_flights[i].ifLanded(T)){
          //if valid flight has landed
          int ind = cities[ongoing_flights[i].destination].receivePlane(ongoing_flights[i].plane); //give city the plane
          cities[ongoing_flights[i].destination].planes[ind].location = ongoing_flights[i].destination; //set location to destination (as in it arrived)
         
          this.cash += cities[ongoing_flights[i].destination].planes[ind].unload(); //ADD MONEY
          ongoing_flights[i] = null;//remove flight
        }
    }
  
  }
  
 
  //update flights [x]
  void updateFlights(){
      for(Flight f: ongoing_flights){
        if(f != null){
          f.updateFlight(T);
        }
      }
  }
  
  //update jobs every 4 mins [x]
  void updateJobs(){
      for(City c: cities){
        if(c != null){
          c.initJobs();
        }
      }
  }
  //Calculate length of a flight
  int calculateFlLength(/*int loc, int dest*/){
    return 12;
  }
  
  City[] getCities(){
    return cities;
  }
  
  Plane[] getOwnedPlanes(){
    return owned_planes;
  }
  
  Flight[] getOngoingFlights(){
    return ongoing_flights;
  }
  
  
  //print flight info [x]
  void printInfo(){
    //print departed flights
    println("--ONGOING FLIGHTS--");
    println("###################");
    for(Flight fl: ongoing_flights){
        if(fl != null){
          println("Plane " + fl.plane.PLANE_ID + "(" + city_codes[fl.origin]+") --> " + city_codes[fl.destination] + " | Remaining: " + fl.t_rem  + " MIN");
          for(Item p: fl.plane.passengers){
            if(p != null){
              println("      P(" + city_codes[p.destination] + ") " + p.cost); //p.cost means reward here
            }
          }
          for(Item p: fl.plane.cargo){
              if(p != null){
                println("      C(" + city_codes[p.destination] + ") " + p.cost);
              }
          }
          
        }
    }
  }
}
