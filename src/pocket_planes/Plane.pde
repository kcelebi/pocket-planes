class Plane{
  String name;
  int range; //in miles
  int velocity; //in mph
  int passenger_cap;
  int cargo_cap;
  float weight; //in tonnes
  int flights;
  int miles;
  int location;
  int PLANE_ID;
  
  int added_pass;
  int added_cargo;
  
  Item passengers[];
  Item cargo[];
  
  Plane(String in_name, int in_pass_cap, int in_cargo_cap, int in_range, int in_vel, float in_weight, int start_loc){
    //set given attributes
    PLANE_ID = int(random(10000));
    location = start_loc;
    name = in_name;
    range = in_range;
    velocity = in_vel;
    passenger_cap = in_pass_cap;
    cargo_cap = in_cargo_cap;
    weight = in_weight;
    
    //set cargo/passenger attributes
    passengers = new Item[passenger_cap];
    cargo = new Item[cargo_cap];
    
    added_pass = 0; //pointer to track how many things have been added;
    added_cargo = 0; //in order to determine fullness of arrays
    
    //set record attributes
    flights = 0;
    miles = 0;
  }
  
  
  //loads passenger onto plane
  void loadPassenger(Item pass){
    if(!arrayFull(true)){ //if not full
        for(int i=0; i < passenger_cap;i++){
            if(passengers[i] == null){ //find empty space and fill it in
                passengers[i] = pass;
                added_pass++;
                return;
            }
        }
    }
  }
  
  //loads cargo onto plane
  void loadCargo(Item car){
    if(!arrayFull(false)){ //if not full
          for(int i=0; i < cargo_cap;i++){
              if(cargo[i] == null){ //find empty space and fill it in
                  cargo[i] = car;
                  added_cargo++;
                  return;
              }
          }
      }
  }
  
  
  //unload stuff and return the money to be added to account
  int unload(){
    int total=0;
    for(int i=0; i < passengers.length; i++){
      if(passengers[i] == null){
        break;
      }
      if(this.location == passengers[i].destination){
        total += passengers[i].cost;
        passengers[i] = null;
        added_pass --;
      }
    }
    for(int i=0; i < cargo.length; i++){
      if(cargo[i] == null){
        break;
      }
      if(this.location == cargo[i].destination){
        total += cargo[i].cost;
        cargo[i] = null;
        added_cargo --;
      }
    }
    return total;
  }
  
  
  //checks if an array is full
  boolean arrayFull(boolean type){
    if(type){
      return added_pass == passenger_cap;
    }
    return added_cargo == cargo_cap;
  }
  
  //checks if plane is full
  boolean planeFull(){
    return arrayFull(true) && arrayFull(false);
  }
  
  //fly the plane to a location
  void fly(int destination){
    if(destination != location){
        location = destination;
    }
    else{
      println("Trying to send plane to its own destination!!!");
    }
  }
  
  void printInfo(){
    println("Flight "+ PLANE_ID);
    println("Pass Cap: " + passenger_cap);
    println("Cargo cap: " + cargo_cap);
  }
}
