package cn.sftech.www.view
{
	import cn.sftech.www.events.ChangePageEvent;

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
			gamePane.addEventListener(ChangePageEvent.CHANGE_PAGE_EVENT,changePageHandle);
			addChild(gamePane);
			gamePane.init();
		}
		
		private function changePageHandle(event : ChangePageEvent):void
		{
			var changePageEvent : ChangePageEvent = new ChangePageEvent();
			changePageEvent.data = event.data;
			this.dispatchEvent(changePageEvent);
		}
	}
}