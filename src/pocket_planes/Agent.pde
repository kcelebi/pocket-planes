class Agent {
  
  Object model;
  Agent(Object m) {
    model = m;
  }
  
  
 //returns list of actions
 //Action object is 
 Action[] getAction(Game g){
   model.act();
 }
  
}
