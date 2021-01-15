//
//
//[] Calculate pay
//[] Calculate job_max increment
class City{
  final int MAXPLANE = 300;
  final int MAX_CITIES = 300;
  int city_cost; //how much to buy
  int code; //city code
  String name;
  int job_max;  //max # of jobs, can increase
  int[] flight_costs;
  Plane planes[];
  Passenger pass[];
  Cargo cargo[];
  
  City(String n,int c, int max, int cost){
    //set attributes
    name = n;
    city_cost = cost;
    code = c;
    job_max = max;
    flight_costs  = new int[MAX_CITIES]; //constants for the number of cities in europe, will change
    planes = new Plane[MAXPLANE]; //arbitrarily large array
    pass = new Passenger[job_max];
    cargo = new Cargo[job_max];
  }
  
  //randomize jobs every 4 mins
  void initJobs(){
    int pass_cap = int(random(job_max));
    int cargo_cap = job_max-pass_cap;
    
    //generate passengers
    for(int i=0; i < pass_cap; i++){
      pass[i] = newPassenger();
    }
    
    //generate cargo
    for(int i=0; i < cargo_cap; i++){
      cargo[i] = newCargo();
    }
  }
  
  
  //generate passenger
  Passenger newPassenger(){
    int dest = int(random(10)); //10 is range of location codes
    while(dest == code){
      dest = int(random(10));
    }
    
    return new Passenger(cost(dest),dest,code);  //calcualte pay!!!!
  }
  
  //generate cargo
  Cargo newCargo(){
    int dest = int(random(10)); //10 is range of location codes
    while(dest == code){
      dest = int(random(10));
    }
    
    return new Cargo(cost(dest),dest,code);  //calcualte pay!!!!
  }
  
  //record the entry of a plane
  void receivePlane(Plane p){ //allov plane to fly in
    int j=0;
    while(planes[j] != null && j < MAXPLANE){
      j++;
    }
    planes[j] = p;
  }
  
  //record the exit of a plane
  void sendPlane(Plane p){
    for(int i=0; i < MAXPLANE; i++){
       if(p.PLANE_ID == planes[i].PLANE_ID){ //set slot to null
         planes[i] = null;
         return;
       }
    }
  }
  
  //load the prices related to the city from the file
  void loadPrices(){
    String[] city_names = new String[MAX_CITIES];
    String line;
    BufferedReader reader;
    reader = createReader("data/city.txt");
    int p=0;
    while(p < 74){
      try{
        line = reader.readLine();
      }
      catch (IOException e){
        print("city.txt error: " + e);
        line = null;
      }
      
      String[] pieces = split(line,TAB);
      city_names[p]= pieces[0]; //give name
      p++;
    }
    BufferedReader reader2;
    String line2;
    reader2 = createReader("data/prices.txt");
    int p2 = 0;
    while(p2 < 12){ //currently arbitary 12
      try{
          line2 = reader2.readLine();
        }
        catch (IOException e){
          print("planes.txt error: " + e);
          line2 = null;
        }
        String[] pieces = split(line2,"\t\t");
        if(pieces[0] == name && pieces[1] != name){
           String str = "";
           int t=0;
           while(!str.equals(pieces[1])){
             str = city_names[t];
             t++;
           }
           if(!pieces[2].equals("--\n") || !pieces[2].equals("--")){
             flight_costs[t] = int(pieces[2]); //remember that the prices aren't finished 
           }
        }
        else if(pieces[0] != name && pieces[1] == name){
          String str = "";
           int t=0;
           while(!str.equals(pieces[0])){
             str = city_names[t];
             t++;
           }
           if(!pieces[2].equals("--\n") || !pieces[2].equals("--")){
             flight_costs[t] = int(pieces[2]); //remember that the prices aren't finished 
           }
        }
        
        p++;
      }
    }
  
  //return the cost of the flight from the array
  //done
  int cost(int dest){
    //int speed = p.velocity;
    //int weight = p.weight;
    //need distance!!
    //int expense = speed*weight/400;
    
    //reveneue = distance + 50
    //profit = rev-dist;
    //return profit
    
    
    return flight_costs[dest];
  }
  
  
  //increment max jobs
  //change the value
  void levelUp(){
     job_max += 5;
  }
}
