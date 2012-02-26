package element
{
	import flash.display.MovieClip;
	
	public class Dog3 extends Character
	{
		public var dog3Frame:MovieClip;
		
		public function Dog3(main:PlayScreen, posX:int, posY:int, length:int, direction:int, kind:int, nameIdx:int)
		{
			super(main, posX, posY, length, direction, kind, nameIdx);
		}
		
		override public function animationStop():void
		{
			dog3Frame.gotoAndStop(10);
		}
		
		override public function animationPlay():void
		{
			dog3Frame.gotoAndPlay(10);
		}
	}
}