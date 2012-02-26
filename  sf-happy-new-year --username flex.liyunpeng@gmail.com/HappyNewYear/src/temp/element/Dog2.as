package element
{
	import flash.display.MovieClip;
	
	public class Dog2 extends Character
	{
		public var dog2Frame:MovieClip;
		
		public function Dog2(main:PlayScreen, posX:int, posY:int, length:int, direction:int, kind:int, nameIdx:int)
		{
			super(main, posX, posY, length, direction, kind, nameIdx);
		}
		
		override public function animationStop():void
		{
			dog2Frame.gotoAndStop(10);
		}
		
		override public function animationPlay():void
		{
			dog2Frame.gotoAndPlay(10);
		}
	}
}