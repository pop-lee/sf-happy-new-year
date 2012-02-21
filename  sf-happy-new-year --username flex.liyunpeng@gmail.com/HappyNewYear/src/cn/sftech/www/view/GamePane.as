package cn.sftech.www.view
{
	import cn.sftech.www.effect.SFMoveEffect;
	import cn.sftech.www.effect.base.SFEffectBase;
	import cn.sftech.www.events.KindleEndEvent;
	import cn.sftech.www.model.GameConfig;
	import cn.sftech.www.model.ModelLocator;
	import cn.sftech.www.object.Coin;
	import cn.sftech.www.object.Cracker;
	import cn.sftech.www.object.Fire;
	import cn.sftech.www.object.Lead;
	import cn.sftech.www.object.Matches;
	import cn.sftech.www.util.MathUtil;
	
	import com.greensock.easing.Quart;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	import flash.utils.setTimeout;

	public class GamePane extends SFContainer
	{
		private var fireworksPane : FireworksPane;
		
		private var pillarPane : MovieClip;
		
		private var leadPane : SFContainer;
		//盖子
		private var coverPane : CoverPane;
		
		private var maskPane : MaskPane;
		
		private var lightBox : LightBox;
		
		private var firePane : SFContainer;
		
		private var helpPage : MovieClip;
		
		private const BASE_X : uint = 40;
		
		private const BASE_Y : uint = 298;
		
		private const CRE_Y : uint = 190;
		
		private const COL_COUNT : uint = 8;
		
		private const ROW_COUNT : uint = 9;
		//------ Config --------------------------------
		
		private var gameTimerLine : uint;
		
		/**
		 * 游戏计时器
		 */		
		private var gameTimer : Timer;
		/**
		 * 火柴数量
		 */		
		private var matchesCount : uint = 0;
		
		//-------Mode ----------------------------------
		
		private var _model : ModelLocator = ModelLocator.getInstance();
		
		private var leadArr : Vector.<Vector.<Lead>>;
		/**
		 * 爆竹列表
		 */		
		private var crackerArr : Vector.<Cracker>;
		/**
		 * 记录导火线颜色标记
		 */		
		private var leadColorArr : Vector.<Vector.<uint>>;
		/**
		 * 记录已检测通过的导火线索引
		 */		
		private var fireLeadArr : Vector.<uint>;
		/**
		 * 要燃烧的出口导火索索引
		 */		
		private var fireExportLeadArr : Vector.<uint>;
		/**
		 * 要删除的导火线
		 */		
		private var toDelArr : Vector.<Lead>;
		/**
		 * 当前颜色标记
		 */		
		private var currentColorFlag : uint = 1;
		/**
		 * 标记当前是否在点燃状态
		 */
		private var isFiring : Boolean = false;
		/**
		 * 是否在创建状态
		 */		
		private var isCreating : Boolean = false;
		/**
		 * 是否在暂停状态
		 */		
		private var isPausing : Boolean = false;
		/**
		 * 准备点火倒计时
		 */		
		private var fireTimer : Timer = new Timer(500,1);
		/**
		 * 创建金币计时器
		 */		
		private var createCoinTimer : Timer = new Timer(1000,1);
		/**
		 * 已经点燃的数量
		 */		
		private var firedCount : uint = 0;
		/**
		 * 一批以创建的个数计数
		 */		
		private var createBatchCount : uint = 0;
		/**
		 * 连击次数
		 */		
		private var batterCount : int = 0;
		/**
		 * 当前爆竹指向索引
		 */		
		private var currentCrackerIndex : uint = Math.ceil((ROW_COUNT-1)/2);
		
		private var rotationEffect : SFEffectBase = new SFEffectBase();
		/**
		 * 游戏帮助到第几步索引
		 */		
		private var gameHelpIndex : uint = 1;
		//------------Score comp------------
		/**
		 * 记录单词收集的硬币数
		 */		
		private var colletCoinCount : uint = 0;
		/**
		 * 临时记录分数
		 */		
		private var tempScore : uint = 0;
		
		////////////////////
		private var mapData : Array = [
//				[3,1,1,1,1,1],
//				[3,1,1,1,2,1],
//				[2,2,2,4,1,2],
//				[1,1,1,1,1,2],
//				[2,2,2,1,3,2],
//				[4,4,1,2,1,2],
//				[1,1,2,1,2,2],
//				[2,1,2,1,2,3],
//				[1,3,1,1,2,1]
				
				[4,1,4,2,2,1],
				[1,2,1,4,3,1],
				[1,1,1,1,2,1],
				[1,1,2,1,2,1],
				[2,2,2,2,1,1],
				[1,1,1,1,1,2],
				[1,1,1,1,2,2],
				[2,1,2,1,2,3],
				[1,3,1,1,2,1]
			];
		
		private var leadAngleArr : Array = [
//				[1,1,1,1,1,1],
//				[1,1,1,1,1,1],
//				[3,1,4,1,2,1],
//				[1,2,2,2,2,1],
//				[1,3,2,2,1,1],
//				[1,1,1,3,2,3],
//				[1,1,4,1,2,1],
//				[3,1,2,1,1,1],
//				[1,1,1,1,1,1]
				
				[3,4,3,1,2,2],
				[3,1,3,3,1,2],
				[3,3,3,1,1,1],
				[3,2,3,2,1,1],
				[4,1,4,1,1,2],
				[3,2,4,2,2,1],
				[3,1,4,3,1,4],
				[3,1,2,1,3,4],
				[3,4,1,1,2,1]
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
			this.backgroundAlpha = 0;
			this.backgroundImage = gamePaneBackground;
			initData();
			initUI();
			initEvent();
			
			initMode();
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
			
			crackerArr = new Vector.<Cracker>(ROW_COUNT);
			
			rotationEffect.duration = 0.3;
			
		}
		
		/**
		 * 初始化界面
		 */		
		private function initUI() : void
		{
			fireworksPane = new FireworksPane();
			fireworksPane.mouseEnabled = false;
			
			pillarPane = new PillarPane();
			
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
			
			maskPane = new MaskPane();
			maskPane.mouseEnabled = false;
			maskPane.moneyScore = _model.correntMoneyScore;
			maskPane.gameScore = _model.gameScore;
			maskPane.boxBtn.addEventListener(MouseEvent.CLICK,buyCracker);
//			coinPane.mouseEnabled = false;
			lightBox = new LightBox();
			lightBox.x = 29;
			lightBox.y = 245;
			maskPane.addChild(lightBox);
			
			this.addChild(pillarPane);
			this.addChild(leadPane);
			this.addChild(coverPane);
			this.addChild(firePane);
			this.addChild(maskPane);
			this.addChild(fireworksPane);
			createEntrance();
			createExport();
			createCracker();
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
			createCoinTimer.addEventListener(TimerEvent.TIMER_COMPLETE,createCoinAndMatchesHandle);
		}
		/**
		 * 
		 * 
		 */
		private function initMode() : void
		{
			switch(_model.currentGameMode) {
				case GameConfig.NORAML_MODEL:{
					switch(_model.currentDifficultyMode) {
						case GameConfig.EASY_TYPE:{gameTimerLine = 100};break;
						case GameConfig.NORMAL_TYPE:{gameTimerLine = 90};break;
						case GameConfig.HARD_TYPE:{gameTimerLine = 80};break;
					}
					gameTimer = new Timer(1000);
					gameTimer.addEventListener(TimerEvent.TIMER,gameTimerHandle);
					gameTimer.start();
					maskPane.propsIcon = _model.currentGameMode;
				};break;
				case GameConfig.STRATEGY_MODEL: {
					lightBox.process = 1;
					matchesCount = 10;
					maskPane.propsIcon = _model.currentGameMode;
					switch(_model.currentDifficultyMode) {
						case GameConfig.EASY_TYPE:{matchesCount = 10};break;
						case GameConfig.NORMAL_TYPE:{matchesCount = 8};break;
						case GameConfig.HARD_TYPE:{matchesCount = 6};break;
					}
					
					maskPane.propsCount = matchesCount;
				};break;
			}
		}
		
		private function gameTimerHandle(event : TimerEvent) : void
		{
			lightBox.process = gameTimer.currentCount / gameTimerLine;
			if(gameTimer.currentCount == gameTimerLine) {
				gameOver();
				gameTimer.stop();
				gameTimer.removeEventListener(TimerEvent.TIMER,gameTimerHandle);
			}
		}
		
		/**
		 * 创建入口导火线
		 * 
		 */		
		private function createEntrance() : void
		{
			for(var i : int = 0;i < ROW_COUNT;i++) {
				var lead : Lead = new Lead();
				lead.type = 5;
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
				lead.type = 5;
				rotationLead(lead,3);
				lead.x = BASE_X + Lead.LEAD_SIZE*(COL_COUNT-1);
				lead.y = BASE_Y + Lead.LEAD_SIZE*i;
				leadArr[i][COL_COUNT-1] = lead;
				leadPane.addChild(lead);
			}
		}
		
		private function createCracker() : void
		{
			for(var i : int = 0;i < ROW_COUNT;i++) {
				var cracker : Cracker = new Cracker();
				cracker.type = 1;
				cracker.x = BASE_X + Lead.LEAD_SIZE*(COL_COUNT) - 10;
				cracker.y = BASE_Y + Lead.LEAD_SIZE*(i + 0.5);
				crackerArr[i] = cracker;
				firePane.addChild(cracker);
			}
		}
		
		/**
		 * 在舞台创建导火索地图
		 * 
		 */		
		private function createLeadMap() : void
		{
			createCoinTimer.stop();
			
			for(var j : int = 1;j < COL_COUNT-1;j ++) {
				for(var i : int = ROW_COUNT-1;i >= 0;i --) {
					if(leadArr[i][j] == null) {
						isCreating = true;
						createLead4Column(j,i);
//						hasBlank = true;
						break;
					}
				}
			}
			
			mapData = null;
			isFiring = false;
			fireLeadArr = new Vector.<uint>();
			fireExportLeadArr = new Vector.<uint>();
			
		}
		
		/**
		 * 相隔一定时间后创建金币
		 * @param event
		 * 
		 */		
		private function createCoinAndMatchesHandle(event : TimerEvent) : void
		{
			createCoinAndMatchesByBatter();
		}
		/**
		 * 根据连击次数创建金币和火柴
		 * @param batterCount 连击次数
		 * 
		 */		
		private function createCoinAndMatchesByBatter() : void
		{
			switch(this.batterCount) {
				case 1:{null;};break;
				case 2:{createCoin(2,1)};break;
				case 3:{createCoin(3,1),createCoin(1,1)};break;
				case 4:{createCoin(4,1),createCoin(1,2)};break;
				case 5:{createCoin(4,2)};break;
				case 6:{createCoin(4,3)};break;
				case 7:{createCoin(4,4)};break;
				case 8:{createCoin(4,5)};break;
				case 9:{createCoin(4,6)};break;
			}
			if(_model.currentGameMode == GameConfig.STRATEGY_MODEL) {
				createMatches(this.batterCount-2);
			}
			this.batterCount = 0;
		}
		
		/**
		 * 执行创建金币
		 * @param type 创建金币的类型
		 * @param count 创建金币的数量
		 * 
		 */		
		private function createCoin(type : uint , count : int) : void
		{
			
			for(var i : int = 0;i < count;i++) {
				var coin : Coin = new Coin();
				coin.type = type;
				
				var indexX : uint = MathUtil.random(1,COL_COUNT-1);
				var indexY : uint = MathUtil.random(0,ROW_COUNT-1);
				if(leadArr[indexY][indexX].coin || leadArr[indexY][indexX].matches) {
					i--;
				} else {
					leadArr[indexY][indexX].coin = coin;
				}
			}
		}
		
		private function createMatches(count : int) : void
		{
			for(var i : int = 0;i < count;i++) {
				var matches : Matches = new Matches();
				
				var indexX : uint = MathUtil.random(1,COL_COUNT-1);
				var indexY : uint = MathUtil.random(0,ROW_COUNT-1);
				if(leadArr[indexY][indexX].matches || leadArr[indexY][indexX].coin) {
					i--;
				} else {
					leadArr[indexY][indexX].matches = matches;
				}
			}
		}
		
		/**
		 * 创建导火索的效果
		 * @param lead 需要创建在二维数组中指定位置的导火索
		 * 
		 */		
		private function createLeadEffect(lead : Lead) : void
		{
//			lead.x = BASE_X + Lead.LEAD_SIZE*indexX;
//			lead.y = BASE_Y + Lead.LEAD_SIZE*indexY;
			
			var moveEffect : SFMoveEffect = new SFMoveEffect();
			moveEffect.target = lead;
			moveEffect.duration = (BASE_Y + Lead.LEAD_SIZE*lead.indexY - lead.y)/500 + 0.3;
			moveEffect.vars.ease(Quart.easeIn);
			moveEffect.yTo = BASE_Y + Lead.LEAD_SIZE*lead.indexY;
			moveEffect.vars.onComplete(
				function onCompleteHandle() : void{
					if(lead.indexY == 0) { 
						createBatchCount++;
						if(createBatchCount == COL_COUNT-2) { //全部创建完
							isCreating = false;
							createCoinTimer.reset();
							createCoinTimer.start();
							createBatchCount = 0;
							checkGame();
						}
					}
				});
			moveEffect.play();
		}
		
		/**
		 * 根据列来创建导火索
		 * @param indexX 创建所在的indexX列
		 * @param indexY 从指定的Y索引开始创建
		 * 
		 */		
		private function createLead4Column(indexX : uint,indexY : uint) : void
		{
			var blankBlockCount : uint = 0;
			if(mapData) { //如果有现有地图数据
				blankBlockCount = ROW_COUNT;
				for(var a : int = ROW_COUNT-1;a >= 0; a--) {
					var lead : Lead = new Lead();
					lead.type = mapData[a][indexX-1];
					rotationLead(lead,leadAngleArr[a][indexX-1]);
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
						createLeadEffect(leadArr[i+blankBlockCount][indexX]);
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
					leadAngleArr[k][indexX] = MathUtil.random(1,5);
					rotationLead(creLead,leadAngleArr[k][indexX]);
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
					createLeadEffect(curlead);
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
			hideHelp();
			
			if(isFiring||isCreating||isPausing) return;
			
			if(this.mouseX < BASE_X+Lead.LEAD_SIZE || this.mouseX > BASE_X + (Lead.LEAD_SIZE*COL_COUNT-2) ||
				this.mouseY < BASE_Y || this.mouseY > BASE_Y + Lead.LEAD_SIZE*ROW_COUNT) {
				return;
			}
			
			createCoinAndMatchesByBatter();
//			batterCount = 0;
			firedCount = 0;
			fireTimer.stop();
			createCoinTimer.stop();
			toDelArr = new Vector.<Lead>();
			
			var lead : Lead = getLead(this.mouseX,this.mouseY);
			rotationLead(lead,2);
			leadAngleArr[lead.indexY][lead.indexX] = lead.angle;
			
			checkGame();
			
			test();
		}
		/**
		 * 旋转导火索
		 * @param lead 需要旋转的导火索对象
		 * @param count 旋转count-1次数
		 * 
		 */		
		private function rotationLead(lead : Lead,count : uint) : void
		{
			for(var i : int = 1;i < count;i++) {
				lead.rotationLead(rotationEffect);
			}
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
		 * 买爆竹
		 * @param event
		 * 
		 */		
		private function buyCracker(event : MouseEvent) : void
		{
			if(maskPane.moneyScore < 5) return;
			
			maskPane.buyCracker(crackerArr[currentCrackerIndex]);
			
			var middleIndex : uint = Math.ceil((ROW_COUNT-1)/2);
			
			if(currentCrackerIndex == ROW_COUNT-1) {
				currentCrackerIndex = middleIndex;
			} else {
				if(currentCrackerIndex >= middleIndex) {
					currentCrackerIndex = 2*middleIndex-currentCrackerIndex-1;
				} else {
					currentCrackerIndex = 2*middleIndex-currentCrackerIndex;
				}
			}
			
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
			
			showHelp();
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
		/**
		 * 经过一定时间开始点燃
		 * @param event 经过一定时间后触发的计时器事件
		 * 
		 */		
		private function startKindle(event : TimerEvent) : void
		{
			isFiring = true;
			currentColorFlag = Lead.GREEN_COLOR;
			
			//当前模式为策略模式  并且不属于连续消除的情况下，消耗一根火柴
			if(_model.currentGameMode == GameConfig.STRATEGY_MODEL && this.batterCount == 0) { 
				matchesCount --;
				maskPane.propsCount = matchesCount;
			}
			
			for(var i : int = 0;i < fireLeadArr.length;i++) {
				var fire : Fire = new Fire();
				fire.x = leadArr[fireLeadArr[i]][0].x;
				fire.y = leadArr[fireLeadArr[i]][0].y;
				fire.dirIndex = 0;
				firePane.addChild(fire);
				changeColor(0,fireLeadArr[i],0,fire);
			}
		}
		
		/**
		 * 查询后改变颜色
		 * @param arrIndexX 在导火索地图中的X索引
		 * @param arrIndexY 在导火索地图中的Y索引
		 * @param index 导火索入口方向
		 * @param fire 传递火，若为null则仅查找，若不为null，则点燃传递
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
						
						if(arrIndexX == 4 && arrIndexY == 2) {
							trace("a");
						}
//						if(arrIndexX>0 && arrIndexX < COL_COUNT-1) {
							trace(arrIndexY + " ----" + arrIndexX);
							toDelArr.push(lead);
//						}
						
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
					lead.currentColorFlag = Lead.GREEN_COLOR;
					if(lead.coin) { //如果当前导火索上有金币
						maskPane.moneyScore += lead.coin.coinScore;
						maskPane.colletCoin(lead);
						colletCoinCount ++;
					}
					if(lead.matches) { //如果当前导火索上有火柴
						matchesCount ++;
						maskPane.propsCount = matchesCount;
						maskPane.colletMatches(lead);
					}
					
					firedCount++;
					
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
		
		/**
		 * 深度查找方法
		 * 
		 */	
		private function deepFind(arrIndexX : int,arrIndexY : int,index : int,fire : Fire = null) : void
		{
			if(arrIndexX == 5 && arrIndexY == 5) {
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
				
				if(0 <= nextIndexX && nextIndexX < COL_COUNT &&
					0 <= nextIndexY && nextIndexY < ROW_COUNT) {
					var oppIndex : int = index+2;
					if(oppIndex > lead.exportArr.length-1) {
						oppIndex -= lead.exportArr.length;
					}
					
					changeColor(nextIndexX,nextIndexY,oppIndex,fire);
//					trace(nextIndexX + "      " + nextIndexY + "      " + index);
				} else {
					if(nextIndexX < 0) return;
					if(fire) {
						if(nextIndexX >= COL_COUNT) {  //燃烧到导火线尾部
							crackerArr[arrIndexY].kindleCracker();
							tempScore += crackerArr[arrIndexY].type*GameConfig.CRACKER_SCORE;
							batterCount ++;
						}
						
						firePane.removeChild(fire);
						fire = null;
					}
				}
			} else {
				if(fire) {
					firePane.removeChild(fire);
					fire = null;
				}
			}
			
			if(firedCount>0 && firedCount == toDelArr.length) { //当所有的绿色导火索都被燃烧 则开始创建
				firedCount = 0;
				//						if(fireExportLeadArr.length<=0) {
				while(toDelArr.length>0) { //把以点燃的导火线删除
					var toDelLead : Lead = toDelArr[0];
					if(toDelLead.indexX>0 && toDelLead.indexX < COL_COUNT-1) {
						leadPane.removeChild(toDelLead);
						leadArr[toDelLead.indexY][toDelLead.indexX] = null;
					}
					toDelArr.splice(0,1);
					
				}
				
				if(toDelArr.length == 0) {
					test();
					createLeadMap();
					
					maskPane.gameScore += tempScore * (colletCoinCount<1?1:colletCoinCount);
					
					kindleFireworks(batterCount);
				}
				//						}
			}
		}
		
		private function kindleFireworks(count : uint) : void
		{
			for(var i : int = 0;i < count;i++) {
				setTimeout(fireworksPane.kindleFireworks,300*i);
//				maskPane.kindleFireworks();
			}
		}
		/**
		 * 检测游戏通过
		 * 
		 */		
		private function checkSuccess() : void
		{
			
		}
		/**
		 * 游戏结束方法
		 * 
		 */		
		private function gameOver() : void
		{
			
		}
		
		private function showHelp() : void
		{
			if(_model.showHelp) {
				gameTimer.stop();
				switch(gameHelpIndex) {
					case 1:{
						helpPage = new Help1();
						maskPane.addChild(helpPage);
					};break;
					case 2:{
						helpPage = new Help2();
						maskPane.addChild(helpPage);
					};break;
					case 3:{
						helpPage = new Help3();
						maskPane.addChild(helpPage);
					};break;
					case 4:{
						if(_model.currentGameMode == 1) {
							helpPage = new Help4();
							maskPane.addChild(helpPage);
						} else {
							helpPage = new Help7();
							maskPane.addChild(helpPage);
						}
					};break;
					case 5:{
						helpPage = new Help5();
						maskPane.addChild(helpPage);
					};break;
					case 6:{
						helpPage = new Help6();
						maskPane.addChild(helpPage);
					};break;
					default:{
						closeHelp();
					}break;
				}
				
				gameHelpIndex++;
			}
		}
		
		private function closeHelp() : void
		{
			_model.showHelp = false;
			gameTimer.start();
		}
		
		private function hideHelp(event : MouseEvent = null) : void
		{
			if(helpPage) {
				maskPane.removeChild(helpPage);
				helpPage = null;
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
			trace("---------------map------------");
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
			trace("---------------map------------");
			
			trace("---------------rotation------------");
			for(var m : int = 0;m < ROW_COUNT;m ++) {
				var temp2 : String = "[";
				for(var n : int = 0;n < COL_COUNT;n ++) {
					if(leadArr[m][n]) {
						temp2 += leadArr[m][n].angle + ",";
					} else {
						temp2 += "^,"
					}
				}
				temp2 += "]";
				trace(temp2);
			}
			trace("---------------rotation------------");
		}
	}
}