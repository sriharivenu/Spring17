import java.util.LinkedList;
// Queue for maintaining the free workers list 
public class worker_queue<item> {
	
	private LinkedList<item> que = new LinkedList<item>();
	
	public void add(item worker){
		que.addLast(worker);
	}
	
	public item delete(){
		return que.poll();
	}
	
	public boolean itemsLeft(){
		return (!que.isEmpty());
	}
	
	public int queue_size(){
		return que.size();
	}
	
	public void addItems(worker_queue< ? extends item> q){
		while(q.itemsLeft())
			que.addLast(q.delete());
	}
	
	public void fill_queue(int total_size){
		worker_queue<Integer> emptyQueue = new worker_queue<Integer>();
		int i = 0;
		while(i < total_size){
			emptyQueue.add(0);
			i++;
		}
	}

}


