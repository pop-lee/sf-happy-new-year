package 
{
	import cn.sftech.www.event.SFInitializeDataEvent;
	import cn.sftech.www.view.SFApplication;
	
	import com.shared.MyData;
	import com.value.GameValue;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageQuality;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.external.ExternalInterface;
	import flash.system.fscommand;
	
	//[SWF(width="480",height="800",frameRate="24")]
	public class DocumentClass extends SFApplication 
	{
		public var firstScreen:FirstScreen;
		public var playScreen:PlayScreen;
		public var menuScreen:MenuScreen;
		public var successScreen:SuccessScreen;
		public var timeOverScreen:FaildScreen;
		public var soundMuteFlag:Boolean;
		public var musicMuteFlag:Boolean;
		public var stageNumber:int;
		
		public var myData:MyData;
		
		public var firstLoadScreen:FirstLoad;
		
		public function DocumentClass()
		{
		}
		
		override protected function init():void
		{
			DataManager.init(this.stage.root);
			
			SFApplication.application.addEventListener(SFInitializeDataEvent.INITIALIZE_DATA_EVENT,initGame);
			DataManager.initData();
		}
		
		private function initGame(event : SFInitializeDataEvent) : void
		{
			soundMuteFlag = false;
			musicMuteFlag = false;
			stageNumber = 1;
			//showFirstScreen();
			
			myData = MyData.getInstance();
//						GameValue.GAME_LEVEL_DEFINE();
			
			GameSoundObject.BACKGROUND_MUSIC.playSound(10000, 1);
			showFirstScreen();
		}
		
		public function showFirstScreen():void
		{
			firstScreen = new FirstScreen();
			firstScreen.addEventListener( NavigationEvent.START, onRequestStart, false, 0, true );
			firstScreen.x = 0;
			firstScreen.y = 0;
			addChild( firstScreen );
			
		}

		public function onRequestStart( navigationEvent:NavigationEvent ):void
		{
			if(firstScreen!=null){
				removeChild(firstScreen);
				firstScreen = null;
			}
			
			menuScreen = new MenuScreen();
			menuScreen.addEventListener( NavigationEvent.SELECTLEVEL, onRequestSelectLevel, false, 0, true );
			menuScreen.addEventListener( NavigationEvent.TOFIRST, backToFirstScreen, false, 0, true );
			menuScreen.addEventListener( NavigationEvent.FIRST_LOAD, firstLoad, false, 0, true );
			menuScreen.x = 0;
			menuScreen.y = 0;
			addChild( menuScreen );
		}
		public function backToFirstScreen( navigationEvent:NavigationEvent ):void
		{
			removeChild(menuScreen);
			menuScreen = null;
			showFirstScreen();
		}

		public function onRequestSelectLevel( navigationEvent:NavigationEvent ):void
		{
			if(successScreen!=null){
				stageNumber = successScreen.getStageNumber();
				removeChild(successScreen);
				successScreen = null;
			}else if(timeOverScreen!=null){
				removeChild(timeOverScreen);
				timeOverScreen = null;
			}else if(playScreen!=null){
				removeChild(playScreen);
				playScreen = null;
			}
				
			else if(firstLoadScreen!=null){
				stageNumber = 1;
				removeChild(firstLoadScreen);
				firstLoadScreen = null;
			}
			
			else{
				stageNumber = menuScreen.getStageNumber();
				removeChild( menuScreen );
				menuScreen = null;
			}
			playScreen = new PlayScreen();
			playScreen.setStageNumber(stageNumber);
			//playScreen = new PlayScreen(this.stageNumber, this.soundMuteFlag, this.musicMuteFlag);
			playScreen.addEventListener( CatEvent.SUCCESS, onCatPass, false, 0, true );
			playScreen.addEventListener( CatEvent.TIMEUP, onTimeOver, false, 0, true );
			playScreen.addEventListener( NavigationEvent.SELECTLEVEL, onRequestSelectLevel, false, 0, true );
			playScreen.addEventListener( NavigationEvent.TOMENU, onClicToMenu, false, 0, true );
			playScreen.x = 0;
			playScreen.y = 0;
			addChild( playScreen );
			
			
		}
		public function onCatPass( catEvent:CatEvent ):void
		{
			//			var finalScore:Number = playScreen.getFinalScore();
			//			var finalClockTime:Number = playScreen.getFinalClockTime();
			
			var fialTime:int = playScreen.getFialTime();
			var fialCounter:int = playScreen.getFialCounter();
			
			removeChild( playScreen );
			playScreen = null;
			successScreen = new SuccessScreen();
			successScreen.setFialCounter(fialCounter);
			successScreen.setFialTime(fialTime);
			successScreen.setStageNumber(stageNumber);
			
			successScreen.addEventListener( NavigationEvent.SELECTLEVEL, onRequestSelectLevel, false, 0, true );
			successScreen.addEventListener( NavigationEvent.TOMENU, onClicToMenu, false, 0, true );
			successScreen.x = 0;
			successScreen.y = 0;
			//			successScreen.setFinalScore( finalScore );
			//			successScreen.setFinalClockTime( finalClockTime );
			addChild( successScreen );
			
			
		}
		public function onClicToMenu( navigationEvent:NavigationEvent ):void
		{
			
			if(successScreen!=null){
				removeChild(successScreen);
				successScreen = null;
			}else if(timeOverScreen!=null){
				removeChild(timeOverScreen);
				timeOverScreen = null;
			}else{
				removeChild(playScreen);
				playScreen = null;
			}
			onRequestStart(navigationEvent);
		}

		public function onTimeOver( catEvent:CatEvent ):void
		{
			//			var finalScore:Number = playScreen.getFinalScore();
			
			
			removeChild( playScreen );
			playScreen = null;
			timeOverScreen = new FaildScreen();
			timeOverScreen.setStageNumber(stageNumber);
			
			timeOverScreen.addEventListener( NavigationEvent.SELECTLEVEL, onRequestSelectLevel, false, 0, true );
			timeOverScreen.addEventListener( NavigationEvent.TOMENU, onClicToMenu, false, 0, true );
			timeOverScreen.x = 0;
			timeOverScreen.y = 0;
			//			timeOverScreen.setFinalScore( finalScore );
			addChild( timeOverScreen );
			
			
		}
		
		
		////////////////////First Load
		public function firstLoad(event:NavigationEvent):void
		{
			removeChild( menuScreen );
			menuScreen = null;
			
			firstLoadScreen = new FirstLoad();
			firstLoadScreen.addEventListener(NavigationEvent.TOFIRST, onRequestSelectLevel);
			addChild(firstLoadScreen);
		}
	}
}