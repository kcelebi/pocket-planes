//class representing an agents' action

class Action {
  
  int org;
  int dest;
  int[] item_index;
  Plane p;
  //one action, which is a flight from a->b with x,y,z on board with plane p
  Action(int org, int dest, int[] item_index, Plane p){
    this.org = org;
    this.dest = dest;
    this.item_index = item_index;
    this.p = p;
  }
  
  
}
