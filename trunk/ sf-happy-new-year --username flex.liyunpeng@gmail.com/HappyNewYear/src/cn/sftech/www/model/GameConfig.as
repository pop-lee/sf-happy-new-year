package cn.sftech.www.model
{
	public class GameConfig
	{
		/**
		 * 烟火燃烧速度（单位：秒）
		 */		
		public static const KINDLE_SPEED : Number = 0.02;
		
		public static const NORAML_MODEL : uint = 1;
		
		public static const STRATEGY_MODEL : uint = 2;
		
		public static const HARD_TYPE : uint = 3;
		
		public static const NORMAL_TYPE : uint = 2;
		
		public static const EASY_TYPE : uint = 1;
		
		public static const CRACKER_SCORE : uint = 100;
		
		public var mapDataRes : Array = [
			//				[3,1,1,1,1,1],
			//				[3,1,1,1,2,1],
			//				[2,2,2,4,1,2],
			//				[1,1,1,1,1,2],
			//				[2,2,2,1,3,2],
			//				[4,4,1,2,1,2],
			//				[1,1,2,1,2,2],
			//				[2,1,2,1,2,3],
			//				[1,3,1,1,2,1]
			[
				[4,1,4,2,2,1],
				[1,2,1,4,3,1],
				[1,1,1,1,2,1],
				[1,1,2,1,2,1],
				[2,2,2,2,1,1],
				[1,1,1,1,1,1],
				[1,1,1,1,2,2],
				[1,1,2,3,2,3],
				[1,3,1,1,2,1]
			],
			[
				[1,1,1,1,1,1],
				[2,1,2,1,1,2],
				[1,3,1,1,2,1],
				[2,2,1,1,4,1],
				[4,1,4,2,2,1],
				[1,2,1,4,2,1],
				[1,1,1,1,4,1],
				[1,1,2,1,2,1],
				[1,1,1,2,2,1],
			]
		];
		
		public var leadAngleArrRes : Array = [
			//				[1,1,1,1,1,1],
			//				[1,1,1,1,1,1],
			//				[3,1,4,1,2,1],
			//				[1,2,2,2,2,1],
			//				[1,3,2,2,1,1],
			//				[1,1,1,3,2,3],
			//				[1,1,4,1,2,1],
			//				[3,1,2,1,1,1],
			//				[1,1,1,1,1,1]
			
			[
				[3,4,3,1,2,2],
				[3,1,3,3,1,2],
				[3,3,3,1,1,1],
				[3,2,3,2,1,1],
				[4,1,4,1,1,2],
				[3,2,4,2,1,1],
				[3,1,4,3,1,4],
				[3,1,2,3,3,4],
				[3,4,1,1,2,1]
			],
			[
				[3,2,4,2,1,3],
				[3,1,2,1,2,1],
				[2,2,1,3,2,1],
				[3,2,3,2,1,1],
				[3,4,3,1,4,1],
				[3,1,3,3,4,1],
				[1,1,2,1,1,1],
				[3,2,3,1,3,1],
				[1,1,1,2,1,1]
			]
		];
		
		public function GameConfig()
		{
		}
	}
}