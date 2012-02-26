package
{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.utils.getDefinitionByName;
	
	public class GameSound
	{
		public var sd:Sound;
		public var sdChannel:SoundChannel;
		public var sdTransform:SoundTransform;
		private var channelNum:int;
		public static var main:PlayScreen = null;
		
		public function GameSound(soundClassName:String)
		{	
			var soundClass:Object = getDefinitionByName(soundClassName);
			if (sd == null)
				sd = new soundClass as Sound;
			if (sdChannel== null)
				sdChannel = new SoundChannel();
			if((soundClassName =="DogSnore1") || (soundClassName =="DogSnore2") || (soundClassName =="CatCry")){
				channelNum = 1;
			}
			
		}
		
		public function playSound(loop:int, volume:Number = 1):void
		{
			if(main != null)
				main.isSoundFinished = false;
			if (sdTransform == null)
			{
				sdTransform = new SoundTransform();
			}
			
//			if(channelNum == 1){
//				if(GameSoundObject.saveFinishFlag.soundFinishFlag){
//					sdChannel = sd.play(0, loop, sdTransform);
//					GameSoundObject.saveFinishFlag.soundFinishFlag = false;
//				}
//					
//			}else{
				sdChannel = sd.play(0, loop, sdTransform);
//			}
						
				sdChannel.addEventListener(Event.SOUND_COMPLETE, func);			
			
		}
		
		private function func(event:Event):void
		{
			if(main != null)
				main.isSoundFinished = true;
			
			sdChannel.removeEventListener(Event.SOUND_COMPLETE, func);
		}
		
		public function setVolum(volume:Number):void
		{
			sdTransform = new SoundTransform();
			sdTransform.volume = volume;
			sdChannel.soundTransform = sdTransform;
		}
		
		public function stopSound():void
		{
			if (sdChannel) {
				sdChannel.stop();
			}
		}
		
	}
}