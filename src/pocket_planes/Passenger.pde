class Passenger{
  int cost;
  int destination;
  int location;
  boolean layover;
  
  Passenger(int pay, int dest, int loc){
    //assign attributes
    cost = pay;
    destination = dest;
    location = loc;
    layover = false; //initially false
  }
  
  int getDest(){
    return destination;
  }
  
}
