package cn.sftech.www.util
{
	import cn.sftech.www.event.SFInitializeDataEvent;
	import cn.sftech.www.util.ByteArrayObjectTranslator;
	import cn.sftech.www.view.SFApplication;
	
	import com.qq.openapi.MttGameData;
	import com.qq.openapi.MttScore;
	import com.qq.openapi.MttService;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	public class DataManager
	{
		private static var manageLock : Boolean = false;
		
		private static var isInitialized : Boolean = false;
		
		private static var manageFuncArr : Vector.<Object> = new Vector.<Object>();
		
		private static const LEVEL_DATA : String = "levelData";
		
		public function DataManager()
		{
		}
		
		public static function init(root : Object) : void
		{
			MttService.initialize(root, "D5FE393C02DB836FFDE413B8794056ED","1052");
			MttService.addEventListener(MttService.ETLOGOUT, 
				function onLogout(event : Event) : void
				{
					MttService.login();
				}
			);
		}
		
		public static function initData() : void
		{
			var dm : DataManager = new DataManager
			actionFunction(dm.initFinished);
		}
		
		public static function saveScore(score : Number) : void
		{
			var dm : DataManager = new DataManager();
			actionFunction(dm.saveScoreHandle,score);
		}
		
		private function saveScoreHandle(score : Number) : void
		{
			MttScore.submit(score,submitScoreResult);
		}
		private function submitScoreResult(result : Object) : void
		{
			outList();
			if(result.code == 0) {
				trace("success");
			} else {
				trace(result.code);
			}
		}
		
		//------------------------------------------------
		
		public static function actionFunction(func : Function, ...parameters) : void
		{
			if(manageLock) {
				manageFuncArr.push({func:func,param:parameters});
			} else {
				manageLock = true;
				
				func.apply(null,parameters);
			}
		}
		
		private function outList() : void
		{
//			if(!isInitialized) {
//				//				loading = loading>=100?100:loading += 10;
//				//				LogManager.print("正在加载用户数据..." + loading + " %");
//				
//				if(manageFuncArr.length == 0) {
//					//					loading = 100;
//					//					LogManager.print("正在加载用户数据..." + loading + " %");
//					initFinished();
//				}
//			}
			
			manageLock = false;
			if(manageFuncArr.length == 0) return;
			
			var func : Function = manageFuncArr[0].func;
			var param : Array = manageFuncArr[0].param;
			manageFuncArr.splice(0,1);
			if(manageFuncArr.length>=0) {
				actionFunction(func,param);
			}
		}
		
		private function initFinished() : void
		{
			isInitialized = true;
			//			LogManager.print("初始化成功");
			
			manageLock = false;
			
			SFApplication.application.dispatchEvent(new SFInitializeDataEvent());
			//			LogManager.hideLog();
			
		}
	}
}