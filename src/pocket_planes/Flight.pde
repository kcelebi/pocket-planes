class Flight {
  int t_start;
  int t_rem;
  int f_length; //flight length
  Plane plane;
  int origin;
  int destination;
  
  Flight(int tr, int fl, Plane p, int dest, int org){
    //assign attributes
    this.t_start = tr;
    this.f_length = fl;
    this.t_rem = f_length;
    this.plane = p;
    this.destination = dest;
    this.origin = org;
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
