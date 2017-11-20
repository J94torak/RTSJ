package tej.aspectj;

import javax.realtime.AbsoluteTime;
import javax.realtime.Clock;
import javax.realtime.RelativeTime;

public aspect TimedLogging {
	
	public volatile AbsoluteTime start_time, t_time ;
	RelativeTime delta_time;
	public volatile Clock clk = Clock.getRealtimeClock();
	
	// A COMPLETER...
	pointcut ptc(int compteur): set(int tej.controller.Tache_Compteur.compteur)&&args(compteur);
	pointcut ptcTache():execution(void tej.controller.Tache_Compteur.run());

	before(): ptcTache(){
		this.start_time=clk.getTime();		
	}
	
	after(int compteur)  : ptc(compteur){
		this.t_time=clk.getTime();
		try {delta_time=this.t_time.subtract(this.start_time);
		System.out.println("<TimedLogging>: \t Compteur="+compteur+"\n \t delai="+delta_time.getMilliseconds()+"ms");}
		catch(java.lang.IllegalArgumentException e){
			System.out.println("Argument Exception");
		}
		catch(java.lang.ArithmeticException e){
			System.out.println("Arithmetic Exception");
		}
		
	}






}