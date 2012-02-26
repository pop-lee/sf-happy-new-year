package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Test00001 extends Sprite
	{
		public function Test00001()
		{
			super();
			
			
			this.addEventListener(Event.ENTER_FRAME,aaa);
			this.addEventListener(MouseEvent.MOUSE_UP,ccc);
//			var timer : Timer = new Timer(200);
//			timer.addEventListener(TimerEvent.TIMER,bbb);
//			timer.start();
		}
		
		private function aaa(event : Event) : void
		{
			cat.x = this.mouseX - ?;
			cat.y = this.mouseY - ?;
		}
		
//		private function bbb(event : TimerEvent) : void
//		{
//			trace(this.mouseX + "    " + this.mouseY) ;
//		}
		
		private function ccc(event : MouseEvent) : void
		{
			cat.x = this.mouseX - ?;
			cat.y = this.mouseY - ?;
		}
	}
}