package tej.aspectj;

import javax.realtime.AbsoluteTime;
import javax.realtime.Clock;
import javax.realtime.RelativeTime;

public aspect TimedLogging {
	
	public volatile AbsoluteTime start_time, t_time ;
	RelativeTime delta_time;
	public volatile Clock clk = Clock.getRealtimeClock();
	
	// A COMPLETER...
	pointcut ptc(int compteur): set(int tej.controller.Tache_Compteur.compteur)&& args(compteur);
	pointcut ptcTache():execution(void tej.controller.Tache_Compteur.run());

	before() : ptcTache(){
		start_time=clk.getTime();		
	}
	after(int compteur)  : ptc(compteur){
		t_time=clk.getTime();
		delta_time=t_time.subtract(this.start_time);
		System.out.println("<TimedLogging>: \t Compteur="+compteur+"\n \t delai="+delta_time.getMilliseconds()+"ms");
	}






}
