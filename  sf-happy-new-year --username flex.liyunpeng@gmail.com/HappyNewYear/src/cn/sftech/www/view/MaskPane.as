package cn.sftech.www.view
{
	import cn.sftech.www.effect.SFMoveEffect;
	import cn.sftech.www.events.KindleEndEvent;
	import cn.sftech.www.object.Coin;
	import cn.sftech.www.object.Cracker;
	import cn.sftech.www.object.Fireworks;
	import cn.sftech.www.object.Lead;
	import cn.sftech.www.util.MathUtil;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.utils.setTimeout;
	
	public class MaskPane extends MovieClip
	{
		private var _moneyScore : uint;
		
		private var bottomPane : BottomPane;
		
		private var topPane : TopPane;
		
		public var boxBtn : MovieClip;
		
		private var moneyText : TextField;
		
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
			moneyText = topPane.moneyText;
		}
		
		public function set moneyScore(value : uint) : void
		{
			_moneyScore = value;
			moneyText.text = _moneyScore.toString();
		}
		
		public function get moneyScore() : uint
		{
			return _moneyScore;
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
			effect.vars.onComplete(function endBuy(target : Coin) : void
			{
				bottomPane.removeChild(target);
			},[coin]);
			effect.play();
		}
	}
}