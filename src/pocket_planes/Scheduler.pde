//from scipy.optimize import linprog
class Scheduler{
	
	Game game;	
	Scheduler(Game g){
		game = g;
	}

	void schedule(){
		//Need matrix
		float[][] C = new float[sq(74) + 74][sq(74)]; //n x n, 74 cities currently
		float[] x = new float[sq(74)]; //74c2 options
		float[] lb = new float[sq(74) + 74]; //zeros
		float[] ub = new float[sq(74) + 74]; //cargo + pass for each city
		for(City c: game.owned_cities){
			for(int i=0; i < 74; i++){
				C[c.code][i+74*c.code] = 1;
				lb[i+74*c.code] = 0;
				//make upper bounds PART 1 --> need to also consider that we dont 
				//overreach
				ub[i+74*c.code] = 0;
				for(Passenger p: c.pass){
					//if destination matches
					if(p.destination == i){
						ub[i+74*c.code]++;
					}
				}
			}

			for(int i=sq(74); i < sq(74) +74; i++){
				C[c.code][i+74*c.code] = 1;
			}
		}
	}

	void sched(){
		City[] fin_city = citySelect(); //get cities that can man flights
		int[][] mat = new int[fin_city.length][fin_city.length];
		int[] obj_func = new int[];
		for(City c: fin_city){
			for(Plane p: c.planes){
				//make an index matrix so we dont have a 500x500 mat with a billion 0's
				//
			}
		}

	}


	/**
		Select the cities that can send planes
	**/
	City[] citySelect(){
		City[] fin_city = new City[300]; //large size
		int i=0; 
		for(City c: g.owned_cities){
			if(c.planes.length > 0 && (c.pass.length > 0 || c.cargo.length > 0)){
				fin_city[i] = c;
				i++;
			}
		}

		return fin_city;
	}

	//Dot product
	float dot(float[] x, float[] y){
		float total = 0;
		for(float x_: x){
			for(float y_: y){
				total += x_*y_;
			}
		}
		return total;
	}

	//nCk
	int binomial(int n,int k){
		return factorial(n)/factorial(n-k)/factorial(k);
	}

	//factorial function
	int factorial(int k){
		int tot =1;
		for(int i=1;i <=k;i++){
			tot *=i;
		}
		return tot;
	}
	//Maximizing revenue
	//Need all price constants (c_49,55 etc) - cost for travel
		//Will be square n x n matrix, n is # of cities, diagonal is 0. 
	//Need amount of passengers+cargo in all cities which is our capc
	//No demand, maybe later to motivate it or smthn?
	//Lower bounds, 0's


}