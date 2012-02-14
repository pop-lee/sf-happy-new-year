package cn.sftech.www.object
{
	import cn.sftech.www.events.KindleEndEvent;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Fireworks extends MovieClip
	{
		private var body : MovieClip;
		
		public function Fireworks()
		{
			super();
		}
		
		public function set type(value : uint) : void
		{
			if(body) {
				removeChild(body);
			}
			
			switch(value){
				case 1:{body = new Fireworks1();};break;
				case 2:{body = new Fireworks2();};break;
				case 3:{body = new Fireworks3();};break;
				case 4:{body = new Fireworks4();};break;
				case 5:{body = new Fireworks5();};break;
			}
			
			addChild(body);
		}
		
		public function kindleFireworks() : void
		{
			this.body.addEventListener(Event.ENTER_FRAME,enterframeHandle);
		}
		
		private function enterframeHandle(event : Event) : void
		{
			if(this.body.currentFrame == this.body.totalFrames) {
				this.body.removeEventListener(Event.ENTER_FRAME,enterframeHandle);
				this.dispatchEvent(new KindleEndEvent());
			} else {
				this.body.nextFrame();
			}
		}
		
	}
}