package
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	[SWF(width="480",height="800")]
	public class FirstScreen extends MovieClip
	{
		public var btnStart:SimpleButton;
		
		public var btnSound:MovieClip;
		public var btnBGM:MovieClip;

		public function FirstScreen()
		{
			Mouse.show();
			btnStart.addEventListener( MouseEvent.CLICK, onClickStart, false, 0, true );
			
			btnSound.addEventListener( MouseEvent.CLICK, soundEffectControl, false, 0, true );
			btnBGM.addEventListener( MouseEvent.CLICK, bgmControl, false, 0, true );
			if (GameSoundObject.BTN_FLG == true)
				btnSound.gotoAndStop(1);
			else
				btnSound.gotoAndStop(2);
			
			if (GameSoundObject.BGM_FLG == true)
				btnBGM.gotoAndStop(1);
			else
				btnBGM.gotoAndStop(2);
		}
		public function onClickStart( event:Event ):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			dispatchEvent( new NavigationEvent( NavigationEvent.START ) );
		}
		
		public function bgmControl(event:MouseEvent ):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			switch (GameSoundObject.BGM_FLG)
			{
				case true:
					GameSoundObject.BGM_FLG = false;
					GameSoundObject.BACKGROUND_MUSIC.setVolum(0);
					btnBGM.gotoAndStop(2);
					break;
				case false:
					GameSoundObject.BGM_FLG = true;
					GameSoundObject.BACKGROUND_MUSIC.setVolum(1);
					btnBGM.gotoAndStop(1);
					break;
			}
		}
		
		public function soundEffectControl(event:MouseEvent ):void
		{
			if (GameSoundObject.BTN_FLG == false)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			switch (GameSoundObject.BTN_FLG)
			{
				case true:
					GameSoundObject.BTN_FLG = false;
					btnSound.gotoAndStop(2);
					break;
				case false:
					GameSoundObject.BTN_FLG = true;
					btnSound.gotoAndStop(1);
					break;
			}
		}
	}
}