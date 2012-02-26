package cn.sftech.www.view
{
	import cn.sftech.www.events.CloseTipEvent;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class PausePage extends MovieClip
	{
		private var body : PausePane;
		
		public function PausePage()
		{
			super();
			body = new PausePane();
			this.addChild(body);
			
			body.backBtn.addEventListener(MouseEvent.CLICK,backGame);
		}
		
		private function backGame(event : MouseEvent) : void
		{
			body.backBtn.removeEventListener(MouseEvent.CLICK,backGame);
			this.removeChild(body);
			body = null
			
			this.dispatchEvent(new CloseTipEvent());
		}
	}
}