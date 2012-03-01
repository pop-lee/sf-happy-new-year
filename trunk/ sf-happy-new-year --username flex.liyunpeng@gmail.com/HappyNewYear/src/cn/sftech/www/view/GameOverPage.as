package cn.sftech.www.view
{
	import cn.sftech.www.events.GameOverEvent;
	
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
			body.exitBtn.addEventListener(MouseEvent.CLICK,exitGame);
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
			var gameOverEvent:GameOverEvent = new GameOverEvent();
			gameOverEvent.data = 1;
			this.dispatchEvent(gameOverEvent);
		}
		
		private function restartGame(event : MouseEvent) : void
		{
			var gameOverEvent:GameOverEvent = new GameOverEvent();
			gameOverEvent.data = 2;
			this.dispatchEvent(gameOverEvent);
		}
		
		private function exitGame(event : MouseEvent) : void
		{
			var gameOverEvent:GameOverEvent = new GameOverEvent();
			gameOverEvent.data = 3;
			this.dispatchEvent(gameOverEvent);
		}
		
		private function backHandle(event : MouseEvent) : void
		{
			var gameOverEvent:GameOverEvent = new GameOverEvent();
			gameOverEvent.data = 4;
			this.dispatchEvent(gameOverEvent);
		}
	}
}