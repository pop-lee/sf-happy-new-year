package cn.sftech.www.object
{
	import cn.sftech.www.view.SFMovieClip;
	
	import flash.display.MovieClip;
	
	public class Coin extends SFMovieClip
	{
		private var body : MovieClip;
		
		public var coinScore : uint;
		
		public function Coin()
		{
			super();
		}
		
		public function set type(value : uint) : void
		{
			if(body) {
				removeChild(body);
			}
			
			switch(value){
				case 1:{body = new Coin1();coinScore = 1;};break;
				case 2:{body = new Coin2();coinScore = 2;};break;
				case 3:{body = new Coin5();coinScore = 5;};break;
				case 4:{body = new Coin10();coinScore = 10;};break;
			}
			
			addChild(body);
		}
	}
}