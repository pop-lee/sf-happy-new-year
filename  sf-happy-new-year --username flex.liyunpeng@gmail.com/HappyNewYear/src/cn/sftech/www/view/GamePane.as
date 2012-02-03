package cn.sftech.www.view
{
	import cn.sftech.www.effect.base.SFEffectBase;
	import cn.sftech.www.object.Fire;
	import cn.sftech.www.object.Lead;
	import cn.sftech.www.util.MathUtil;
	
	import flash.events.MouseEvent;

	public class GamePane extends SFContainer
	{
		private var leadPane : SFContainer;
		
		public var firePane : SFContainer;
		
		private const BASE_X : uint = 90;
		
		private const BASE_Y : uint = 298;
		
		private const COL_COUNT : uint = 6;
		
		private const ROW_COUNT : uint = 9;
		//------ Config --------------------------------
		
		private var leadArr : Vector.<Vector.<Lead>>;
		/**
		 * 记录导火线颜色标记
		 */		
		private var leadColorArr : Vector.<Vector.<uint>>;
		/**
		 * 当前颜色标记
		 */		
		private var currentColorFlag : uint = 1;
		
		private var rotationEffect : SFEffectBase = new SFEffectBase();
		
		////////////////////
		private var tempMap : Array = [
				[1,1,2,2,2,2],
				[3,1,1,1,2,1],
				[2,2,2,4,1,2],
				[1,1,1,1,1,1],
				[2,2,2,1,3,2],
				[4,4,1,2,1,2],
				[1,1,2,1,2,2],
				[2,1,2,1,2,3],
				[1,3,1,1,2,1]
			];
		
		public function GamePane()
		{
			super();
		}
		
		/**
		 * 初始化游戏
		 */		
		public function init() : void
		{
			this.backgroundImage = gamePaneBackground;
			initData();
			initUI();
			initEvent();
		}
		
		/**
		 * 初始化数据
		 */		
		private function initData() : void
		{
			leadArr = new Vector.<Vector.<Lead>>(ROW_COUNT);
			for(var i : int = 0;i < leadArr.length;i++) {
				leadArr[i] = new Vector.<Lead>(COL_COUNT);
			}
			
			rotationEffect.duration = 0.3;
		}
		
		/**
		 * 初始化界面
		 */		
		private function initUI() : void
		{
			leadPane = new SFContainer();
			leadPane.percentWidth = 100;
			leadPane.percentHeight = 100;
			leadPane.backgroundAlpha = 0;
			firePane = new SFContainer();
			firePane.percentWidth = 100;
			firePane.percentHeight = 100;
			firePane.backgroundAlpha = 0;
			this.addChild(leadPane);
			this.addChild(firePane);
			createEntrance();
			createExport();
			createLead();
			
			checkGame();
		}
		
		/**
		 * 初始化事件
		 */		
		private function initEvent() : void
		{
			this.addEventListener(MouseEvent.CLICK,clickLeadHandle);
		}
		
		/**
		 * 创建入口导火线
		 * 
		 */		
		private function createEntrance() : void
		{
			for(var i : int = 0;i < ROW_COUNT;i++) {
				var lead : Lead = new Lead();
				lead.type = 1;
				lead.x = BASE_X - Lead.LEAD_SIZE;
				lead.y = BASE_Y + Lead.LEAD_SIZE*i;
				lead.firePane = firePane;
				leadPane.addChild(lead);
				
				var fire : Fire = new Fire();
				fire.x = lead.x;
				fire.y = lead.y;
				firePane.addChild(fire);
			}
		}
		/**
		 * 创建出口导火线
		 * 
		 */		
		private function createExport() : void
		{
			for(var i : int = 0;i < ROW_COUNT;i++) {
				var lead : Lead = new Lead();
				lead.type = 1;
				lead.x = BASE_X + Lead.LEAD_SIZE*COL_COUNT;
				lead.y = BASE_Y + Lead.LEAD_SIZE*i;
				lead.firePane = firePane;
				leadPane.addChild(lead);
			}
		}
		
		/**
		 * 初始化创建导火线
		 * 
		 */		
		private function createLead() : void
		{
			if(tempMap) {
				for(var a : int = 0;a < ROW_COUNT;a++) {
					for(var b : int = 0;b < COL_COUNT;b++) {
						var leadt : Lead = new Lead();
						leadt.type = tempMap[a][b];
						leadt.x = BASE_X + Lead.LEAD_SIZE*b;
						leadt.y = BASE_Y + Lead.LEAD_SIZE*a;
						leadt.firePane = firePane;
						leadPane.addChild(leadt);
						leadArr[a][b] = leadt;
					}
				}
				return;
			}
			
			
			var temp : String;
			for(var i : int = 0;i < ROW_COUNT;i++) {
				temp = "["
				for(var j : int = 0;j < COL_COUNT;j++) {
					var lead : Lead = new Lead();
					var tmpFlag : uint = MathUtil.random(1,17);
					if(tmpFlag>9) {
						lead.type = 1;
					} else if(tmpFlag > 2) {
						lead.type = 2;
					} else if(tmpFlag > 1) {
						lead.type = 3;
					} else {
						lead.type = 4;
					}
//					lead.type = MathUtil.random(1,5);
					lead.x = BASE_X + Lead.LEAD_SIZE*j;
					lead.y = BASE_Y + Lead.LEAD_SIZE*i;
					lead.firePane = firePane;
					leadPane.addChild(lead);
					leadArr[i][j] = lead;
					temp += lead.type + ",";
				}
				temp += "]";
				trace(temp);
				temp = "";
			}
		}
		
		/**
		 * 点击导火线执行方法
		 * @param event 鼠标点击事件
		 * 
		 */		
		private function clickLeadHandle(event : MouseEvent) : void
		{
			if(this.mouseX < BASE_X || this.mouseX > BASE_X + Lead.LEAD_SIZE*COL_COUNT ||
				this.mouseY < BASE_Y || this.mouseY > BASE_Y + Lead.LEAD_SIZE*ROW_COUNT) {
				return;
			}
			
			var lead : Lead = getLead(this.mouseX,this.mouseY);
			lead.rotationLead(rotationEffect);
			
			checkGame();
		}
		/**
		 * 根据鼠标点击位置获取导火线
		 * @param value_x 鼠标当前X坐标
		 * @param value_y 鼠标当前Y坐标
		 * @return 返回指定位置的导火线
		 * 
		 */		
		private function getLead(value_x : uint,value_y : uint) : Lead
		{
			var indexY : int = (value_y - BASE_Y)/Lead.LEAD_SIZE;
			var indexX : int = (value_x - BASE_X)/Lead.LEAD_SIZE;
			if(indexY < 0) {
				indexY = 0;
			} else if(indexY > ROW_COUNT) {
				indexY = ROW_COUNT;
			}
			
			if(indexX < 0) {
				indexX = 0;
			} else if(indexX > COL_COUNT) {
				indexX = COL_COUNT;
			}
			return leadArr[indexY][indexX];
		}
		
		/**
		 * 检测游戏规则
		 */		
		private function checkGame() : void
		{
			leadColorArr = new Vector.<Vector.<uint>>(ROW_COUNT);
			for(var j : int = 0;j < leadArr.length;j++) {
				leadColorArr[j] = new Vector.<uint>(COL_COUNT);
			}
			
			checkEntrance();
			checkExport();
			colorSet();
		}
		
		/**
		 * 检测入口
		 * 
		 */		
		private function checkEntrance() : void
		{
			for(var i : int = 0;i < ROW_COUNT;i ++) {
				if(leadArr[i][0].exportArr[0]) {
					currentColorFlag = Lead.YELLOW_COLOR;
					deepFind(0,i,0);
//					trace(i);
				}
			}
		}
		
		/**
		 * 检测出口
		 * 
		 */		
		private function checkExport() : void
		{
			for(var i : int = 0;i < ROW_COUNT;i ++) {
				if(leadArr[i][COL_COUNT-1].exportArr[2]) {
					currentColorFlag = Lead.RED_COLOR;
					deepFind(COL_COUNT-1,i,2);
					//					trace(i);
				}
			}
		}
		
		/**
		 * 根据颜色标技术组设定颜色
		 * 
		 */		
		private function colorSet() : void
		{
			for(var i : int = 0;i < ROW_COUNT;i++) {
				for(var j : int = 0;j < COL_COUNT;j ++) {
					leadArr[i][j].currentColorFlag = leadColorArr[i][j];
				}
			}
		}
		
		/**
		 * 深度查找方法
		 * 
		 */		
		private function deepFind(arrIndexX : int,arrIndexY : int,index : int) : void
		{
			var lead : Lead = leadArr[arrIndexY][arrIndexX];
			var leadColor : uint = leadColorArr[arrIndexY][arrIndexX];
			//如果当前入口索引是通的
				
			//如果当前检测块的颜色已经是检证过的 则返回
			
			if(lead.exportArr[index]) { 
				if(currentColorFlag == Lead.RED_COLOR) {
					if(leadColorArr[arrIndexY][arrIndexX] == Lead.RED_COLOR ||
						leadColorArr[arrIndexY][arrIndexX] == Lead.ORANGE_COLOR) return;
					
					if(leadColorArr[arrIndexY][arrIndexX] == Lead.YELLOW_COLOR) {
						leadColorArr[arrIndexY][arrIndexX] = Lead.ORANGE_COLOR;
					} else {
						leadColorArr[arrIndexY][arrIndexX] = Lead.RED_COLOR;
					}
				} else {
					if(leadColorArr[arrIndexY][arrIndexX] == currentColorFlag) return;
					
					leadColorArr[arrIndexY][arrIndexX] = currentColorFlag;
				}
			
				for(var i : int = 0;i < lead.exportArr.length;i++) {
					if(i == index) continue;
					if(lead.exportArr[i]) {
						var nextIndexX : int = arrIndexX;
						var nextIndexY : int = arrIndexY;
						switch(i) {
							case 0:{nextIndexX --;};break;
							case 1:{nextIndexY --;};break;
							case 2:{nextIndexX ++;};break;
							case 3:{nextIndexY ++;};break;
						}
						
						if(nextIndexX == 5 && nextIndexY == 1) {
							trace("a");
						}
						
						if(0 <= nextIndexX && nextIndexX < COL_COUNT &&
							0 <= nextIndexY && nextIndexY < ROW_COUNT) {
							var oppIndex : int = i+2;
							if(oppIndex > lead.exportArr.length-1) {
								oppIndex -= lead.exportArr.length;
							}
							
							deepFind(nextIndexX,nextIndexY,oppIndex);
							trace(nextIndexX + "      " + nextIndexY + "      " + i);
						}
					}
				}
			}
		}
		/*
		检测方法：
		先从入口遍历整个导火索数组，将所有入口的标记为黄色
		再从出口遍历整个导火索数组，将所有出口的标记为红色或者橙色
		遍历整个导火索数组，将导火索颜色按照标记改为标记颜色
		经过若干毫秒的等待，若没有其他事件，则点燃导火索
		讲以燃烧的导火索改为绿色
		
		*/
		
	}
}