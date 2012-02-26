package cn.sftech.www.events
{
	import flash.events.Event;
	
	public class CloseTipEvent extends Event
	{
		public static const CLOSE_TIP_EVENT : String = "closeTipEvent";
		
		public function CloseTipEvent()
		{
			super(CLOSE_TIP_EVENT);
		}
	}
}