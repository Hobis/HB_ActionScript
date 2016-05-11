package hbworks.whats.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Hobis
	 */
	public class ScrollBarEvent extends Event 
	{
		
		public function ScrollBarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
		public static const SCROLL_UP:String = 'scrollUp';
		public static const SCROLL_DOWN:String = 'scrollDown';		
	}

}