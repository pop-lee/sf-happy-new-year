package cn.sftech.www.view
{
	import cn.sftech.www.effect.SFMoveEffect;
	import cn.sftech.www.events.KindleEndEvent;
	import cn.sftech.www.object.Coin;
	import cn.sftech.www.object.Cracker;
	import cn.sftech.www.object.Fireworks;
	import cn.sftech.www.object.Lead;
	import cn.sftech.www.object.Matches;
	import cn.sftech.www.util.MathUtil;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.utils.setTimeout;
	
	public class MaskPane extends MovieClip
	{
		private var _moneyScore : int;
		
		private var _propsCount : int;
		
		private var _gameScore : int;
		
		private var bottomPane : BottomPane;
		
		private var topPane : TopPane;
		
		public var boxBtn : MovieClip;
		
		public function MaskPane()
		{
			super();
			init();
		}
		
		private function init() : void
		{
			bottomPane = new BottomPane();
			addChild(bottomPane);
			
			topPane = new TopPane();
			addChild(topPane);
			
			boxBtn = topPane.boxBtn;
		}
		
		public function set moneyScore(value : int) : void
		{
			_moneyScore = value;
			topPane.moneyText.text = _moneyScore.toString();
		}
		
		public function get moneyScore() : int
		{
			return _moneyScore;
		}
		
		public function set propsCount(value : int) : void
		{
			_propsCount = value;
			topPane.propsCount.text = value.toString();
		}
		
		public function get propsCount() : int
		{
			return _propsCount;
		}
		
		public function set gameScore(value : int) : void
		{
			_gameScore = value;
			topPane.gameScore.text = value.toString();
		}
		
		public function get gameScore() : int
		{
			return _gameScore;
		}
		
		public function set propsIcon(modelValue : uint) : void
		{
			topPane.propsIcon.gotoAndStop(modelValue);
		}
		
		/**
		 * 提取导火索上的金币
		 * @param lead 金币所在的导火索
		 * 
		 */		
		public function colletCoin(lead : Lead) : void
		{
			var coin : Coin = lead.colletCoin();
			coin.x = lead.x;
			coin.y = lead.y;
			bottomPane.addChild(coin);
			
			var effect : SFMoveEffect = new SFMoveEffect();
			effect.target = coin;
			effect.xTo = 120;
			effect.yTo = 750;
			effect.duration = 0.5;
			effect.vars.onComplete(effectEndremoveTarget,[coin]);
			effect.play();
		}
		
		/**
		 * 提取导火索上的火柴
		 * @param lead 火柴所在的导火索
		 * 
		 */		
		public function colletMatches(lead : Lead) : void
		{
			var matches : Matches = lead.colletMatches();
			matches.x = lead.x;
			matches.y = lead.y;
			bottomPane.addChild(matches);
			
			var effect : SFMoveEffect = new SFMoveEffect();
			effect.target = matches;
			effect.xTo = 184;
			effect.yTo = 178;
			effect.duration = 0.5;
			effect.vars.onComplete(effectEndremoveTarget,[matches]);
			effect.play();
		}
		
		public function buyCracker(cracker : Cracker) : void{
			if(cracker.type == 10) {
				return;
			}
			
			moneyScore -= 5;
			cracker.type ++;
			
			for(var i : int = 0;i < 5;i++) {
				setTimeout(costMoney,200*i,cracker);
			}
		}
		
		private function costMoney(cracker : Cracker) : void
		{
			var coin : Coin = new Coin();
			coin.type = 1;
			coin.x = 120;
			coin.y = 750;
			bottomPane.addChild(coin);
			
			var effect : SFMoveEffect = new SFMoveEffect();
			effect.duration = 0.5;
			effect.target = coin;
			effect.xTo = cracker.x;
			effect.yTo = cracker.y-40;
			effect.vars.onComplete(effectEndremoveTarget,[coin]);
			effect.play();
		}
		
		private function effectEndremoveTarget(target : DisplayObject) : void
		{
			bottomPane.removeChild(target);
			target = null;
		}
	}
}