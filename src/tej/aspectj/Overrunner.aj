package tej.aspectj;

import javax.realtime.RelativeTime;

public aspect Overrunner {

	RelativeTime DELAY_INC = new RelativeTime(500,0);
	RelativeTime delay= new RelativeTime (DELAY_INC);
	
	// COMPLETER...
	
	
	
	// Traitement pour ralentir progressivement la tâche
	public void ralentir(){
		try {
			System.out.print("ralentir... \t");
			Thread.sleep(delay.getMilliseconds());
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		delay.add(DELAY_INC,delay);		
	}

}