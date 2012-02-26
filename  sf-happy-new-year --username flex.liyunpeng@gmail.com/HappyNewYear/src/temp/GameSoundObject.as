package
{
	import flash.events.Event;

	public class GameSoundObject
	{	
		public static var BACKGROUND_MUSIC:GameSound = new GameSound("BackgroundMusic");
		public static var BUTTON_CLICK:GameSound = new GameSound("ButtonClick");
		public static var CAT_CRY:GameSound = new GameSound("CatCry");
		public static var CAT_WIN:GameSound = new GameSound("CatWin");
		public static var DOG_HORIZONTAL:GameSound = new GameSound("DogSnore1");
		public static var DOG_VERTICAL:GameSound = new GameSound("DogSnore2");
		public static var TimeComplete:GameSound = new GameSound("TimeComplete");
		
		public static var BGM_FLG:Boolean = true;
		public static var BTN_FLG:Boolean = true;
		
//		public static var saveFinishFlag:SaveFinishFlag = new SaveFinishFlag();
		
		public function GameSoundObject()
		{
//			CAT_CRY.sdChannel.addEventListener(Event.SOUND_COMPLETE,onSoundPlayFinished, false, 0, true );
//			DOG_HORIZONTAL.sdChannel.addEventListener(Event.SOUND_COMPLETE,onSoundPlayFinished, false, 0, true );
//			DOG_VERTICAL.sdChannel.addEventListener(Event.SOUND_COMPLETE,onSoundPlayFinished, false, 0, true );
		}
		
//		public function onSoundPlayFinished(event:Event):void{
//			saveFinishFlag.soundFinishFlag = true;
//		}
//		public function init(){
//			CAT_CRY.sdChannel.addEventListener(Event.SOUND_COMPLETE,onSoundPlayFinished, false, 0, true );
//			DOG_HORIZONTAL.sdChannel.addEventListener(Event.SOUND_COMPLETE,onSoundPlayFinished, false, 0, true );
//			DOG_VERTICAL.sdChannel.addEventListener(Event.SOUND_COMPLETE,onSoundPlayFinished, false, 0, true );
//
//		}
		
	}
}