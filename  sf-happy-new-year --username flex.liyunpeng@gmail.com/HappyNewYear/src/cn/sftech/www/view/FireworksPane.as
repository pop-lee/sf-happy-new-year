package cn.sftech.www.view
{
	import cn.sftech.www.events.KindleEndEvent;
	import cn.sftech.www.object.Fireworks;
	import cn.sftech.www.util.MathUtil;

	public class FireworksPane extends SFMovieClip
	{
		public function FireworksPane()
		{
			super();
			this.backgroundImage = gamePaneBackground;
		}
		
		public function kindleFireworks() : void
		{
			var fireworks : Fireworks = new Fireworks();
			fireworks.type = MathUtil.random(1,6);
			fireworks.x = MathUtil.random(100,380);
			fireworks.y = MathUtil.random(100,380);
			fireworks.addEventListener(KindleEndEvent.KINDLE_END_EVENT,endKindle);
			addChild(fireworks);
			fireworks.kindleFireworks();
		}
		
		private function endKindle(event : KindleEndEvent) : void
		{
			removeChild(event.target as Fireworks);
		}
	}
}