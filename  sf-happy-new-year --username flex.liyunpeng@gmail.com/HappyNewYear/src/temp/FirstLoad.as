package
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	[SWF(width="480",height="800")]
	public class FirstLoad extends MovieClip
	{
		public var btnAgree:SimpleButton;
		
		public function FirstLoad()
		{
			btnAgree.addEventListener(MouseEvent.CLICK, menuEvent);
		}
		
		private function menuEvent(event:MouseEvent):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			dispatchEvent( new NavigationEvent( NavigationEvent.TOFIRST ) );
		}
		
	}
}