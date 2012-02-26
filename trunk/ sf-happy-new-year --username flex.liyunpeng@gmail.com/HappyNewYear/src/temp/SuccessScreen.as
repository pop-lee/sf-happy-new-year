package
{
	import com.value.GameValue;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	[SWF(width="480",height="800")]

	
	public class SuccessScreen extends MovieClip
	{
		public var btnGoToMenu:SimpleButton;
		public var btnAgain:SimpleButton;
		public var btnNext:SimpleButton;
		private var stageNumber:int;
		private var fialTime:int;
		private var fialCounter:int;
		public var timeSymbol:TimeSymbol;
		public var stageNumSymbol:NumberSymbol;
		public var counterNumSymbol:CounterSymbol;
		
		private var scoreTimeUP:ScoreSymbol;

		public function SuccessScreen()
		{
			Mouse.show();
			
			timeSymbol = new TimeSymbol();
			stageNumSymbol = new NumberSymbol();
			counterNumSymbol = new CounterSymbol();
			btnGoToMenu.addEventListener( MouseEvent.CLICK, onClickGoToFirst, false, 0, true );
			btnAgain.addEventListener( MouseEvent.CLICK, onClickAgain, false, 0, true );
			btnNext.addEventListener( MouseEvent.CLICK, onClickNext, false, 0, true );
		}
	
		public function init():void
		{
			var str:String = "";
			var minute:int;
			var second:int;
			minute = int(fialTime/60);
			second = (fialTime%60);
			
			if (minute < 10)
				str += "0" + minute.toString();
			else
				str += minute.toString();
			if (second < 10)
				str += "0" + second.toString();
			else
				str += second.toString();
			BaseUI.showInfo(timeSymbol, str, "time", 4);
			timeSymbol.x = 128;
			timeSymbol.y = 317;
			addChild(timeSymbol);
			BaseUI.showInfo(stageNumSymbol, stageNumber.toString(), "num", 3);
			if(int(stageNumber/10)>0){
				stageNumSymbol.x=134;
			}else{
				stageNumSymbol.x=150;
			}
			if(int(stageNumber/100)>0){
				stageNumSymbol.x=112;
			}
			stageNumSymbol.y=245;
			addChild(stageNumSymbol);
			BaseUI.showInfo(counterNumSymbol, fialCounter.toString(), "counterNum", 3);
			counterNumSymbol.x=350;
			counterNumSymbol.y=317;
			addChild(counterNumSymbol);
			
		}
		public function setFialTime(time:int):void
		{
			fialTime = time;
		}
		public function setFialCounter(counter:int):void
		{
			fialCounter = counter;
		}
		public function setStageNumber(stageNum:int):void
		{
			stageNumber = stageNum;
			init();
			
			scoreTimeUP = new ScoreSymbol();
			scoreTimeUP.x = 226;
			scoreTimeUP.y = 40;
			
//			var scoreSum:int;
//			for(var i:int=0; i<GameValue.GAME_LEVEL.length; i++){
//				scoreSum += (1600-(GameValue.GAME_LEVEL[i].getStep())*4-GameValue.GAME_LEVEL[i].getTime());
//			}
			
			BaseUI.showInfo(scoreTimeUP, GameValue.GAME_SCORE.toString(), "scoreNum", 6);
			addChild(scoreTimeUP);
		}
		public function getStageNumber():int
		{
			return stageNumber;
		}
		public function onClickGoToFirst( event:Event ):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			
			removeChild(timeSymbol);
			removeChild(stageNumSymbol);
			removeChild(counterNumSymbol);
			timeSymbol = null;
			stageNumSymbol = null;
			counterNumSymbol = null;
			dispatchEvent( new NavigationEvent( NavigationEvent.TOMENU ) );
		}
		public function onClickAgain( event:Event ):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			
			removeChild(timeSymbol);
			removeChild(stageNumSymbol);
			removeChild(counterNumSymbol);
			timeSymbol = null;
			stageNumSymbol = null;
			counterNumSymbol = null;
			dispatchEvent( new NavigationEvent( NavigationEvent.SELECTLEVEL ) );
		}
		public function onClickNext( event:Event ):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			
			if(stageNumber<108){
				stageNumber = stageNumber+1;
			}
			removeChild(timeSymbol);
			removeChild(stageNumSymbol);
			removeChild(counterNumSymbol);
			timeSymbol = null;
			stageNumSymbol = null;
			counterNumSymbol = null;
			dispatchEvent( new NavigationEvent( NavigationEvent.SELECTLEVEL ) );
		}

	}
}