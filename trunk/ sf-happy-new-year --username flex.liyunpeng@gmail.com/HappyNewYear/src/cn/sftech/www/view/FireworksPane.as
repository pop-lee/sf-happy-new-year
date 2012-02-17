package cn.sftech.www.view
{
	import cn.sftech.www.effect.base.SFEffectBase;
	import cn.sftech.www.events.KindleEndEvent;
	import cn.sftech.www.object.Fireworks;
	import cn.sftech.www.util.MathUtil;
	
	import com.greensock.data.TweenLiteVars;

	public class FireworksPane extends SFMovieClip
	{
		private var bgEffect : SFEffectBase = new SFEffectBase();
		
		public function FireworksPane()
		{
			super();
			this.backgroundImage = NightMask;
			this.backgroundImage.alpha = 0;
			
			bgEffect.target = this.backgroundImage;
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
			
			bgEffect.stop(true);
			bgEffect.duration = 0.3;
			bgEffect.vars.prop("alpha",1);
			bgEffect.play();
		}
		
		private function endKindle(event : KindleEndEvent) : void
		{
			removeChild(event.target as Fireworks);
			
			bgEffect.stop(true);
			bgEffect.duration = 1;
			bgEffect.vars.prop("alpha",0);
			bgEffect.play();
		}
	}
}