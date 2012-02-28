package cn.sftech.www.view
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class GameOverPage extends MovieClip
	{
		private var body : GameOverPane;
		
		public function GameOverPage()
		{
			super();
			
			body = new GameOverPane();
			body.submitScroeBtn.addEventListener(MouseEvent.CLICK,submitScroe);
			body.restarGameBtn.addEventListener(MouseEvent.CLICK,restartGame);
			body.backBtn.addEventListener(MouseEvent.CLICK,backHandle);
			this.addChild(body);
		}
		
		public function set type(value : int) : void
		{
			if(value == 2) {
				body.title.gotoAndPlay(2);
			} else {
				body.title.gotoAndPlay(1);
			}
		}
		
		private function submitScroe(event : MouseEvent) : void
		{
			
		}
		
		private function restartGame(event : MouseEvent) : void
		{
			
		}
		
		private function backHandle(event : MouseEvent) : void
		{
			
		}
	}
}