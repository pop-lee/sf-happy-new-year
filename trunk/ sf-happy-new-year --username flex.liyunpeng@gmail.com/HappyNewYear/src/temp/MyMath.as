package
{
	public class MyMath
	{
		
		public function MyMath() 
		{
			
		}
		
		/**
		 * 입력파라메터 Int형의 값의 매 자리수자를 성원으로 하는 배렬을 되돌리는 함수 
		 * @param num
		 * @return Array
		 */
		public static function NumtoArray(num:String):Array 
		{
			var str:String = String(num);
			var len:int = str.length;
			var i:int = 0;
			var array:Array = new Array;
			for (i; i < len; i++) 
			{
				array.push(int(str.charAt(i)));
			}
			
			return array;
		}
		
		
	}
}