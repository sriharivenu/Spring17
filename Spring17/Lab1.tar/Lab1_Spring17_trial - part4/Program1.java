/*
 * Name: 
 * EID:
 */

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;

/**
 * Your solution goes in this class.
 * 
 * Please do not modify the other files we have provided for you, as we will use
 * our own versions of those files when grading your project. You are
 * responsible for ensuring that your solution works with the original version
 * of all the other files we have provided for you.
 * 
 * That said, please feel free to add additional files and classes to your
 * solution, as you see fit. We will use ALL of your additional files when
 * grading your solution.
 */
public class Program1 extends AbstractProgram1 {
    /**
     * Determines whether a candidate Matching represents a solution to the
     * Stable Marriage problem. Study the description of a Matching in the
     * project documentation to help you with this.
     */
    	
	public boolean isStableMatching(Matching marriage) {
       /*First: Once we get the worker_matching we need to 
		 * select one pair and then compare for instability
		 * with other pairs*/
       
		ArrayList<ArrayList<Integer>> worker_pref = marriage.getWorkerPreference(); 
		ArrayList<ArrayList<Integer>> employer_pref = marriage.getJobPreference();
        ArrayList<Integer> matched_set = marriage.getWorkerMatching();
		
        // Assuming that number of rows and column are same!!!
        
        int totalRows = worker_pref.get(0).size();
        
        boolean flag = true;
        int preference_one = 0;			// Preference of the first job or worker
        int preference_two = 0;			// Preference of the second job or worker
        if(marriage.getJobCount() != marriage.getWorkerCount()){
        	return false;
        }
        
        for (int i = 0; i < totalRows; i++){
        	for (int j = i+1; j < totalRows; j++){
        		preference_one = worker_pref.get(i).get(matched_set.get(i));
        		preference_two = worker_pref.get(i).get(matched_set.get(j));
        		if( preference_two < preference_one ){
        			// When the other job is preferred over assigned one
        			preference_one = employer_pref.get(matched_set.get(j)).get(i);
        			preference_two = employer_pref.get(matched_set.get(j)).get(j);
        			if(preference_one == preference_two){
        				flag = true;
        			}
        			else if(preference_one < preference_two){
        				flag =  false;
        			}
        			
        		}
        		else if(preference_one == preference_two){
        			preference_one = employer_pref.get(matched_set.get(i)).get(i);
        			preference_two = employer_pref.get(matched_set.get(j)).get(i);
        			if(preference_two < preference_one){
        				preference_one = employer_pref.get(matched_set.get(j)).get(i);
            			preference_two = employer_pref.get(matched_set.get(j)).get(j);
            			if(preference_one == preference_two){
            				flag = true;
            			}
            			else if(preference_one < preference_two){
            				flag =  false;
            			}
        			}
        		}
        		preference_one = worker_pref.get(j).get(matched_set.get(i));
        		preference_two = worker_pref.get(j).get(matched_set.get(j));
        		if( preference_one < preference_two){
        			// when the other job is preferred over assigned
        			preference_one = employer_pref.get(matched_set.get(i)).get(i);
        			preference_two = employer_pref.get(matched_set.get(i)).get(j);
        			if(preference_one == preference_two){
        				flag = true;
        			}
        			
        			else if(preference_two < preference_one){
        				flag =  false;
        			}
        			
        		}
        		else if(preference_one == preference_two){
        			preference_one = employer_pref.get(matched_set.get(i)).get(j);
        			preference_two = employer_pref.get(matched_set.get(j)).get(j);
        			if(preference_one < preference_two){
        				preference_one = employer_pref.get(matched_set.get(i)).get(i);
            			preference_two = employer_pref.get(matched_set.get(i)).get(j);
            			if(preference_one == preference_two){
            				flag = true;
            			}
            			
            			else if(preference_two < preference_one){
            				flag =  false;
            			}
        			}
        		}
        		
        	}
        }
        return flag; 
    }
	
	// A function to get the most preferred job or worker.
    public int findMin(ArrayList<Integer> prefList){
    	int minPref = 0;
    	int next = 1;
    	int result = 0;
    	minPref = prefList.get(0);
    	while(minPref == -1){
    		minPref = prefList.get(next);
    		result = next;
    		next++;
    	}
    	for(int i = next; i < prefList.size(); i++){
    		if(prefList.get(i) == -1){
    			continue;
    		}
    		else{
    			if(prefList.get(i) < minPref){
    				minPref = prefList.get(i);
    				result = i;
    			}
    			else{
    				continue;
    			}
    		}
    	}
    	return result;
    }
    /**
     * Determines a solution to the Stable Marriage problem from the given input
     * set. Study the project description to understand the variables which
     * represent the input to your solution.
     * 
     * @return A stable Matching.
     */
    public Matching stableHiringGaleShapley(Matching marriage) {
       
    	// Input from Matching class
    	worker_queue<Integer> freeWorkers = new worker_queue<Integer>();
    	ArrayList<ArrayList<Integer>> worker_pref = marriage.getWorkerPreference(); 
		ArrayList<ArrayList<Integer>> employer_pref = marriage.getJobPreference();
        
		// Assuming that both rows and columns are same
        int totalRows = worker_pref.get(0).size();
    	
        //Initializing lists with "-1", which means not matched 
        ArrayList<Integer> jobsWorker = new ArrayList<Integer>(Collections.nCopies(totalRows, -1));
        ArrayList<Integer> workersJob = new ArrayList<Integer>(Collections.nCopies(totalRows, -1));
        
        ArrayList<Integer> count = new ArrayList<Integer>(Collections.nCopies(totalRows, 0));
        
        // Variables for implementing the logic
        int worker = 0;
        int topPreference = 0;
        int totalApplied = 0;
        int preference_one = 0;
        int preference_two = 0;
        if(marriage.getJobCount() != marriage.getWorkerCount()){
            return null;
        }
        
        // Fill the worker queue with all workers
        
        for(int i=0; i<totalRows; i++){
        	freeWorkers.add(i);
        }
        
        while(freeWorkers.itemsLeft()){
        	worker = freeWorkers.delete();
        	totalApplied = count.get(worker);
        	topPreference = findMin(worker_pref.get(worker));
        	worker_pref.get(worker).set(topPreference, -1);
        	if(jobsWorker.get(topPreference) == -1){
        		jobsWorker.set(topPreference, worker);
        		workersJob.set(worker, topPreference);
        		count.set(worker, (totalApplied+1));
        	}
        	else{
        		preference_one = employer_pref.get(topPreference).get(worker);
        		preference_two = employer_pref.get(topPreference).get(jobsWorker.get(topPreference));
        		//System.out.print("For job "+topPreference+" Preference one: "+preference_one+" worker "+ worker + " preference 2: "+preference_two+" worker "+jobsWorker.get(topPreference)+"\n");
        		if(preference_two <= preference_one){
        			freeWorkers.add(worker);
        			count.set(worker, (totalApplied+1));
        		}
        		else{
        			freeWorkers.add(jobsWorker.get(topPreference));
        			jobsWorker.set(topPreference, worker);
            		workersJob.set(worker, topPreference);
            		count.set(worker, (totalApplied+1));
        		}
        	}
        }
        return new Matching(marriage, workersJob);
    }
}
