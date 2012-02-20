package cn.sftech.www.view
{
	import cn.sftech.www.events.ChangePageEvent;
	import cn.sftech.www.model.GameConfig;
	import cn.sftech.www.model.ModelLocator;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class DifficultyPage extends MovieClip
	{
		private var difficultyPane : DifficultyPane;
		
		private var toPage : uint;
		
		private var _model : ModelLocator = ModelLocator.getInstance();
		
		public function DifficultyPage()
		{
			super();
		}
		
		public function init() : void
		{
			difficultyPane = new DifficultyPane();
			addChild(difficultyPane);
			
			difficultyPane.easyBtn.addEventListener(MouseEvent.CLICK,easyGame);
			difficultyPane.noramlBtn.addEventListener(MouseEvent.CLICK,normalGame);
			difficultyPane.hardBtn.addEventListener(MouseEvent.CLICK,hardGame);
			difficultyPane.backBtn.addEventListener(MouseEvent.CLICK,backGame);
		}
		
		private function leave() : void
		{
			difficultyPane.easyBtn.removeEventListener(MouseEvent.CLICK,easyGame);
			difficultyPane.noramlBtn.removeEventListener(MouseEvent.CLICK,normalGame);
			difficultyPane.hardBtn.removeEventListener(MouseEvent.CLICK,hardGame);
			difficultyPane.backBtn.removeEventListener(MouseEvent.CLICK,backGame);
			
			removeChild(difficultyPane);
			difficultyPane = null;
			var changePageEvent : ChangePageEvent = new ChangePageEvent();
			changePageEvent.data = toPage;
			this.dispatchEvent(changePageEvent);
		}
		
		private function easyGame(event : MouseEvent) : void
		{
			_model.currentDifficultyMode = GameConfig.EASY_TYPE;
			toPage = ChangePageEvent.TO_GAME_PAGE;
			leave();
		}
		
		private function normalGame(event : MouseEvent) : void
		{
			_model.currentDifficultyMode = GameConfig.NORMAL_TYPE;
			toPage = ChangePageEvent.TO_GAME_PAGE;
			leave();
		}
		
		private function hardGame(event : MouseEvent) : void
		{
			_model.currentDifficultyMode = GameConfig.HARD_TYPE;
			toPage = ChangePageEvent.TO_GAME_PAGE;
			leave();
		}
		
		private function backGame(event : MouseEvent) : void
		{
			toPage = ChangePageEvent.TO_MAIN_PAGE;
			leave();
		}
	}
}
