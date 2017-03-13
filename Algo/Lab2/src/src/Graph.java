import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.sun.javafx.collections.MappingChange.Map;

/**
 */
public class Graph {

    /*
     * Creates a graph to represent the neighborhood, where unlocked is the file name for the unlocked houses
     * and keys is the file name for which houses have which keys.
     */
	String keys_line;
	String [] words;
    int house_number = 0;
    HashMap<String, Integer> eqv_number;
	int [][] adj_mat;
	String [] edge_house;
	int [] counter;
	
    public Graph(String unlocked, String keys) {
        
    	// Implementing the graph by taking the value from the input files.
    	// The graph is implemented as Map "hash" where the house is provided and it returns
    	// a string that contains edges from the house.
    	keys_line = null;
    	eqv_number =  new HashMap<String, Integer>();
    	edge_house = null;
    	
    	BufferedReader input_file;
    	try {
    		//Reading file.
    		input_file = new BufferedReader(new FileReader(keys));
        	while((keys_line = input_file.readLine()) != null){
        		words = keys_line.split(": ");
        		if(words.length == 1){
        			words[0] = words[0].substring(0, words[0].length() - 1);
        		}
        		eqv_number.put(words[0], house_number);
        		house_number += 1;
        	}
        	adj_mat = new int [eqv_number.size()][eqv_number.size()];
        	input_file.close();
        	for(int i = 0; i< eqv_number.size(); i++){
        		Arrays.fill(adj_mat[i], 0);
        	}
        	counter = new int[eqv_number.size()];
        	Arrays.fill(counter, -1);
        	input_file = new BufferedReader(new FileReader(keys));
        	while((keys_line = input_file.readLine()) != null){
        		
        		words = keys_line.split(": ");
        		edge_house = words[words.length -1].split(", ");
        		if(words.length == 1){
        			edge_house[0] = null;
        			words[0] = words[0].substring(0, words[0].length() -1);
        		}
        		for(int i = 0; i< edge_house.length; i++){
        			if(edge_house[0]!= null){
        		    adj_mat[eqv_number.get(words[0])][eqv_number.get(edge_house[i])] = 1;
        		    if(counter[eqv_number.get(edge_house[i])] == -1)
        		    	counter[eqv_number.get(edge_house[i])] += 2;
        		    else
        		    	counter[eqv_number.get(edge_house[i])] += 1;
        			}
        		}
          	}
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
     */
    public boolean containsVertex(String node) {
        //Using map's inbuilt function
        return  eqv_number.containsKey(node);
    }

    /*
     * This method should return true if there is a direct edge from the vertex
     * represented by start String and end String.
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
 	if(adj_mat[ eqv_number.get(start)][ eqv_number.get(end)] == 1)
    		return true;
        return false;
    }

    
    /*
     * This method returns true if the house represented by the input String is locked
     * and false is the house has been left unlocked.
     */
    public boolean isLocked(String house) {
       if(!containsVertex(house)){
    		System.out.println("Error house not in the list");
    		return false;
    		}	
       for(int i =0; i< eqv_number.size(); i++){
        	if(adj_mat[i][eqv_number.get(house)] == 1){
        		return true;
        	}
        }
    	return false;	
    }
    
    public Set getHouses(){
    	return (eqv_number.keySet());
    }
    
    public void updateCounter(String house, int val){
    	if(!containsVertex(house)){
    		System.out.println("Error house not in the list");
    		return;
    		}
    	counter[eqv_number.get(house)] += val;
    }
    
    public void replaceCounter(String house, int val){
    	if(!containsVertex(house)){
    		System.out.println("Error house not in the list");
    		return;
    		}
    	counter[eqv_number.get(house)] = val;
    }
    
    public int valueCounter(String house){
    	if(!containsVertex(house)){
    		System.out.println("Error house not in the list");
    		return -1;
    		}
    	return counter[eqv_number.get(house)];
    }
}
