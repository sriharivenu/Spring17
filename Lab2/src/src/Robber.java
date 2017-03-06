import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.sun.javafx.collections.MappingChange.Map;

/**
 */
public class Robber {

    /*
     * This method should return true if the robber can rob all the houses in the neighborhood,
     * which are represented as a graph, and false if he cannot. The function should also print to the console the
     * order in which the robber should rob the houses if he can rob the houses. You do not need to print anything
     * if all the houses cannot be robbed.
     */
    public boolean canRobAllHouses(Graph neighborhood) {
        //Trying to implement using the map style graph.
    	List<String> free_houses = new ArrayList<String>();
    	String node = new String();
    	Set<String> keys = neighborhood.getHouses();
    	String output = "";
    	for(String i:keys){
    		if(!neighborhood.isLocked(i)){
    			free_houses.add(i);
    		}
    	}
    	int no_of_houses = 0;
    	while(!free_houses.isEmpty()){
    		if(!neighborhood.containsVertex(free_houses.get(0)))
    			return false;
    		no_of_houses += 1;
    		node = free_houses.get(0);
    		output += node+", ";
    		free_houses.remove(0);
    		for(String i:keys){
    			if(neighborhood.containsEdge(node, i)){
    				neighborhood.updateCounter(i, -1);
    				if(neighborhood.valueCounter(i) == 0){
    					free_houses.add(i);
    					neighborhood.replaceCounter(i, -1);
    				
    				}
    			}		
    		}
    		
    	}
    	output = output.substring(0, output.length() -2);
    	if(no_of_houses == keys.size()){
    		System.out.println(output);
    		return true;
    	}
        return false;
    }

    /*
     *
     */
    public void maximizeLoot(String lootList) {
        //TODO: Implement Function

    }


    public void scheduleMeetings(String buyerList) {
        //TODO: Implement Function

    }
}
