package
{
	import flash.display.MovieClip;
	
	public class BaseUI
	{
		private static var roomRow:MovieClip;
		private static var roomInfoSelect:MovieClip;
		
		public function BaseUI()
		{
			
		}
		
		/**
		 * @param Mc : Parent MovieClip Object
		 * @param val : 현시값
		 * @param str : 현시시켜야 할 MovieClip Instance Name앞붙이
		 * @param Maxval : 현시최대자리수
		 * 
		 */		
		public static function showInfo(Mc:MovieClip, val:String, str:String, Maxval:int):void
		{
			var tempP:Array = new Array();
			for (var i:int = 0; i < Maxval; i++)
			{
				tempP.push(Mc[str + i])
			}
			var tempnum:Array = MyMath.NumtoArray(val);
			var len:int = tempnum.length;
			
			if (int(val) == 0)
			{
				for (i = 0; i < Maxval; i++)
				{
					tempP[i].alpha = 0;
				}
				tempP[0].alpha = 1;
				tempP[0].gotoAndStop(1);
				return;
			}
			
			for (i = 0; i < Maxval; i++)
			{
				if (i < len)
				{
					tempP[i].alpha = 1;
					tempP[i].gotoAndStop(tempnum[i] + 1);
				}
				else
				{
					tempP[i].alpha = 0;
				}
			}
		}
		
		/**
		 * 현시시킬 때의 값이 0인경우 전혀 화면에 나타나지 않게 하는 메쏘드
		 * @param Mc : Parent MovieClip Object
		 * @param str : 현시시켜야 할 MovieClip Instance Name앞붙이
		 * @param Maxval : 현시최대자리수
		 */		
		public static function showAlpha(Mc:MovieClip, str:String, Maxval:int):void
		{
			var tempP:Array = new Array();
			for (var i:int = 0; i < Maxval; i++)
			{
				tempP.push(Mc[str + i])
			}

			for (i = 0; i < Maxval; i++)
			{
				tempP[i].alpha = 0;
			}
		}
		
		
	}
}