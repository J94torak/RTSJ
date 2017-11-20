package tej.aspectj;

import javax.realtime.AbsoluteTime;
import javax.realtime.Clock;
import javax.realtime.RelativeTime;

public aspect TimedLogging {
	
	public volatile AbsoluteTime start_time, t_time ;
	RelativeTime delta_time;
	public volatile Clock clk = Clock.getRealtimeClock();
	
	// A COMPLETER...










}
