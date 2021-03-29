class LinProg {
  
  int[] f;
  float[][] A;
  float[][] Aeq;
  float[] b;
  float[] beq;
  float[] lb;
  float[] ub;
  
  //Assume in canonical form, minimizing
  
  LinProg(int[] f, float[][] A, float[] b, float[][] Aeq, float[] beq, float[] lb, float[] ub){
    this.f = f;
    this.A = A;
    this.b = b;
    this.Aeq = Aeq;
    this.beq = beq;
    this.lb = lb;
    this.ub = ub;
  }
  
  LinProg(int[] f, float[][] A, float[] b){
    //no eq, assume lb 0
    this.f = f;
    this.A = A;
    this.b = b;
  }
  
  LinProg(int[] f, float[][] A, float[] b, float[] lb, float[] ub){
    this.f = f;
    this.A = A;
    this.b = b;
    this.lb = lb;
    this.ub = ub;
  }
  
  float[] solve() {
    
    return null;
  }
  

}
