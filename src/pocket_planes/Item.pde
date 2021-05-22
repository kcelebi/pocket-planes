class Item{
  int cost;
  int destination;
  int location;
  boolean layover; //negative cost
  boolean type; //passenger 0 or cargo 1
  
  Item(int cost, int dest, int loc, boolean type){
    //assign attributes
    this.cost = cost;
    destination = dest;
    location = loc;
    layover = false; //initially false
    this.type = type;
  }
  
  boolean passQ(){
    return type;
  }
  
  boolean cargoQ(){
    return !type;
  }
}
