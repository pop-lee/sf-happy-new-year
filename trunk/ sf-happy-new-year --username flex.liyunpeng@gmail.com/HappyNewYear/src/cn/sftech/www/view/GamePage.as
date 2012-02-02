package cn.sftech.www.view
{
	public class GamePage extends SFContainer
	{
		private var gamePane : GamePane;
		
		public function GamePage()
		{
			super();
		}
		
		public function init() : void
		{
			gamePane = new GamePane();
			gamePane.percentWidth = 100;
			gamePane.percentHeight = 100;
			gamePane.backgroundAlpha = 0;
			addChild(gamePane);
			gamePane.init();
		}
	}
}