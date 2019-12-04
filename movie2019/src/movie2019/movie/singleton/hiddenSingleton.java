package movie2019.movie.singleton;

import java.util.ArrayList;

import movie2019.movie.db.UserHiddenMovieVO;

public class hiddenSingleton { 
	
private static hiddenSingleton singleton = new hiddenSingleton();

private ArrayList<Integer> list = null;

private hiddenSingleton() {
	list = new ArrayList<Integer>();
}

public static hiddenSingleton getInstance() {
    return singleton;
}

public void addHiddenList(ArrayList<Integer> list){
	
	for(int u : list) {
		if(!this.list.contains(u))
		this.list.add(u);
	}
}

public ArrayList<Integer> getHiddenList(){
	return list;	
}

public void addHiddenValue(int movieId) {
	list.add(movieId);
}





}
