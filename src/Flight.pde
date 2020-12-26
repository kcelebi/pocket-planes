class Flight {
  int t_start;
  int t_rem;
  int f_length; //flight length
  Plane plane;
  int destination;
  
  Flight(int tr, int fl, Plane p, int dest){
    //assign attributes
    t_start = tr;
    f_length = fl;
    t_rem = f_length;
    plane = p;
    destination = dest;
  }
  
  
  //updates flight time based on current time
  void updateFlight(int currTime){
    t_rem = f_length - (currTime-t_start);
  }
  
  //checks if a plane has landed
  boolean ifLanded(int currTime){
    if(currTime-t_start == f_length){
      return true;
    }
    return false;
  }
}
