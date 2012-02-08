package cn.sftech.www.view
{
	import cn.sftech.www.effect.SFMoveEffect;
	import cn.sftech.www.effect.base.SFEffectBase;
	import cn.sftech.www.events.KindleEndEvent;
	import cn.sftech.www.object.Fire;
	import cn.sftech.www.object.Lead;
	import cn.sftech.www.util.MathUtil;
	
	import com.greensock.easing.Quart;
	
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;

	public class GamePane extends SFContainer
	{
		private var leadPane : SFContainer;
		
		private var coverPane : CoverPane;
		
		public var firePane : SFContainer;
		
		private const BASE_X : uint = 40;
		
		private const BASE_Y : uint = 298;
		
		private const CRE_Y : uint = 190;
		
		private const COL_COUNT : uint = 8;
		
		private const ROW_COUNT : uint = 9;
		//------ Config --------------------------------
		
		private var leadArr : Vector.<Vector.<Lead>>;
		/**
		 * 记录导火线颜色标记
		 */		
		private var leadColorArr : Vector.<Vector.<uint>>;
		/**
		 * 记录已检测通过的导火线索引
		 */		
		private var fireLeadArr : Vector.<uint> = new Vector.<uint>;
		/**
		 * 要燃烧的出口导火索索引
		 */		
		private var fireExportLeadArr : Vector.<uint> = new Vector.<uint>;
		/**
		 * 要删除的导火线
		 */		
		private var toDelArr : Vector.<Lead> = new Vector.<Lead>;
		
		/**
		 * 当前颜色标记
		 */		
		private var currentColorFlag : uint = 1;
		
		/**
		 * 标记当前是否在点燃状态
		 */
		private var isFiring : Boolean = false;
		/**
		 * 准备点火倒计时
		 */		
		private var fireTimer : Timer = new Timer(1000,1);
		
		private var rotationEffect : SFEffectBase = new SFEffectBase();
		
		////////////////////
		private var mapData : Array = [
//				[1,1,2,2,2,2],
//				[3,1,1,1,2,1],
//				[2,2,2,4,1,2],
//				[1,1,1,1,1,1],
//				[2,2,2,1,3,2],
//				[4,4,1,2,1,2],
//				[1,1,2,1,2,2],
//				[2,1,2,1,2,3],
//				[1,3,1,1,2,1]
			
				[3,1,1,1,1,1],
				[3,1,1,1,2,1],
				[2,2,2,4,1,2],
				[1,1,1,1,1,2],
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
			
			coverPane = new CoverPane();
			coverPane.mouseEnabled = false;
			
			firePane = new SFContainer();
			firePane.percentWidth = 100;
			firePane.percentHeight = 100;
			firePane.backgroundAlpha = 0;
			this.addChild(leadPane);
			this.addChild(coverPane);
			this.addChild(firePane);
			createEntrance();
			createExport();
//			createLead();
			createLeadMap();
			
		}
		
		/**
		 * 初始化事件
		 */		
		private function initEvent() : void
		{
			this.addEventListener(MouseEvent.CLICK,clickLeadHandle);
			fireTimer.addEventListener(TimerEvent.TIMER_COMPLETE,startKindle);
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
				lead.x = BASE_X;
				lead.y = BASE_Y + Lead.LEAD_SIZE*i;
				leadArr[i][0] = lead;
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
				lead.x = BASE_X + Lead.LEAD_SIZE*(COL_COUNT-1);
				lead.y = BASE_Y + Lead.LEAD_SIZE*i;
				leadArr[i][COL_COUNT-1] = lead;
				leadPane.addChild(lead);
			}
		}
		
		/**
		 * 初始化创建导火线
		 * 
		 */		
//		private function createLead() : void
//		{
//			if(mapData) {
//				for(var a : int = 0;a < ROW_COUNT;a++) {
//					for(var b : int = 1;b < COL_COUNT-1;b++) {
//						var leadt : Lead = new Lead();
//						leadt.type = mapData[a][b-1];
//						leadt.x = BASE_X + Lead.LEAD_SIZE*b;
//						leadt.y = BASE_Y + Lead.LEAD_SIZE*a;
//						leadPane.addChild(leadt);
//						leadArr[a][b] = leadt;
//					}
//				}
//				return;
//			}
//			
//			
//			var temp : String;
//			for(var i : int = 0;i < ROW_COUNT;i++) {
//				temp = "["
//				for(var j : int = 1;j < COL_COUNT-1;j++) {
//					var lead : Lead = new Lead();
//					var tmpFlag : uint = MathUtil.random(1,17);
//					if(tmpFlag>9) {
//						lead.type = 1;
//					} else if(tmpFlag > 2) {
//						lead.type = 2;
//					} else if(tmpFlag > 1) {
//						lead.type = 3;
//					} else {
//						lead.type = 4;
//					}
////					lead.type = MathUtil.random(1,5);
//					lead.x = BASE_X + Lead.LEAD_SIZE*j;
//					lead.y = BASE_Y + Lead.LEAD_SIZE*i;
//					leadPane.addChild(lead);
//					leadArr[i][j] = lead;
//					temp += lead.type + ",";
//				}
//				temp += "]";
//				trace(temp);
//				temp = "";
//			}
//		}
		
		private function createLeadMap() : void
		{
			for(var j : int = 1;j < COL_COUNT-1;j ++) {
				for(var i : int = ROW_COUNT-1;i >= 0;i --) {
					if(leadArr[i][j] == null) {
						createLead4Column(j,i);
//						hasBlank = true;
						break;
					}
				}
				
//				for(var m : int = ROW_COUNT-1;m >= 0;m --) {
//					createLeadEffect(leadArr[m][j],j,m);
//				}
			}
			
			mapData = null;
			isFiring = false;
			
			checkGame();
		}
		
		private function createLeadEffect(lead : Lead,indexX : uint,indexY: uint) : void
		{
//			lead.x = BASE_X + Lead.LEAD_SIZE*indexX;
//			lead.y = BASE_Y + Lead.LEAD_SIZE*indexY;
			
			var moveEffect : SFMoveEffect = new SFMoveEffect();
			moveEffect.target = lead;
			moveEffect.duration = (BASE_Y + Lead.LEAD_SIZE*indexY - lead.y)/500 + 0.3;
			moveEffect.vars.ease(Quart.easeIn);
			moveEffect.yTo = BASE_Y + Lead.LEAD_SIZE*indexY;
			moveEffect.play();
		}
		
		private function createLead4Column(indexX : uint,indexY : uint) : void
		{
			var blankBlockCount : uint = 0;
			if(mapData) { //如果有现有地图数据
				blankBlockCount = ROW_COUNT;
				for(var a : int = ROW_COUNT-1;a >= 0; a--) {
					var lead : Lead = new Lead();
					if(indexY == 8 && indexX == 6) {
						trace(indexY + " " + indexX);
					}
					lead.type = mapData[a][indexX-1];
					lead.indexX = indexX;
					lead.indexY = a;
					lead.x = BASE_X + Lead.LEAD_SIZE*indexX;
					lead.y = CRE_Y;
					leadArr[a][indexX] = lead;
//					leadPane.addChild(lead);
					
				}
			} else { //如果没有现有地图数据
				//向下移动现有的导火线
				for(var i : int = indexY;i >= 0;i--) {
					if(leadArr[i][indexX] == null) {
						blankBlockCount ++;
					} else { 
						var moveLead : Lead = leadArr[i][indexX];
						moveLead.indexX = indexX;
						moveLead.indexY = i+blankBlockCount;
						leadArr[i+blankBlockCount][indexX] = moveLead;
						leadArr[i][indexX] = null;
						createLeadEffect(leadArr[i+blankBlockCount][indexX],indexX,i+blankBlockCount);
					}
				}
				
				//创建地图中空挡的导火线
				for(var k : int = blankBlockCount-1;k >= 0; k--) {
					var creLead : Lead = new Lead();
					var tmpFlag : uint = MathUtil.random(1,17);
					if(tmpFlag>9) {
						creLead.type = 1;
					} else if(tmpFlag > 2) {
						creLead.type = 2;
					} else if(tmpFlag > 1) {
						creLead.type = 3;
					} else {
						creLead.type = 4;
					}
					creLead.indexX = indexX;
					creLead.indexY = k;
					creLead.x = BASE_X + Lead.LEAD_SIZE*indexX;
					creLead.y = CRE_Y;
					
					leadArr[k][indexX] = creLead;
//					leadPane.addChild(creLead);
				}
			}
			
			var _createTimer : Timer = new Timer(170,blankBlockCount);
			_createTimer.addEventListener(TimerEvent.TIMER,
				function createBlockTimerHandle(event : TimerEvent):void {
					var _createTimer : Timer = event.currentTarget as Timer;
					var iy : uint = _createTimer.repeatCount - _createTimer.currentCount;
					var curlead : Lead = leadArr[iy][indexX];
					leadPane.addChild(curlead);
					createLeadEffect(curlead,indexX,iy);
				});
			_createTimer.start();
		}
		
		/**
		 * 点击导火线执行方法
		 * @param event 鼠标点击事件
		 * 
		 */		
		private function clickLeadHandle(event : MouseEvent) : void
		{
			if(isFiring) return;
			if(this.mouseX < BASE_X+Lead.LEAD_SIZE || this.mouseX > BASE_X + (Lead.LEAD_SIZE*COL_COUNT-2) ||
				this.mouseY < BASE_Y || this.mouseY > BASE_Y + Lead.LEAD_SIZE*ROW_COUNT) {
				return;
			}
			
			fireTimer.stop();
			
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
			
			if(indexX < 1) {
				indexX = 1;
			} else if(indexX > COL_COUNT-2) {
				indexX = COL_COUNT-2;
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
			
			if(fireLeadArr.length>0) {
				fireTimer.reset();
				fireTimer.start();
			}
		}
		
		/**
		 * 检测入口
		 * 
		 */		
		private function checkEntrance() : void
		{
			fireLeadArr = new Vector.<uint>;
			for(var i : int = 0;i < ROW_COUNT;i ++) {
				if(leadArr[i][0].exportArr[0]) {
					currentColorFlag = Lead.YELLOW_COLOR;
					changeColor(0,i,0);
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
			fireExportLeadArr = new Vector.<uint>;
			for(var i : int = 0;i < ROW_COUNT;i ++) {
				if(leadArr[i][COL_COUNT-1].exportArr[2]) {
					currentColorFlag = Lead.RED_COLOR;
					changeColor(COL_COUNT-1,i,2);
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
		
		private function startKindle(event : TimerEvent) : void
		{
			isFiring = true;
			currentColorFlag = Lead.GREEN_COLOR;
			while(fireLeadArr.length>0) {
				var fire : Fire = new Fire();
				fire.x = leadArr[fireLeadArr[0]][0].x;
				fire.y = leadArr[fireLeadArr[0]][0].y;
				fire.dirIndex = 0;
				firePane.addChild(fire);
				changeColor(0,fireLeadArr[0],0,fire);
				fireLeadArr.splice(0,1);
			}
		}
		
//		private function kindelLead(lead : Lead) : void
//		{
//			fire.addEventListener(KindleEndEvent.KINDLE_END_EVENT,kindleCenter);
//			fire.kindleTo(new Point(this.x,this.y));
//		}
		
		public function kindleFire(fire : Fire,index : uint) : void
		{
		}
		
//		private function kindleCenter(event : KindleEndEvent) : void
//		{
//			//			var fire : Fire = event.target;
//			event.target.removeEventListener(KindleEndEvent.KINDLE_END_EVENT,kindleCenter);
//			
//			for(var i : int = 0;i < exportArr.length;i++) {
//				//如果出口索引就是入口索引，则跳过；
//				if(i == entranceIndex) continue;
//				if(exportArr[i]) {
//					var toPoint : Point;
//					switch(i) {
//						case 0:{toPoint = new Point(this.x-this.width/2,this.y);};break;
//						case 1:{toPoint = new Point(this.x,this.y-this.height/2);};break;
//						case 2:{toPoint = new Point(this.x+this.width/2,this.y);};break;
//						case 3:{toPoint = new Point(this.x,this.y+this.height/2);};break;
//					}
//					
//					var fire : Fire = new Fire();
//					firePane.addChild(fire);
//					fire.kindleTo(toPoint);
//				}
//			}
//		}
		
		/**
		 * 深度查找方法
		 * 
		 */		
		private function changeColor(arrIndexX : int,arrIndexY : int,index : int,fire : Fire=null) : void
		{
			var lead : Lead = leadArr[arrIndexY][arrIndexX];
			//如果当前入口索引是通的
				
			//如果当前检测块的颜色已经是检证过的 则返回
			
			if(lead.exportArr[index]) { //如果和上一个导火线对上了
				if(currentColorFlag == Lead.RED_COLOR) {
					if(leadColorArr[arrIndexY][arrIndexX] == Lead.RED_COLOR ||
						leadColorArr[arrIndexY][arrIndexX] == Lead.ORANGE_COLOR) return;
					
					if(leadColorArr[arrIndexY][arrIndexX] == Lead.YELLOW_COLOR) {
						leadColorArr[arrIndexY][arrIndexX] = Lead.ORANGE_COLOR;
						if(arrIndexX == 0) {
							fireLeadArr.push(arrIndexY);
						} else if(arrIndexX == COL_COUNT-1) {
							fireExportLeadArr.push(arrIndexY);
						}
						
					} else {
						leadColorArr[arrIndexY][arrIndexX] = Lead.RED_COLOR;
					}
				} else if(currentColorFlag == Lead.GREEN_COLOR) {
					//查找到已经燃烧的块
					if(leadColorArr[arrIndexY][arrIndexX] == Lead.GREEN_COLOR) {
						if(fire) {
							firePane.removeChild(fire);
						}
						return;
					}
					leadColorArr[arrIndexY][arrIndexX] = Lead.GREEN_COLOR;
					leadArr[arrIndexY][arrIndexX].currentColorFlag = Lead.GREEN_COLOR;
					if(arrIndexX>0 && arrIndexX < COL_COUNT-1) {
						toDelArr.push(leadArr[arrIndexY][arrIndexX]);
					}
					
//					kindelLead(lead);
				} else {
					if(leadColorArr[arrIndexY][arrIndexX] == currentColorFlag) return;
					
					leadColorArr[arrIndexY][arrIndexX] = currentColorFlag;
				}
				
				if(fire) {
					fire.addEventListener(KindleEndEvent.KINDLE_END_EVENT,
						function kindleCenter(event : KindleEndEvent):void{
							event.target.removeEventListener(KindleEndEvent.KINDLE_END_EVENT,kindleCenter);
							
							for(var i : int = 0;i < lead.exportArr.length;i++) {
								//如果出口索引就是入口索引，则跳过；
								if(i == index) continue;
								if(lead.exportArr[i]) {
									var toPoint : Point;
									switch(i) {
										case 0:{toPoint = new Point(lead.x,lead.y);};break;
										case 1:{toPoint = new Point(lead.x+lead.width/2,lead.y-lead.height/2);};break;
										case 2:{toPoint = new Point(lead.x+lead.width,lead.y);};break;
										case 3:{toPoint = new Point(lead.x+lead.width/2,lead.y+lead.height/2);};break;
									}
									//
									var fire : Fire = new Fire();
									fire.x = event.target.x;
									fire.y = event.target.y;
									fire.dirIndex = i;
									fire.addEventListener(KindleEndEvent.KINDLE_END_EVENT,
										function kindleEnd(event : KindleEndEvent) : void
										{
											event.target.removeEventListener(KindleEndEvent.KINDLE_END_EVENT,kindleEnd);
											if(arrIndexX == 0 && arrIndexY == 3) {
												trace("a");
											}
											deepFind(arrIndexX,arrIndexY,event.target.dirIndex,event.target as Fire);
										});
									firePane.addChild(fire);
									fire.kindleTo(toPoint);
								}
							}
							firePane.removeChild(event.target as Fire);
						});
					fire.kindleTo(new Point(lead.x+lead.width/2,lead.y));
				} else {
					for(var i : int = 0;i < lead.exportArr.length;i++) {
						if(i == index) continue;
						
						deepFind(arrIndexX,arrIndexY,i);
					}
				}
			
			} else { //如果没有和上一个导火线对上
				if(fire) {
					firePane.removeChild(fire);
					fire = null;
				}
			}
		}
		
		private function deepFind(arrIndexX : int,arrIndexY : int,index : int,fire : Fire = null) : void
		{
			if(arrIndexX == 6 && arrIndexY == 0) {
				trace("a");
			}
			
			var lead : Lead = leadArr[arrIndexY][arrIndexX];
			
			if(lead.exportArr[index]) {
				var nextIndexX : int = arrIndexX;
				var nextIndexY : int = arrIndexY;
				switch(index) {
					case 0:{nextIndexX --;};break;
					case 1:{nextIndexY --;};break;
					case 2:{nextIndexX ++;};break;
					case 3:{nextIndexY ++;};break;
				}
				
//				if(nextIndexX >= COL_COUNT) {
//					if(fire) {
//						firePane.removeChild(fire);
//						fire = null;
//						fireExportLeadArr.splice(fireExportLeadArr.indexOf(arrIndexY),1);
//						
//						if(fireExportLeadArr.length<=0) {
//							while(toDelArr.length>0) {
//								var toDelLead : Lead = toDelArr[0];
//								leadPane.removeChild(toDelLead);
//								leadArr[toDelLead.indexY][toDelLead.indexX] = null;
//								toDelArr.splice(0,1);
//							}
//							
//							if(toDelArr.length == 0) {
//								test();
//								createLeadMap();
//							}
//						}
//					}
//				} else {
//					if(nextIndexX < 0) return;
//					
//					if(nextIndexY < 0 || nextIndexY >= ROW_COUNT) {
////						firePane.removeChild(fire);
////						fire = null;
//					} else {
//						var oppIndex : int = index+2;
//						if(oppIndex > lead.exportArr.length-1) {
//							oppIndex -= lead.exportArr.length;
//						}
//						
//						changeColor(nextIndexX,nextIndexY,oppIndex,fire);
//						trace(nextIndexX + "      " + nextIndexY + "      " + index);
//					}
//				}
				
				if(0 <= nextIndexX && nextIndexX < COL_COUNT &&
					0 <= nextIndexY && nextIndexY < ROW_COUNT) {
					var oppIndex : int = index+2;
					if(oppIndex > lead.exportArr.length-1) {
						oppIndex -= lead.exportArr.length;
					}
					
					changeColor(nextIndexX,nextIndexY,oppIndex,fire);
					trace(nextIndexX + "      " + nextIndexY + "      " + index);
				} else {
					if(nextIndexX < 0) return;
					if(fire) {
						if(nextIndexX >= COL_COUNT) {
							fireExportLeadArr.splice(fireExportLeadArr.indexOf(arrIndexY),1);
							
							if(fireExportLeadArr.length<=0) {
								while(toDelArr.length>0) {
									var toDelLead : Lead = toDelArr[0];
									leadPane.removeChild(toDelLead);
									leadArr[toDelLead.indexY][toDelLead.indexX] = null;
									toDelArr.splice(0,1);
								}
								
								if(toDelArr.length == 0) {
									test();
									createLeadMap();
								}
							}
						}
						
						firePane.removeChild(fire);
						fire = null;
					}
				}
			} else {
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
		
		
		private function test() : void
		{
			for(var i : int = 0;i < ROW_COUNT;i ++) {
				var temp : String = "[";
				for(var j : int = 0;j < COL_COUNT;j ++) {
					if(leadArr[i][j]) {
						temp += leadArr[i][j].type + ",";
					} else {
						temp += "^,"
					}
				}
				temp += "]";
				trace(temp);
			}
		}
	}
}