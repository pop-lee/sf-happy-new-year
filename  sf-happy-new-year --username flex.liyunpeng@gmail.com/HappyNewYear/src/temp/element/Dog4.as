package element
{
	import flash.display.MovieClip;
	
	public class Dog4 extends Character
	{
		public var dog4Frame1:MovieClip;
		public var dog4Frame2:MovieClip;
		public var dog4Frame3:MovieClip;
		
		public function Dog4(main:PlayScreen, posX:int, posY:int, length:int, direction:int, kind:int, nameIdx:int)
		{
			super(main, posX, posY, length, direction, kind, nameIdx);
		}
		
		override public function animationStop():void
		{
			dog4Frame1.gotoAndStop(10);
			dog4Frame2.gotoAndStop(10);
			dog4Frame3.gotoAndStop(10);
		}
		
		override public function animationPlay():void
		{
			dog4Frame1.gotoAndPlay(10);
			dog4Frame2.gotoAndPlay(10);
			dog4Frame3.gotoAndPlay(10);
		}
	}
}