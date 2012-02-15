package cn.sftech.www.model
{
	import flash.errors.IllegalOperationError;
	import flash.events.Event;

	public class ModelLocator
	{
		private static var _model : ModelLocator = new ModelLocator();
		
		public var correntMoneyScore : uint = 2000;
		
		public var currentGameMode : uint = 0;
		//=================================
//		
//		/**
//		 * 音乐声道
//		 */		
//		public var musicChannel : SoundChannel = new SoundChannel();
//		/**
//		 * 音效声道
//		 */		
//		public var audioChannel : SoundChannel = new SoundChannel();
		
		
		public function ModelLocator()
		{
			if(_model != null) {
				throw new IllegalOperationError("这是一个单例类，请使用getInstance方法来获取对象");
			}
		}
		
		public static function getInstance() : ModelLocator
		{
			return _model;
		}
		
//		public static function playAudioSound(obj : Sound) : void
//		{
//			_model.audioChannel = obj.play(0,0,_model.audioChannel.soundTransform);
//		}
//		
//		public static function playOPSound(event : Event=null) : void
//		{
//			_model.musicChannel.stop();
//			_model.musicChannel = (new OP()).play(0,0,_model.musicChannel.soundTransform);
//			if(!_model.musicChannel.hasEventListener(Event.SOUND_COMPLETE)) {
//				_model.musicChannel.addEventListener(Event.SOUND_COMPLETE,playOPSound);
//			}
//		}
//		
//		public static function playBMGSound(event : Event=null) : void
//		{
//			_model.musicChannel.stop();
//			_model.musicChannel = (new BGM()).play(0,0,_model.musicChannel.soundTransform);
//			if(!_model.musicChannel.hasEventListener(Event.SOUND_COMPLETE)) {
//				_model.musicChannel.addEventListener(Event.SOUND_COMPLETE,playBMGSound);
//			}
//		}
		
	}
}