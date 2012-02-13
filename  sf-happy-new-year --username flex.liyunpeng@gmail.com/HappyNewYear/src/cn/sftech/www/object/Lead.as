package cn.sftech.www.object
{
	import cn.sftech.www.effect.base.SFEffectBase;
	import cn.sftech.www.events.KindleEndEvent;
	import cn.sftech.www.view.SFContainer;
	import cn.sftech.www.view.SFMovieClip;
	
	import flash.display.MovieClip;
	import flash.geom.Point;

	public class Lead extends SFMovieClip
	{
//		public var firePane : SFContainer;
		
		public var indexX : uint;
		public var indexY : uint;
		
		private var _coin : Coin;
		
		private var body : MovieClip;
		
		public static const LEAD_SIZE : uint = 50;
		
		public static const WHITE_COLOR : uint = 1;
		public static const YELLOW_COLOR : uint = 2;
		public static const RED_COLOR : uint = 3;
		public static const ORANGE_COLOR : uint = 4;
		public static const GREEN_COLOR : uint = 5;
		
		/**
		 * 出口标记
		 * 顺序依次是左、上、右、下
		 */		
		public var exportArr : Vector.<Boolean> = Vector.<Boolean>([false,false,false,false]);
		
		private var entranceIndex : uint;
		/**
		 * 0为白色
		 * 1为黄色
		 * 2为红色
		 * 3为橙色
		 * 4为绿色
		 */
		private var _currentColorFlag : uint;
		
		private var _angle : uint = 1;
		
		private var _type : uint = 0;
		
		public function Lead()
		{
		}
		
		public function set type(value : uint) : void
		{
			_type = value;
			switch(_type) {
				case 1 : { //左右
					this.body = new Lead1();
					exportArr[0] = true;
					exportArr[2] = true;
				};break;
				case 2 : { //左下
					this.body = new Lead2();
					exportArr[0] = true;
					exportArr[3] = true;
				};break;
				case 3 : { //上右下
					this.body = new Lead3();
					exportArr[1] = true;
					exportArr[2] = true;
					exportArr[3] = true;
				};break;
				case 4 : { //上右下左
					this.body = new Lead4();
					exportArr[0] = true;
					exportArr[1] = true;
					exportArr[2] = true;
					exportArr[3] = true;
				};break;
				case 5 : {
					this.body = new Lead5();
					exportArr[0] = true;
					exportArr[2] = true;
				}
			}
			
			this.body.x = LEAD_SIZE/2;
			this.body.y = LEAD_SIZE/2;
			
			addChild(this.body);
		}
		
		public function get type() : uint
		{
			return _type;
		}
		
		public function set angle(value : uint) : void
		{
			if(value > 4) {
				_angle = 1;
			} else {
				_angle = value;
			}
			
		}
		
		public function get angle() : uint
		{
			return _angle;
		}
		
		public function set coin(obj : Coin) : void
		{
			_coin = obj;
			addChild(_coin);
		}
		
		public function get coin() : Coin
		{
			return _coin;
		}
		
		public function rotationLead(effect : SFEffectBase) : void
		{
			angle++;
			var tempFlag : Boolean = exportArr[exportArr.length-1];
			for(var i : int = exportArr.length-1;i >= 0;i --) {
				if(i < 1) {
					exportArr[i] = tempFlag;
				} else {
					exportArr[i] = exportArr[i-1];
				}
			}
			
			effect.stop(true);
			effect.target = this.body;
			effect.vars.prop("rotation",this.body.rotation+90);
			effect.play();
//			this.rotation += 90;
			
		}
		
		public function colletCoin() : Coin
		{
			if(_coin) {
				removeChild(_coin);
				return _coin;
			} else {
				return null;
			}
		}
		
		public function set currentColorFlag(value : uint) : void
		{
			_currentColorFlag = value;
			this.body.gotoAndStop(_currentColorFlag);
		}
		
		public function get currentColorFlag() : uint
		{
			return _currentColorFlag;
		}
		
//		public function kindleFire(fire : Fire,index : uint) : void
//		{
//			entranceIndex = index;
//			fire.addEventListener(KindleEndEvent.KINDLE_END_EVENT,kindleCenter);
//			fire.kindleTo(new Point(this.x,this.y));
//		}
//		
//		private function kindleCenter(event : KindleEndEvent) : void
//		{
////			var fire : Fire = event.target;
//			event.target.removeEventListener(KindleEndEvent.KINDLE_END_EVENT,kindleCenter);
//			
//			for(var i : int = 0;i < exportArr.length;i++) {
//				//如果出口索引就是入口索引，则跳过；
//				if(i == entranceIndex) continue;
//				if(exportArr[i]) {
//					var toPoint : Point;
//					switch(i) {
//						case 0:{toPoint = new Point(this.x-this.width/2,this.y);};break;
//						case 1:{toPoint = new Point(this.x,this.y-this.height/2);};break;
//						case 2:{toPoint = new Point(this.x+this.width/2,this.y);};break;
//						case 3:{toPoint = new Point(this.x,this.y+this.height/2);};break;
//					}
//					
//					var fire : Fire = new Fire();
//					firePane.addChild(fire);
//					fire.kindleTo(toPoint);
//				}
//			}
//		}
		
	}
}