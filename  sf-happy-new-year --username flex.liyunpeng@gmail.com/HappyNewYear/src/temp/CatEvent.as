package  
{
	import flash.events.Event;
	public class CatEvent extends Event 
	{
		public static const SUCCESS:String = "success";
		public static const TIMEUP:String = "timeup";
		
		public function CatEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) 
		{ 
			super( type, bubbles, cancelable );
			
		} 
		
		public override function clone():Event 
		{ 
			return new CatEvent( type, bubbles, cancelable );
		} 
		
		public override function toString():String 
		{ 
			return formatToString( "AvatarEvent", "type", "bubbles", "cancelable", "eventPhase" ); 
		}
	}
}