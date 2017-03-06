public abstract class AbstractProgram1 {
    public abstract boolean isStableMatching(Matching marriage);

    /**
     * Brute force solution to the Stable Marriage problem. Relies on the
     * function isStableMatching(Matching) to determine whether a candidate
     * Matching is stable.
     * 
     * @return A stable Matching.
     */
    public Matching stableMarriageBruteForce(Matching marriage) {
        int n = marriage.getWorkerCount();
        int m = marriage.getJobCount();

        Permutation p = new Permutation(n, m);

        Matching matching;
        while ((matching = p.getNextMatching(marriage)) != null) {
            if (isStableMatching(matching) == true) {
            	//System.out.print("Found \n");
                return matching;
            }
        }

        return new Matching(marriage);
    }

    public abstract Matching stableHiringGaleShapley(Matching marriage);
}
