package com.value
{
	import com.model.GameLevelModel;
	import com.shared.MySave;

	public class GameValue
	{
		public static var GAME_LEVEL:Vector.<GameLevelModel> = new Vector.<GameLevelModel>();
		
		public static var GAME_SCORE : Number = 0;
		
		public function GameValue()
		{
		}
		
		public static function GAME_LEVEL_DEFINE():void
		{
			for (var i:int = 0; i < MySave.getdata("levelScore").length; i ++)
			{
				/*var gameLevelModel:GameLevelModel;
				if (i < MySave.getdata("levelScore").length)
					gameLevelModel = new GameLevelModel(MySave.getdata("levelScore")[i][0], MySave.getdata("levelScore")[i][1], MySave.getdata("levelScore")[i][2]);
				else
					gameLevelModel = new GameLevelModel(i+1, 0, 0);
				GAME_LEVEL.push(gameLevelModel);*/
				var gameLevelModel:GameLevelModel = new GameLevelModel(MySave.getdata("levelScore")[i][0], MySave.getdata("levelScore")[i][1], MySave.getdata("levelScore")[i][2]);
				GAME_LEVEL.push(gameLevelModel);
			}
		}
		
		public static function getSumScore() : Number
		{
			GAME_SCORE = 0;
			for(var i:int=0; i<GameValue.GAME_LEVEL.length; i++){
				GameValue.GAME_SCORE += (1600-(GameValue.GAME_LEVEL[i].getStep())*4-GameValue.GAME_LEVEL[i].getTime());
			}
			return GAME_SCORE;
		}
	}
}