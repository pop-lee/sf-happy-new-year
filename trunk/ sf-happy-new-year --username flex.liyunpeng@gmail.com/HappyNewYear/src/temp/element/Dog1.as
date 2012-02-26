package element
{
	import flash.display.MovieClip;
	
	public class Dog1 extends Character
	{
		public var dog1Frame:MovieClip;
		
		public function Dog1(main:PlayScreen, posX:int, posY:int, length:int, direction:int, kind:int, nameIdx:int)
		{
			super(main, posX, posY, length, direction, kind, nameIdx);
		}
		
		override public function animationStop():void
		{
			dog1Frame.gotoAndStop(10);			
		}
		
		override public function animationPlay():void
		{
			dog1Frame.gotoAndPlay(10);			
		}
	}
}