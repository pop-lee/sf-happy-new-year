package
{
	import com.shared.MyData;
	import com.shared.MySave;
	import com.value.GameValue;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.System;
	import flash.ui.Mouse;
	
	[SWF(width="480",height="800")]
	public class MenuScreen extends MovieClip
	{
		public var btnPreview:SimpleButton;
		public var btnFirst:SimpleButton;
		public var btnForward:SimpleButton;
		private var stageNumber:int;
		private var levelSymBol:MovieClip;
		public var counterSumNumSymbol:ScoreSymbol;
		
		
		/**
		 * Level현시 부분에서 제일 첫번째 Level의 실지 Level번호 
		 */		
		private var levelFirstIdx:int = 0;
		
		public function MenuScreen()
		{
			Mouse.show();

			counterSumNumSymbol = new ScoreSymbol();
//			btnStart.addEventListener( MouseEvent.CLICK, onSelectLevel, false, 0, true );
			btnPreview.addEventListener( MouseEvent.CLICK, onClickPreview, false, 0, true );
			btnFirst.addEventListener( MouseEvent.CLICK, onClickFirst, false, 0, true );
			btnForward.addEventListener( MouseEvent.CLICK, onClickForward, false, 0, true );
			levelFirstIdx = int(GameValue.GAME_LEVEL.length / 12) * 12;
			if (levelFirstIdx==0)
			{
				btnPreview.visible = false;
			}else if(levelFirstIdx==96){
				btnForward.visible = false;
			}
			
			selectLevelViews(levelFirstIdx);
			
//			var scoreSum:int;
//			
//			
//			for(var i:int=0; i<GameValue.GAME_LEVEL.length; i++){
//				scoreSum += (1600-(GameValue.GAME_LEVEL[i].getStep())*4-GameValue.GAME_LEVEL[i].getTime());
//			}
			
			BaseUI.showInfo(counterSumNumSymbol, GameValue.GAME_SCORE.toString(), "scoreNum", 6);
			counterSumNumSymbol.x = 230;
			counterSumNumSymbol.y = 31;
			addChild(counterSumNumSymbol);
		}
		
		private function selectLevelViews(levelIdx:int):void
		{
			for (var i:int = 0; i < 4; i ++)
			{
				for (var j:int = 0; j < 3; j ++)
				{
					//levelSymBol = null;
					
					levelSymBol = new LevelSymbol();
					
					levelSymBol.x = 40 + j * 140;
					levelSymBol.y = 100+ i * 150;
					
					levelSymBol.name = (levelIdx + 1).toString();
					
					levelSymBol.addEventListener(MouseEvent.CLICK, onSelectLevel);
					
					if (levelIdx < GameValue.GAME_LEVEL.length)
					{
						var str:String = "";
						var minute:int;
						var second:int;
						
						minute = int(GameValue.GAME_LEVEL[levelIdx].getTime()/60);
						second = (GameValue.GAME_LEVEL[levelIdx].getTime()%60);
						
						if (minute < 10)
							str += "0" + minute.toString();
						else
							str += minute.toString();
						if (second < 10)
							str += "0" + second.toString();
						else
							str += second.toString();
						BaseUI.showInfo(levelSymBol, str, "time", 4);
						
						
						var levelStepStr:String = "";
						var levelStep:int = GameValue.GAME_LEVEL[levelIdx].getStep();
						if ( levelStep < 10 )
						{
							levelStepStr = "0" + "0" + levelStep.toString();
						}
						else if (levelStep < 100)
						{
							levelStepStr = "0" + levelStep.toString();
						}
						else
						{
							levelStepStr = levelStep.toString();
						}
						
						BaseUI.showInfo(levelSymBol, levelStepStr, "score", 3);
					}
						
					else 
					{
						levelSymBol["colon"].alpha = 0;
						
						if (levelIdx > GameValue.GAME_LEVEL.length)
							levelSymBol.gotoAndStop(2);
						
						if (levelIdx == GameValue.GAME_LEVEL.length)
						{
							BaseUI.showAlpha(levelSymBol, "time", 4);
							BaseUI.showAlpha(levelSymBol, "score", 3);
						}
					}
					
					if (getChildByName((levelIdx-11).toString()) != null)
					{
						this.removeChild(getChildByName((levelIdx - 11).toString()));
					}
					if (getChildByName((levelIdx+13).toString()) != null)
					{
						this.removeChild(getChildByName((levelIdx + 13).toString()));
					}
					
					var levelNumStr:String = "";
					if ( levelIdx+1 < 10 )
					{
						levelNumStr = "0" + "0" + (levelIdx+1).toString();
					}
					else if (levelIdx+1 < 100)
					{
						levelNumStr = "0" + (levelIdx+1).toString();
					}
					else
					{
						levelNumStr = (levelIdx+1).toString();
					}
					
					
					BaseUI.showInfo(levelSymBol, levelNumStr, "levelNum", 3);
					addChild(levelSymBol);
					
					levelIdx ++;
				}
			}
			trace(this.numChildren);
		}
		
		public function getStageNumber():int
		{
			return stageNumber;
		}
		
		public function onSelectLevel( event:Event ):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			
			if (int(event.target.parent.name) == 1)
			{
				/*if (GameValue.GAME_LEVEL.length == 0)
				{*/
					dispatchEvent( new NavigationEvent( NavigationEvent.FIRST_LOAD ));
				/*}*/
			}
			else if (GameValue.GAME_LEVEL.length + 1 >= int(event.target.parent.name))
			{
				stageNumber = int(event.target.parent.name);
				trace("Level" + stageNumber.toString());
				levelSymBol = null;
				dispatchEvent( new NavigationEvent( NavigationEvent.SELECTLEVEL ) );
			}
			else 
			{
				trace("Not Selected");
			}
			System.gc();
		}
		public function onClickPreview( event:Event ):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			/*stageNumber = 3;
			dispatchEvent( new NavigationEvent( NavigationEvent.SELECTLEVEL ) );*/
			if (levelFirstIdx > 0 )
			{
				levelFirstIdx -= 12;
				selectLevelViews(levelFirstIdx);
				
			}
			if(levelFirstIdx<=0)
			{
				btnPreview.visible = false;
			}
			if(levelFirstIdx < 96){
				btnForward.visible = true;
				
			}
			System.gc();
		}
		public function onClickFirst( event:Event ):void
		{
			dispatchEvent( new NavigationEvent( NavigationEvent.TOFIRST ) );
		}
		public function onClickForward( event:Event ):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			
			if (levelFirstIdx < 96)
			{
				levelFirstIdx += 12;
				selectLevelViews(levelFirstIdx);
				
			}
			if(levelFirstIdx>=96){
				btnForward.visible = false;
			}
			if(levelFirstIdx > 0){
				btnPreview.visible = true;
			}
			System.gc();
		}
	}
}