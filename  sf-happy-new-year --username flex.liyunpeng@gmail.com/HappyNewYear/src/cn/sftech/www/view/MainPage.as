package cn.sftech.www.view
{
	import cn.sftech.www.events.ChangePageEvent;
	import cn.sftech.www.model.GameConfig;
	import cn.sftech.www.model.ModelLocator;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class MainPage extends MovieClip
	{
		private var mainPane : MainPane;
		
		private var toPage : uint;
		
		private var _model : ModelLocator = ModelLocator.getInstance();
		
		public function MainPage()
		{
			super();
		}
		
		public function init() : void
		{
			mainPane = new MainPane();
			addChild(mainPane);
			
			mainPane.normalModeBtn.addEventListener(MouseEvent.CLICK,startNoramlGame);
			mainPane.strategyModelBtn.addEventListener(MouseEvent.CLICK,startStrategyGame);
			mainPane.helpBtn.addEventListener(MouseEvent.CLICK,helpGame);
			mainPane.exitBtn.addEventListener(MouseEvent.CLICK,exitGame);
		}
		
		private function leave() : void
		{
			mainPane.normalModeBtn.removeEventListener(MouseEvent.CLICK,startNoramlGame);
			mainPane.strategyModelBtn.removeEventListener(MouseEvent.CLICK,startStrategyGame);
			mainPane.helpBtn.removeEventListener(MouseEvent.CLICK,helpGame);
			mainPane.exitBtn.removeEventListener(MouseEvent.CLICK,exitGame);
			
			removeChild(mainPane);
			mainPane = null;
			var changePageEvent : ChangePageEvent = new ChangePageEvent();
			changePageEvent.data = toPage;
			this.dispatchEvent(changePageEvent);
		}
		
		private function startNoramlGame(event : MouseEvent) : void
		{
			_model.currentGameMode = GameConfig.NORAML_MODEL;
			toPage = ChangePageEvent.TO_DIFFCULTY_PAGE;
			leave();
		}
		
		private function startStrategyGame(event : MouseEvent) : void
		{
			_model.currentGameMode = GameConfig.STRATEGY_MODEL;
			toPage = ChangePageEvent.TO_DIFFCULTY_PAGE;
			leave();
		}
		
		private function helpGame(event : MouseEvent) : void
		{
			toPage = ChangePageEvent.TO_HELP_PAGE;
			leave();
		}
		
		private function exitGame(event : MouseEvent) : void
		{
			toPage = ChangePageEvent.EXIT;
			leave();
		}
	}
}