package  
{
	import flash.events.Event;
	public class NavigationEvent extends Event 
	{
		public static const START:String = "start";
		public static const SELECTLEVEL:String = "selectlevel";
		public static const TOFIRST:String = "tofirst";
		public static const TOMENU:String = "tomenu";
		
		public static const FIRST_LOAD:String = "firstLoad";
		
		public function NavigationEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) 
		{ 
			super( type, bubbles, cancelable );
			
		} 
		
		public override function clone():Event 
		{ 
			return new NavigationEvent( type, bubbles, cancelable );
		} 
		
		public override function toString():String 
		{ 
			return formatToString( "NavigationEvent", "type", "bubbles", "cancelable", "eventPhase" ); 
		}
	}
}