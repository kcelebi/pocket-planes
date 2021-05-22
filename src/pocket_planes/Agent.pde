class Agent {
  
  Model model;
  Agent(Model m) {
    model = m;
  }
  
  
 //returns list of actions
 //Action object is 
 Action[] getAction(Game g){
   return model.act(g);
 }
  
}

class Model {
  
  Model() {}
  
  Action[] act(Game g) {
    return new Action[10];
  }
  
}

class Greedy extends Model {
  Greedy(){super();}
  
  void prints(){
    println("Model: Greedy");
  }
}

class LP extends Model {
  LP(){super();}
  
  void prints(){
    println("Model: LP");
  }
}
