package util
{
	import flash.display.MovieClip;

	public class CatMessage extends MovieClip
	{
		private var msgCount:Array = new Array(3, 15, 5);
				
		public function CatMessage()
		{
		}
		public function setMessage(msgKind:int):void
		{
			var msgStart:int = 0;
			var i:int = 0;
			while(i<msgKind)
			{
				msgStart += msgCount[i];
				i++;
			}
			var msgIndex:int = msgStart + int((1000 * Math.random())%msgCount[msgKind]);			
			this.gotoAndStop(msgIndex + 1);
		}
	}
}