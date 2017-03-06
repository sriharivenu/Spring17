import java.util.ArrayList;

/**
 * A Matching represents a candidate solution to the Stable Marriage problem. A
 * Matching may or may not be stable.
 */
public class Matching {
    /** Number of jobs. */
    private Integer m;

    /** Number of workers. */
    private Integer n;

    /** A list containing each job's preference list. */
    private ArrayList<ArrayList<Integer>> job_preference;

    /** A list containing each worker's preference list. */
    private ArrayList<ArrayList<Integer>> worker_preference;

    /** A list containing each job's full-time/half-time status. true if full-time, false otherwise **/
    private ArrayList<Boolean> job_is_fulltime;

    /** A list containing each worker's hard working status. true if hard worker, false otherwise **/
    private ArrayList<Boolean> worker_is_hardworking;

    /**
     * Matching information representing the index of job a worker is
     * matched to, -1 if not matched.
     * 
     * An empty matching is represented by a null value for this field.
     */
    private ArrayList<Integer> worker_matching;

    public Matching(Integer m, Integer n,
                    ArrayList<ArrayList<Integer>> job_preference,
                    ArrayList<ArrayList<Integer>> worker_preference,
                    ArrayList<Boolean> job_is_fulltime,
                    ArrayList<Boolean> worker_is_hardworking) {
        this.m = m;
        this.n = n;
        this.job_preference = job_preference;
        this.worker_preference = worker_preference;
        this.job_is_fulltime = job_is_fulltime;
        this.worker_is_hardworking = worker_is_hardworking;
        this.worker_matching = null;
    }

    public Matching(Integer m, Integer n,
                    ArrayList<ArrayList<Integer>> job_preference,
                    ArrayList<ArrayList<Integer>> worker_preference,
                    ArrayList<Boolean> job_is_fulltime,
                    ArrayList<Boolean> worker_is_hardworking,
                    ArrayList<Integer> worker_matching) {
        this.m = m;
        this.n = n;
        this.job_preference = job_preference;
        this.worker_preference = worker_preference;
        this.job_is_fulltime = job_is_fulltime;
        this.worker_is_hardworking = worker_is_hardworking;
        this.worker_matching = worker_matching;
    }

    /**
     * Constructs a solution to the stable marriage problem, given the problem
     * as a Matching. Take a Matching which represents the problem data with no
     * solution, and a worker_matching which solves the problem given in data.
     * 
     * @param data
     *            The given problem to solve.
     * @param worker_matching
     *            The solution to the problem.
     */
    public Matching(Matching data, ArrayList<Integer> worker_matching) {
        this(data.m, data.n, data.job_preference,
                data.worker_preference, data.job_is_fulltime,
                data.worker_is_hardworking, worker_matching);
    }

    /**
     * Creates a Matching from data which includes an empty solution.
     * 
     * @param data
     *            The Matching containing the problem to solve.
     */
    public Matching(Matching data) {
        this(data.m, data.n, data.job_preference,
                data.worker_preference, data.job_is_fulltime,
                data.worker_is_hardworking, new ArrayList<Integer>(0));
    }

    public void setWorkerMatching(ArrayList<Integer> worker_matching) {
        this.worker_matching = worker_matching;
    }

    public Integer getJobCount() { return m; }

    public Integer getWorkerCount() { return n; }

    public ArrayList<ArrayList<Integer>> getJobPreference() {
        return job_preference;
    }
    public ArrayList<Boolean> getJobFulltime() { return job_is_fulltime; }

    public ArrayList<ArrayList<Integer>> getWorkerPreference() {
        return worker_preference;
    }
    public ArrayList<Boolean> getWorkerHardworking() { return worker_is_hardworking; }

    public ArrayList<Integer> getWorkerMatching() {
        return worker_matching;
    }
    
    public String getInputSizeString() {
        return String.format("m=%d n=%d\n", m, n);
    }
    
    public String getSolutionString() {
        if (worker_matching == null) {
            return "";
        }
        
        StringBuilder s = new StringBuilder();
        for (int i = 0; i < worker_matching.size(); i++) {
            String str = String.format("Worker %d Job %d", i, worker_matching.get(i));
            s.append(str);
            if (i != worker_matching.size() - 1) {
                s.append("\n");
            }
        }
        return s.toString();
    }
    
    public String toString() {
        return getInputSizeString() + getSolutionString();
    }
}
