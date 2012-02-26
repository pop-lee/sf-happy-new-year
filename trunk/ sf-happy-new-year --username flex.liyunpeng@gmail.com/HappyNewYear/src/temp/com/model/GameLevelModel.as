package com.model
{
	import com.shared.MyData;
	
	import flashx.textLayout.elements.InlineGraphicElement;

	public class GameLevelModel
	{
		public var time:int;
		public var step:int;
		public var levelNum:int;
		public function GameLevelModel(levelNum:int, time:int, step:int)
		{
			this.levelNum = levelNum;
			this.time = time;
			this.step = step;
		}
		
		public function getLevelNum():int
		{
			return this.levelNum;
		}
		
		public function setLevelNum(levelNum:int):void
		{
			this.levelNum = levelNum;
		}
		
		public function getTime():int
		{
			return this.time;
		}
		
		public function setTime(time:int):void
		{
			this.time = time;
		}
		
		public function getStep():int
		{
			return this.step;
		}
		
		public function setStep(step:int):void
		{
			this.step = step;
		}
		
		public function saveScore():void
		{
			var levelScore:Array = [this.levelNum, this.time, this.step];
			MyData.setLevelScore(levelScore);
		}
		
	}
}