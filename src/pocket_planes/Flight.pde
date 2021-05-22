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
    this.t_rem = this.f_length - (currTime-this.t_start);
    println("T_rem!: " + t_rem);
  }
  
  //checks if a plane has landed
  boolean ifLanded(int currTime){
    if(currTime-t_start == f_length){
      return true;
    }
    return false;
  }
}
