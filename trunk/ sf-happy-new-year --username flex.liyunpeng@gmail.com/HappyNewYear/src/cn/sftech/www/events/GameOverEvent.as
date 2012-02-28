package cn.sftech.www.events
{
	import flash.events.Event;
	
	public class GameOverEvent extends Event
	{
		public static const GAME_OVER_EVENT : String = "gameOverEvent";
		
		public var data : int = 0;
		
		public function GameOverEvent()
		{
			super(GAME_OVER_EVENT);
		}
	}
}