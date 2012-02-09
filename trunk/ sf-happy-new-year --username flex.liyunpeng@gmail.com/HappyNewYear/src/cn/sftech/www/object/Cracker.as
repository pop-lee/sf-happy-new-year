package cn.sftech.www.object
{
	import flash.display.MovieClip;
	import flash.events.Event;

	public class Cracker extends MovieClip
	{
		private var body : MovieClip;
		
		private var _type : uint;
		
		public function Cracker()
		{
		}
		
		public function set type(value : uint) : void
		{
			_type = value;
			switch(value) {
				case 1:{body = new Firecracker1()};break;
				case 2:{body = new Firecracker2()};break;
				case 3:{body = new Firecracker3()};break;
				case 4:{body = new Firecracker4()};break;
				case 5:{body = new Firecracker5()};break;
				case 6:{body = new Firecracker6()};break;
				case 7:{body = new Firecracker7()};break;
				case 8:{body = new Firecracker8()};break;
				case 9:{body = new Firecracker9()};break;
				case 10:{body = new Firecracker10()};break;
			}
			
			this.addChild(body);
		}
		
		public function kindleCracker() : void
		{
			this.removeChild(body);
			body = new Explode();
			body.addEventListener(Event.ENTER_FRAME,explodeEnterFrameHandle);
			this.addChild(body);
		}
		
		private function explodeEnterFrameHandle(evt : Event) : void
		{
			if(body.currentFrame == body.totalFrames) {
				body.removeEventListener(Event.ENTER_FRAME,explodeEnterFrameHandle);
				this.removeChild(body);
				type = _type;
			} else {
				body.nextFrame();
			}
		}
	}
}