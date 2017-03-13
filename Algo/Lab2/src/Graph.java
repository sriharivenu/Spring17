import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

//import com.sun.javafx.collections.MappingChange.Map;

/**
 */
public class Graph {

    /*
     * Creates a graph to represent the neighborhood, where unlocked is the file name for the unlocked houses
     * and keys is the file name for which houses have which keys.
     */
	
	// Variables used for creating Graph.
	
	String keys_line;
	String [] words;
	HashMap<String, String> edge_list; // The adjacency list.
    String unlocked_houses;
    int house_number = 0;
    HashMap<String, Integer> eqv_number;// Number for each house for ease of iteration.
    
    
    
    // Reading given files for creating each graph will take O(n) complexity where "n" is number of houses.
    
    public Graph(String unlocked, String keys) {
        
    	// Implementing the graph by taking the value from the input files.
    	// The graph is implemented as Map "hash" where the house is provided and it returns
    	// a string that contains edges from the house.
    	keys_line = null;
    	unlocked_houses = "";
    	edge_list = new HashMap<String, String>();
    	eqv_number =  new HashMap<String, Integer>();
    	
    	BufferedReader input_file;
    	try {
    		//Reading file.
    		input_file = new BufferedReader(new FileReader(unlocked));
        	while((keys_line = input_file.readLine()) != null){
        		unlocked_houses += keys_line + ",";
        	}
        	input_file.close();
        	keys_line = null;
    	}
        catch(FileNotFoundException exception){
        	System.out.println("File Not found");
        }
    	catch(IOException exception){
    		System.out.println("error in reading file");
    	}
    	try {
    		//Reading file.
    		input_file = new BufferedReader(new FileReader(keys));
        	while((keys_line = input_file.readLine()) != null){
        		words = keys_line.split(": ");
        		//System.out.println(keys_line);
        		if(words.length == 1){
        			words[0] = words[0].substring(0, words[0].length() - 1);
        			edge_list.put(words[0], "none");
        		}
        		else
        			edge_list.put(words[0], words[1]);
        		eqv_number.put(words[0], house_number);
        		house_number += 1;
        	}
        	//System.out.println(edge_list.keySet());
        	//System.out.println(eqv_number.keySet());
        	input_file.close();
        	}
        catch(FileNotFoundException exception){
        	System.out.println("File Not found");
        }
    	catch(IOException exception){
    		System.out.println("error in reading file");
    	}
    }

    /*
     * This method should return true if the Graph contains the vertex described by the input String.
     * The complexity of this method is O(1).
     */
    public boolean containsVertex(String node) {
        //Using map's inbuilt function
    	return edge_list.containsKey(node);
    }

    /*
     * This method should return true if there is a direct edge from the vertex
     * represented by start String and end String.
     * The complexity of this method is O(n) in worst case, where "n" is number of houses.
     */
    public boolean containsEdge(String start, String end) {
    	if(!containsVertex(start)){
    		System.out.println("Error house not in the list");
    		return false;
    		}
    	if(!containsVertex(end)){
    		System.out.println("Error house not in the list");
    		return false;
    		}
        String value = null;
        String [] sub_words;
        boolean edge_present = false;
        value = edge_list.get(start);
        if(value.compareTo("none") == 1)
        	return false;
        sub_words = value.split(", ");
        for(int i = 0; i<sub_words.length; i++){
        	if(sub_words[i].compareTo(end) == 0){
        		edge_present = true;
        		break;
        	}
        }
        return edge_present;
    }

    
    /*
     * This method returns true if the house represented by the input String is locked
     * and false is the house has been left unlocked.
     * This has the complexity of O(n), where "n" is the worst case complexity.
     */
    public boolean isLocked(String house) {
       if(!containsVertex(house)){
    		System.out.println("Error house not in the list");
    		return false;
    		}
       boolean is_locked = true;
       String [] unlocked;
       unlocked = unlocked_houses.split(",");
       for(int i = 0; i < unlocked.length; i++){
    	   if(unlocked[i].compareTo(house) == 0){
    		   is_locked = false;
    		   break;
    	   }
       }
       return is_locked;
    }
    
    // This function returns all the houses present in the list.
    
    public Set getHouses(){
    	return (edge_list.keySet());
    			
    }
    
    
    // This returns the keys present in a house.
    
    public String holdingKeys(String house){
    	return edge_list.get(house);
    }
    
    // This returns the number of lines incoming to the node, i.e. the number of keys each house has.
    
    public int[] counter(){
    	int [] count = new int [edge_list.size()];
    	Arrays.fill(count, -1);
    	Set<String> keys = getHouses();
    	String [] houses;
    	for(String i:keys){
    		if(edge_list.get(i) == "none")
    			continue;
    		else{
    			houses = (edge_list.get(i)).split(", ");
    			for(int i1 = 0; i1<houses.length; i1++){
    				if(count[eqv_number.get(houses[i1])] == -1)
    					count[eqv_number.get(houses[i1])] += 2;
    				else
    					count[eqv_number.get(houses[i1])] += 1;
    			}
    		}
    	}
    	return count;
    }
    
    
    // This provides the equivalent numbers for each house.
    
    public int getNumber(String house){
    	if(!containsVertex(house)){
    		System.out.println("Error house not in the list");
    		return -1;
    		}
    	return eqv_number.get(house);
    }
    
}
