package
{
	import com.value.GameValue;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	[SWF(width="480",height="800")]
	public class FaildScreen extends MovieClip
	{
		public var btnGoToMenu:SimpleButton;
		public var btnAgain:SimpleButton;
		private var stageNumber:int;
		public var stageNumSymbol:NumberSymbol;
		
		private var scoreTimeUP:ScoreSymbol;

		public function FaildScreen()
		{
			Mouse.show();
			stageNumSymbol = new NumberSymbol();
			btnGoToMenu.addEventListener( MouseEvent.CLICK, onClickGoToFirst, false, 0, true );
			btnAgain.addEventListener( MouseEvent.CLICK, onClickAgain, false, 0, true );
		}
		public function init():void
		{
			BaseUI.showInfo(stageNumSymbol, stageNumber.toString(), "num", 3);
			if(int(stageNumber/10)>0){
				stageNumSymbol.x=138;
			}else{
				stageNumSymbol.x=162;
			}
			if(int(stageNumber/100)>0){
				stageNumSymbol.x=114;
			}
			stageNumSymbol.y=275;
			addChild(stageNumSymbol);
		}
		public function setStageNumber(stageNum:int):void
		{
			stageNumber = stageNum;
			init();
			scoreTimeUP = new ScoreSymbol();
			scoreTimeUP.x = 238;
			scoreTimeUP.y = 31.5;
			
//			var scoreSum:int;
//			for(var i:int=0; i<GameValue.GAME_LEVEL.length; i++){
//				scoreSum += (1600-(GameValue.GAME_LEVEL[i].getStep())*4-GameValue.GAME_LEVEL[i].getTime());
//			}
			
			BaseUI.showInfo(scoreTimeUP, GameValue.GAME_SCORE.toString(), "scoreNum", 6);
			addChild(scoreTimeUP);
		}
		public function onClickGoToFirst( event:Event ):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			removeChild(stageNumSymbol);
			stageNumSymbol = null;
			dispatchEvent( new NavigationEvent( NavigationEvent.TOMENU ) );
		}
		public function onClickAgain( event:Event ):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			removeChild(stageNumSymbol);
			stageNumSymbol = null;
			dispatchEvent( new NavigationEvent( NavigationEvent.SELECTLEVEL ) );
		}
	}
}