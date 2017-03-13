import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.TreeMap;
import java.util.Map.Entry;

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
    	//Implementing function with the given specification
    	String Input_line = null;
    	BufferedReader input_file;
    	String [] ingredient_details;
    	TreeMap<Float, String> ingredients = new TreeMap<Float, String>();
    	boolean firstline_flag = false;
    	float cost = 0;
    	float maxWeight = 0;
    	float weight = 0;
    	float key_lastentry;
    	String value;
    	Entry<Float, String> item;
    	try{
    		input_file = new BufferedReader(new FileReader(lootList));
    		while((Input_line = input_file.readLine()) != null){
    			if(firstline_flag == false){
    				firstline_flag = true;
    				maxWeight = Float.valueOf(Input_line);
    			}
    			else{
    			ingredient_details = Input_line.split(", ");
    			cost = Float.valueOf(ingredient_details[2]);
    			ingredients.put(cost, Input_line); // This line will order them in ascending order and will take O(n log n)
    			}
    		}
    	}
    	catch(FileNotFoundException exception){
        	System.out.println("File Not found");
        }
    	catch(IOException exception){
    		System.out.println("error in reading file");
    	}
    	 // Logic: Compare the maxweight with high price item and it takes O(n log n) as maximum
    	
    	while(maxWeight != 0){
    		if(ingredients.isEmpty())
    			return;
    		else{
    			item = ingredients.lastEntry();  				  // This will take O(log n);
    			key_lastentry = item.getKey();				   	  // This will take O(1)
    			value = item.getValue();						  // Similarly this will take O(1);
    			ingredient_details = value.split(", ");
    			weight = Float.valueOf(ingredient_details[1]);
    			
    			if(weight >= maxWeight){
    				System.out.println(ingredient_details[0]+" "+maxWeight);
    				return;
    			}
    			else{
    				maxWeight -= weight;
    				System.out.println(ingredient_details[0]+" "+ weight);
    				ingredients.remove(key_lastentry);						// This statement will take O(log n);
    			}
    			
    		}
    	}

    }


    public void scheduleMeetings(String buyerList) {
    	//Implementing the functions
    	String Input_line = null;
    	BufferedReader input_file;
    	String [] buyers;
    	String name;
    	String [] buy_time;
    	float time = 0;
    	float minutes = 0;
    	TreeMap<Float, String> buyers_list = new TreeMap<Float, String>();
    	boolean first_element = true;
    	Entry<Float, String> buyer;
    	float start_time = 0, end_time = 0;
    	try{
    		input_file = new BufferedReader(new FileReader(buyerList));
    		while((Input_line = input_file.readLine()) != null){
    			buyers = Input_line.split("-");
    			if(buyers[1].matches("(.*)pm")){
    				buyers[1] = buyers[1].substring(0, buyers[1].length() -2);
    				if(buyers[1].matches("(.*):(.*)")){
    					buy_time = buyers[1].split(":");
    					minutes =Float.valueOf(buy_time[1]);
    					time = Float.valueOf(buy_time[0]);
    					if(minutes >= 60){
    						time += 1;
    						minutes -= 60;
    					}
    					time = time + (minutes/100);
    				}
    				else{
    					time = Float.valueOf(buyers[1]);
    				}
    				time += 12;
    			}
    			else{
    				buyers[1] = buyers[1].substring(0, buyers[1].length() -2);
    				if(buyers[1].matches("(.*):(.*)")){
    					buy_time = buyers[1].split(":");
    					minutes =Float.valueOf(buy_time[1]);
    					time = Float.valueOf(buy_time[0]);
    					if(minutes >= 60){
    						time += 1;
    						minutes -= 60;
    					}
    					time = time + (minutes/100);
    				}
    				else{
    					time = Float.valueOf(buyers[1]);
    				}
					// This will take O(n log n)
    			}
    			buyers_list.put(time, Input_line);
    		}
    	}
    	catch(FileNotFoundException exception){
        	System.out.println("File Not found");
        }
    	catch(IOException exception){
    		System.out.println("error in reading file");
    	}
    	
    	while(!buyers_list.isEmpty()){
    		if(first_element){
    			first_element = false;
    			buyer = buyers_list.firstEntry();
    			end_time = buyer.getKey();
    			end_time += 0.15; 												// This is added to provide 15 minutes break;
    			buyers_list.remove(buyer.getKey());            					// This will take O(log n)
    			name = buyer.getValue();
    			buyers = name.split(", ");
    			System.out.println(buyers[0]);
    		}
    		else{
    			buyer = buyers_list.firstEntry();
    			Input_line = buyer.getValue();
    			buyers = Input_line.split(", ");
    			name = buyers[0];
    			Input_line = buyers[1];
    			buyers = Input_line.split("-");
    			if(buyers[0].matches("(.*)pm")){
    				buyers[0] = buyers[0].substring(0, buyers[0].length() -2);
    				if(buyers[0].matches("(.*):(.*)")){
    					buy_time = buyers[0].split(":");
    					minutes =Float.valueOf(buy_time[1]);
    					time = Float.valueOf(buy_time[0]);
    					if(minutes >= 60){
    						time += 1;
    						minutes -= 60;
    					}
    					time = time + (minutes/100);
    				}
    				else{
    					time = Float.valueOf(buyers[0]);
    				}
    				start_time = time;
    				start_time += 12;
    			}
    			else{
    				buyers[0] = buyers[0].substring(0, buyers[0].length() -2);
    				if(buyers[0].matches("(.*):(.*)")){
    					buy_time = buyers[0].split(":");
    					minutes =Float.valueOf(buy_time[1]);
    					time = Float.valueOf(buy_time[0]);
    					if(minutes >= 60){
    						time += 1;
    						minutes -= 60;
    					}
    					time = time + (minutes/100);
    				}
    				else{
    					time = Float.valueOf(buyers[0]);
    				}
    				start_time = time;
    			}
    			
    			if(end_time <= start_time){
    				System.out.println(name);
    				end_time = buyer.getKey();
    				end_time += 0.15;
    				buyers_list.remove(buyer.getKey()); 						// This will take O( log n)
    				
    			}
    			else{
    				buyers_list.remove(buyer.getKey()); 						// This will take O(log n)
    			}
    		}
    	}
    }
}
