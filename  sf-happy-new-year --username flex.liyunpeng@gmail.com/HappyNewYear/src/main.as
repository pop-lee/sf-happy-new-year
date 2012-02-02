package
{
	import cn.sftech.www.effect.base.SFEffectBase;
	import cn.sftech.www.effect.viewStackEffect.SFViewStackGradientEffect;
	import cn.sftech.www.event.SFInitializeDataEvent;
	import cn.sftech.www.events.ChangePageEvent;
	import cn.sftech.www.util.DataManager;
	import cn.sftech.www.view.GamePage;
	import cn.sftech.www.view.SFApplication;
	import cn.sftech.www.view.SFLogo;
	import cn.sftech.www.view.SFViewStack;
	
	import com.greensock.data.TweenLiteVars;
	import com.qq.openapi.MttService;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	[SWF(width="480",height="800")]
	public class main extends SFApplication
	{
		public function main()
		{
			
		}
		
		private var vs : SFViewStack;
		
//		private var mainPage : MainPage;
		
		private var gamePage : GamePage;
		
//		private var helpPage : HelpPage;
		
		private var initLock : Boolean = false;
		
		private var logo : SFLogo;
		//是否第一次游戏标记		
//		private var firstFlag : Boolean = true;
		
		override protected function init():void
		{
			if(initLock) {
				return;
			} else {
				initLock = true;
			}
			
			logo = new SFLogo();
			logo.width = this.width;
			logo.height = this.height;
			addChild(logo);
			
			MttService.initialize(root, "D5FE393C02DB836FFDE413B8794056ED","941");
			MttService.addEventListener(MttService.ETLOGOUT, onLogout);
			
			initData();
			
		}
		
		private function initData() : void
		{
			var dataManager : DataManager = new DataManager();
			SFApplication.application.addEventListener(SFInitializeDataEvent.INITIALIZE_DATA_EVENT,initializedData);
//			dataManager.initData();
			initializedData(new SFInitializeDataEvent());
		}
		
		private function initializedData(event : SFInitializeDataEvent) : void
		{
			SFApplication.application.removeEventListener(SFInitializeDataEvent.INITIALIZE_DATA_EVENT,initializedData);
			
			initUI();
			setTimeout(hideLogo,1000);
		}
		
		private function hideLogo() : void
		{
			var effect : SFEffectBase = new SFEffectBase();
			effect.target = logo;
			effect.duration = 0.5;
			effect.vars = new TweenLiteVars();
			effect.vars.prop("alpha",0);
			effect.vars.onComplete(
				function removeLogo() :void{
					removeChild(logo);
				});
			effect.play();
		}
		
		private function onLogout(e:Event):void
		{
			MttService.login();
		}
		
		private function initUI() : void
		{
//			ModelLocator.playBGSound();
			
			vs = new SFViewStack();
			vs.percentWidth = this.width;
			vs.percentHeight = this.height;
			vs.backgroundColor = 0x0000ff;
			vs.backgroundAlpha = 0;
			var vsEffect : SFViewStackGradientEffect = new SFViewStackGradientEffect();
			vsEffect.duration = 0.5;
			vs.effect = vsEffect;
			addChildAt(vs,0);
			
//			mainPage = new MainPage();
//			mainPage.addEventListener(ChangePageEvent.CHANGE_PAGE_EVENT,changePageHandle);
//			vs.addItem(mainPage);
//			mainPage.init();
			
			gamePage = new GamePage();
			gamePage.percentWidth = 100;
			gamePage.percentHeight = 100;
			gamePage.backgroundAlpha = 0;
			gamePage.addEventListener(ChangePageEvent.CHANGE_PAGE_EVENT,changePageHandle);
			vs.addItem(gamePage);
			gamePage.init();
			
//			helpPage = new HelpPage();
//			helpPage.addEventListener(ChangePageEvent.CHANGE_PAGE_EVENT,changePageHandle);
//			vs.addItem(helpPage);
		}
		
		private function changePageHandle(event : ChangePageEvent) : void
		{
			if(event.data == ChangePageEvent.TO_MAIN_PAGE) {
//				mainPage.init();
			} else if(event.data == ChangePageEvent.TO_GAME_PAGE) {
//				if(firstFlag) {
//					helpPage.toPage = ChangePageEvent.TO_GAME_PAGE;
//					event.data = ChangePageEvent.TO_HELP_PAGE;
//					helpPage.init();
//					firstFlag = false;
//				} else {
					gamePage.init();
//				}
			} else if(event.data == ChangePageEvent.TO_HELP_PAGE) {
//				helpPage.toPage = ChangePageEvent.TO_MAIN_PAGE;
//				helpPage.init();
			} else if(event.data == ChangePageEvent.EXIT) {
				MttService.exit();
				return;
			}
			
			vs.selectedIndex = event.data;
		}
	}
}