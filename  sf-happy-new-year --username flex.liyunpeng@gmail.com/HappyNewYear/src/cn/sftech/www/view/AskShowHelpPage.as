package cn.sftech.www.view
{
	import cn.sftech.www.events.CloseTipEvent;
	import cn.sftech.www.model.ModelLocator;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class AskShowHelpPage extends MovieClip
	{
		private var body : AskShowHelp;
		
		private var _model : ModelLocator = ModelLocator.getInstance();
		
		public function AskShowHelpPage()
		{
			super();
			body = new AskShowHelp();
			this.addChild(body);
			
			body.yesBtn.addEventListener(MouseEvent.CLICK,closeShowHelp);
			body.noBtn.addEventListener(MouseEvent.CLICK,showHelp);
		}
		
		private function closeShowHelp(event : MouseEvent) : void{
			body.yesBtn.removeEventListener(MouseEvent.CLICK,closeShowHelp);
			body.noBtn.removeEventListener(MouseEvent.CLICK,showHelp);
			
			if(_model.currentGameMode == 1) {
				_model.showHelp_01 = false;
			} else {
				_model.showHelp_02 = false;
			}
			this.dispatchEvent(new CloseTipEvent());
		}
		
		private function showHelp(event : MouseEvent) : void{
			body.yesBtn.removeEventListener(MouseEvent.CLICK,closeShowHelp);
			body.noBtn.removeEventListener(MouseEvent.CLICK,showHelp);
			
			if(_model.currentGameMode == 1) {
				_model.showHelp_01 = true;
			} else {
				_model.showHelp_02 = true;
			}
			this.dispatchEvent(new CloseTipEvent());
		}
	}
}