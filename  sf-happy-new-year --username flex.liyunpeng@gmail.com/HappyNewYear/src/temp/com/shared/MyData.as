package com.shared 
{
	import com.shared.MySave;
	/**
	 * data save
	 * 게임에 필요한 자료기록
	 * @author Hwagn Chol Ju
	 */
	public class MyData extends Object
	{
		public static var _instance:MyData;
		
		public const gameName:String = "CatPuzzle";
		
		public var levelScore:Array = new Array();
		
		private static var levelShared:Array = new Array();;
		
		public function MyData() 
		{
			loadData();
		}
		
		private function loadData():void
		{
			MySave.init(gameName);
			//MySave.clear();
			if (MySave.exist("levelScore"))
			{
				levelScore = MySave.getdata("levelScore");
			}
			else
			{
				levelScore = new Array();
				
				MySave.setdata("levelScore", levelScore);
				MySave.save();
			}
			//cheat();
		}
		
		public static function setLevelScore(levelScore:Array):void
		{
			levelShared = MySave.getdata("levelScore");
			if (levelShared.length == 0)
			{
				levelShared.push(levelScore);
			}
			else 
			{
				for (var i:int = 0; i < levelShared.length; i++)
				{
					if (levelShared[i][0] == levelScore[0])
					{
						for (var j:int = 0; j < 3; j ++)
						{
							levelShared[i][j] = levelScore[j];
						}
					}
					else if ((levelShared.length + 1) == levelScore[0])
					{
						levelShared.push(levelScore);
					}
				}
			}

			MySave.setdata("levelScore", levelShared);
			MySave.save();
		}
		
		public static function levelLength():int
		{
			return MySave.getdata("levelScore").length;
		}
		
		public static function getInstance():MyData
        {
            if (_instance == null)
            {
                _instance = new MyData();
            }
            return _instance;
        }
	}

}