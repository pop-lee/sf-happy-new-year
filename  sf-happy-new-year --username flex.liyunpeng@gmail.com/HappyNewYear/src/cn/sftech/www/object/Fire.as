package cn.sftech.www.object
{
	import cn.sftech.www.effect.SFMoveEffect;
	import cn.sftech.www.events.KindleEndEvent;
	import cn.sftech.www.model.GameConfig;
	import cn.sftech.www.util.MathUtil;
	import cn.sftech.www.view.SFMovieClip;
	
	import com.greensock.easing.Linear;
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	public class Fire extends SFMovieClip
	{
		private var body : MovieClip;
		
		private var fireEffect : SFMoveEffect = new SFMoveEffect();
		
		public var dirIndex : uint;
		
		public function Fire()
		{
			body = new FireBody();
			body.y = 22;
			addChild(body);
			body.gotoAndPlay(MathUtil.random(0,4)*3+1);
//			this.backgroundImage = FireBody;
			
			super();
			fireEffect.target = this;
			fireEffect.duration = GameConfig.KINDLE_SPEED;
			fireEffect.vars.onComplete(KindleEnd);
			fireEffect.vars.ease(Linear.easeNone);
		}
		
		private function KindleEnd() : void
		{
				this.dispatchEvent(new KindleEndEvent());
		}
		
		public function kindleTo(point : Point) : void
		{
			fireEffect.xTo = point.x;
			fireEffect.yTo = point.y;
			fireEffect.play();
		}
	}
}