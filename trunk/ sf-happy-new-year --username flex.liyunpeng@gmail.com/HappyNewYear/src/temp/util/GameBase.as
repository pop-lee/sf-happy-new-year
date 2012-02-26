package util
{
	public class GameBase
	{
		public var CAT:int = 1;
		public var DOG1:int = 2;
		public var DOG2:int = 3;
		public var DOG3:int = 4;
		public var DOG4:int = 5;
		
		public var HORIZONTAL:int = 0;
		public var VERTICAL:int = 1;
		
		public var UNSETMAP:int = 0;
		public var SETMAP:int = 1	
			
		public var LEFT:int = 0;
		public var RIGHT:int = 1;
		public var TOP:int = 2;
		public var BOTTOM:int = 3;
		
		public var SUCCESS:int = 0;
		public var FAILED:int = 1;
		
		public var MSG_START:int = 0;
		public var MSG_CATMOVE:int = 1;
		public var MSG_SLEEP:int = 2;
		
		public static var _instance:GameBase;
		
		public static function getInstance():GameBase
		{
			if(_instance == null)
			{
				_instance = new GameBase();
			}
			return _instance;
		}
		
		public static function clear():void
		{
			_instance = null;
		}
	}
}