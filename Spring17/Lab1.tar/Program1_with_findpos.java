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
	
	// This function is to find the position of the value in a list
	
    public int findPos(ArrayList<ArrayList<Integer>> preference, int row, int value) {
    	ArrayList<Integer> pref_row = preference.get(row);
    	for ( int pos = 0; pos < pref_row.size(); pos++ ){
    		if(pref_row.get(pos) == value){
    			return pos;
    		}
    	}
    	return -1;
    }
	
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
        		preference_one = findPos(worker_pref, i, matched_set.get(i));
        		preference_two = findPos(worker_pref, i, matched_set.get(j));
        		if( preference_two < preference_one ){
        			// When the other job is preferred over assigned one 
        			preference_one = findPos(employer_pref, matched_set.get(j), i);
        			preference_two = findPos(employer_pref, matched_set.get(j), j);
        			if(preference_one < preference_two){
        				flag = false;
        			}
        		}
        		
        		preference_one = findPos(worker_pref, j, matched_set.get(i));
        		preference_two = findPos(worker_pref, j, matched_set.get(j));
        		if( preference_one < preference_two){
        			// when the other job is preferred over assigned
        			preference_one = findPos(employer_pref, matched_set.get(i), i);
        			preference_two = findPos(employer_pref, matched_set.get(i), j);
        			if(preference_two < preference_one){
        				flag = false;
        			}
        			
        		}

        	}
        }
        
		return flag; 
    }
    
    /**
     * Determines a solution to the Stable Marriage problem from the given input
     * set. Study the project description to understand the variables which
     * represent the input to your solution.
     * 
     * @return A stable Matching.
     */
    public Matching stableHiringGaleShapley(Matching marriage) {
        
    	// Get the input list from the Matching class
    	worker_queue<Integer> freeWorkers = new worker_queue<Integer>();
    	ArrayList<ArrayList<Integer>> worker_pref = marriage.getWorkerPreference(); 
		ArrayList<ArrayList<Integer>> employer_pref = marriage.getJobPreference();
        
        int totalRows = worker_pref.get(0).size();
    	
        // Initializing all the values with "-1", which shows that it is not matched
        ArrayList<Integer> jobsWorker = new ArrayList<Integer>(Collections.nCopies(totalRows, -1));
        ArrayList<Integer> workersJob = new ArrayList<Integer>(Collections.nCopies(totalRows, -1));
        
        ArrayList<Integer> count = new ArrayList<Integer>(Collections.nCopies(totalRows, 0));
        
        // Variables for implementing algorithm
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
        // Gale-Sharpley Algorithm
        while(freeWorkers.itemsLeft()){
        	worker = freeWorkers.delete();
        	totalApplied = count.get(worker);
        	topPreference = worker_pref.get(worker).get(totalApplied);
        	if(jobsWorker.get(topPreference) == -1){
        		jobsWorker.set(topPreference, worker);
        		workersJob.set(worker, topPreference);
        		count.set(worker, (totalApplied+1));
        	}
        	else{
        		preference_one = findPos(employer_pref, topPreference, worker);
        		preference_two = findPos(employer_pref, topPreference, jobsWorker.get(topPreference));
        		
        		if(preference_two < preference_one){
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
