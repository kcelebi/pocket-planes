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
  
  Passenger passengers[];
  Cargo cargo[];
  
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
    passengers = new Passenger[passenger_cap];
    cargo = new Cargo[cargo_cap];
    
    //set record attributes
    flights = 0;
    miles = 0;
  }
  
  
  //loads passenger onto plane
  void loadPassenger(Passenger pass){
    if(!arrayFull(passengers)){ //if not full
        for(int i=0; i < passenger_cap;i++){
            if(passengers[i] == null){ //find empty space and fill it in
                passengers[i] = pass;
                return;
            }
        }
    }
  }
  
  //loads cargo onto plane
  void loadCargo(Cargo car){
    if(!arrayFull(cargo)){ //if not full
          for(int i=0; i < cargo_cap;i++){
              if(cargo[i] == null){ //find empty space and fill it in
                  cargo[i] = car;
                  return;
              }
          }
      }
  }
  
  
  //checks if an array is full
  boolean arrayFull(Object[] arr){
    boolean full = true;
    for(Object item : arr){
        if(item == null){
          full = false;
          break;
        }
    }
    
    return full;
  }
  
  //checks if empty
  boolean planeEmpty(){
    for(Passenger p :passengers){
      if(p != null){
        return false;
      }
    }
    for(Cargo p :cargo){
      if(p != null){
        return false;
      }
    }
    return true;
  }
  
  //fly the plane to a location
  void fly(int destination){
    if(destination != location){
        location = destination;
    }
  }
}
