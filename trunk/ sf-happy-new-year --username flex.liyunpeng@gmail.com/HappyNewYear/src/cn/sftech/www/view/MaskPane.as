package cn.sftech.www.view
{
	import cn.sftech.www.effect.SFMoveEffect;
	import cn.sftech.www.object.Coin;
	import cn.sftech.www.object.Lead;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class MaskPane extends MovieClip
	{
		private var bottomPane : BottomPane;
		
		private var topPane : TopPane;
		
		public var boxBtn : MovieClip;
		
		public var moneyText : TextField;
		
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
	}
}