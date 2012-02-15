package cn.sftech.www.view
{
	import flash.display.MovieClip;
	import flash.filters.GlowFilter;
	
	public class LightBox extends MovieClip
	{
		private var lightArr : Vector.<Light> = new Vector.<Light>();
		
		public function LightBox()
		{
			super();
			init();
		}
		
		private function init() : void
		{
			for(var i : int = 0;i < 10;i++) {
				var light : Light = new Light();
				light.x = i*light.width;
				lightArr.push(light);
				this.addChild(light);
			}
		}
		
		public function set process(value : Number) : void
		{
			for(var i : int = 0;i < 10;i++) {
				if(i < Math.floor(value*10)) { //点亮
					lightArr[i].lightMask.gotoAndStop(2);
					lightArr[i].lightMask.filters = [new GlowFilter()];
				} else { //熄灭
					lightArr[i].lightMask.gotoAndStop(1);
					lightArr[i].lightMask.filters = null;
				}
			}
		}
	}
}