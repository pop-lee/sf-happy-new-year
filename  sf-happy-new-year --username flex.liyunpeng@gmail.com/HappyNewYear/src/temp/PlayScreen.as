package
{
	import com.greensock.TweenLite;
	import com.greensock.data.TweenLiteVars;
	import com.model.GameLevelModel;
	import com.shared.MyData;
	import com.value.GameValue;
	
	import element.Character;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.media.Camera;
	import flash.net.getClassByAlias;
	import flash.system.System;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.utils.getDefinitionByName;
	
	import gamestage.GameStage;
	
	import imageClass.BeforeStarLevel;
	import imageClass.CatPicture;
	import imageClass.MessageBoxPicture;
	
	import util.CatMessage;
	import util.GameBase;

	//[SWF(width="480",height="800",frameRate="24")]
	
	public class PlayScreen extends MovieClip
	{
		public var btnGoToMenu:SimpleButton;
		public var btnAgain:SimpleButton;
		public var btnSound:MovieClip;
		public var btnBGM:MovieClip;
		private var stageNumber:int;
		private var fialTime:int;
		private var fialCounter:int;
		
		public var str:String;
		public var timeSymbol:TimeSymbol;
		public var counterNumSymbol:CounterSymbol;
		
		private var stageNumSymbol_before:MovieClip;
		private var stageNumSymbol_start:MovieClip;
		
		public var gameTiles:MovieClip;
		public var base:GameBase;
		
		private var tileMap:Array;		
		
		public var chrtArray:Vector.<Character>;
		
		private var eventTarget:String;
		
		private var eventFlag:Boolean = false;
		
		private var offsetX:Number;
		private var offsetY:Number;
		private var winOffsetX:Number;
		private var winOffsetY:Number;
		private var oldX:Number;
		private var oldY:Number;
		
		private var oldPosX:int;
		private var oldPosY:int;
		private var minPos:int;
		private var maxPos:int;
		private var hDirection:int;
		private var vDirection:int;
		private var catIndex:int;
		private var length:int;
		private var direction:int;
		
		private var message:CatMessage;
		
		public var mTime:int;
		public var mMoveCount:int;
		
		private var stageObj:GameStage;
		private var messagetime:int;
		private var sleepTime:int;
		private var beforStartWindow:MovieClip;
		private var startFlag:Boolean=false;
		private var selectWindowFlag:Boolean;
		private var catPicture:MovieClip;
		private var messageBoxPicture:MovieClip;
		private var catMessage:MovieClip;
		private var messagetalkFlag:Boolean;
		
		private var gameTimer:Timer;
		public var valueOfFPS:TextField;
		public var fpsCounter:int;
		private var waitTime:int;
		private var restartFlag:Boolean;
		private var goToBackFlag:Boolean;
		
		
		public var myData:MyData = MyData.getInstance();
		
		private var count:int;
		private var playingChrt:int;
		private var isGameOver:Boolean;
		
		public var isSoundFinished:Boolean;
		
		public function PlayScreen()
		{
			fpsCounter = 0;
			this.addEventListener(Event.ENTER_FRAME, updateFPS);
			waitTime = 0;
			System.gc();
			sleepTime = 0;
			timeSymbol = new TimeSymbol();
			counterNumSymbol = new CounterSymbol();
			beforStartWindow = new BeforeStarLevel();
			catPicture= new CatPicture();
			messageBoxPicture = new MessageBoxPicture();
			catMessage = new CatMessage();
			catMessage.x = 299;
			catMessage.y = 591;			
			
			btnGoToMenu.addEventListener( MouseEvent.MOUSE_DOWN, onDownGoToFirst, false, 0, true );
			btnGoToMenu.addEventListener( MouseEvent.MOUSE_UP, onClickGoToFirst, false, 0, true );
			btnAgain.addEventListener( MouseEvent.MOUSE_DOWN, onDownAgain, false, 0, true );
			btnAgain.addEventListener( MouseEvent.MOUSE_UP, onClickAgain, false, 0, true );
			btnSound.addEventListener( MouseEvent.CLICK, soundEffectControl, false, 0, true );
			btnBGM.addEventListener( MouseEvent.CLICK, bgmControl, false, 0, true );
			
			if (GameSoundObject.BTN_FLG == true)
				btnSound.gotoAndStop(1);
			else
				btnSound.gotoAndStop(2);
			
			if (GameSoundObject.BGM_FLG == true)
				btnBGM.gotoAndStop(1);
			else
				btnBGM.gotoAndStop(2);
			myData = MyData.getInstance();
		}
		public function updateTimeData():void
		{
			str = "";
			var useTime:int;
			var minute:int;
			var second:int;
			
			useTime = 600-mTime;
			minute = int(useTime/60);
			second = (useTime%60);
			
			if (minute < 10)
				str += "0" + minute.toString();
			else
				str += minute.toString();
			if (second < 10)
				str += "0" + second.toString();
			else
				str += second.toString();
			BaseUI.showInfo(timeSymbol, str, "time", 4);
			timeSymbol.x = 62.5;
			timeSymbol.y = 8.5;
			timeSymbol.name = "TIME_SYMBOL";
			if (this.getChildByName("TIME_SYMBOL"))
				this.removeChild(this.getChildByName("TIME_SYMBOL"));
			addChild(timeSymbol);
		}
		public function updateCounterData():void
		{
			BaseUI.showInfo(counterNumSymbol, mMoveCount.toString(), "counterNum", 3);
			counterNumSymbol.x=399;
			counterNumSymbol.y=11;
			counterNumSymbol.name = "COUNTER_SYMBOL";
			if (this.getChildByName("COUNTER_SYMBOL"))
				this.removeChild(this.getChildByName("COUNTER_SYMBOL"));
			addChild(counterNumSymbol);
		}
		
		public function setStageNumber(stageNum:int):void
		{
			stageNumber = stageNum;
			
			updateTimeData();
			updateCounterData();
			
			stageNumSymbol_start = new stageNumSymbol();
			stageNumSymbol_before = new NumberSymbol();
			
			
			BaseUI.showInfo(stageNumSymbol_start, stageNumber.toString(), "stnum", 3);
			BaseUI.showInfo(stageNumSymbol_before, stageNumber.toString(), "num", 3);

			if(int(stageNumber/10)>0){
				stageNumSymbol_start.x=231;
			}else{
				stageNumSymbol_start.x=235;
			}
			if(int(stageNumber/100)>0){
				stageNumSymbol_start.x=225;
			}
			stageNumSymbol_start.y=45;
			
			
			if(int(stageNumber/10)>0){
				stageNumSymbol_before.x=207;
			}else{
				stageNumSymbol_before.x=225;
			}
			if(int(stageNumber/100)>0){
				stageNumSymbol_before.x=185;
			}
			stageNumSymbol_before.y=203;
			
			addChild(stageNumSymbol_start);
			beforStartWindow.addChild(stageNumSymbol_before);
			addChild(beforStartWindow);
			catPicture.x = 17.5;
			catPicture.y = 560;
			addChild(catPicture);
			messageBoxPicture.x = 98;
			messageBoxPicture.y = 554;
			addChild(messageBoxPicture);
			beforStart();		
		}
		
		public function onDownGoToFirst( event:Event ):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			goToBackFlag = true;
		}
		public function onClickGoToFirst( event:Event ):void
		{
			if(goToBackFlag){
				destroy();
				dispatchEvent( new NavigationEvent( NavigationEvent.TOMENU ) );
			}
		}
		public function onDownAgain( event:Event ):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			restartFlag = true;
		}
		public function onClickAgain( event:Event ):void
		{
			if(startFlag && restartFlag){
				if(messagetalkFlag){
					removeChild(catMessage);
				}
				restartLevel();
				initGameState();
				initGame();
				updateTimeData();
				updateCounterData();
			}
		}
		
		public function bgmControl(event:MouseEvent ):void
		{
			if (GameSoundObject.BTN_FLG == true)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			
			switch (GameSoundObject.BGM_FLG)
			{
				case true:
					GameSoundObject.BGM_FLG = false;
					GameSoundObject.BACKGROUND_MUSIC.setVolum(0);
					btnBGM.gotoAndStop(2);
					break;
				case false:
					GameSoundObject.BGM_FLG = true;
					GameSoundObject.BACKGROUND_MUSIC.setVolum(1);
					btnBGM.gotoAndStop(1);
					break;
			}
		}
		
		public function soundEffectControl(event:MouseEvent ):void
		{
			if (GameSoundObject.BTN_FLG == false)
				GameSoundObject.BUTTON_CLICK.playSound(1);
			switch (GameSoundObject.BTN_FLG)
			{
				case true:
					GameSoundObject.BTN_FLG = false;
					btnSound.gotoAndStop(2);
					break;
				case false:
					GameSoundObject.BTN_FLG = true;
					btnSound.gotoAndStop(1);
					break;
			}
		}
		
		private function beforStart():void{
			base = GameBase.getInstance();
			
			catMessage.setMessage(base.MSG_START);
			addChild(catMessage);
			messagetalkFlag = true;
			
			beforStartWindow.addEventListener(MouseEvent.MOUSE_DOWN,widowMouseDown);
			beforStartWindow.addEventListener(MouseEvent.MOUSE_MOVE,widowMouseMove);
			beforStartWindow.addEventListener(MouseEvent.MOUSE_UP,windowMouseUp);
			beforStartWindow.addEventListener(MouseEvent.MOUSE_OUT,windowMouseUp);
			initGameState();
			beforStartWindow.addEventListener(Event.ENTER_FRAME, windowMoveFunc);
		}
		private function initGameState():void{
			mMoveCount = 0;
			mTime = 0;

			tileMap = new Array(36);
			
			eventFlag = false;			
			
			chrtArray = new Vector.<Character>();		
			
			onFormatTileMap();
			
			stageObj = new GameStage(stageNumber, this);
			
			addCharacter();
		
		}
		private var h:Number;
		private function widowMouseDown(event:MouseEvent):void
		{			 
			waitTime = 25;
		}
		private function widowMouseMove(event:MouseEvent):void
		{
			
			var py:Number = event.stageY - winOffsetY;
			if(selectWindowFlag && py < h){				
				beforStartWindow.y = py;
			}			
			
		}
		private function windowMouseUp(event:MouseEvent):void
		{
			selectWindowFlag = false;
		}
		private function windowMoveFunc(event:Event):void
		{
			waitTime++;
			if(waitTime>24){
				beforStartWindow.y -=30;
			}
			if(beforStartWindow.y<-635){				
				this.removeChild(beforStartWindow);
				beforStartWindow.removeEventListener(Event.ENTER_FRAME, windowMoveFunc);
				beforStartWindow.removeChild(stageNumSymbol_before);
				beforStartWindow = null;
				stageNumSymbol_before = null;
				removeChild(catMessage)
				messagetalkFlag = false;
				initGame();
			}
		}
		
		private function initGame():void
		{				
			startFlag = true;
			isGameOver = false;
			goToBackFlag = false;
			restartFlag = false;
			mMoveCount = 0;
			mTime = 0;
			
			GameSound.main = this;
			isSoundFinished = true;
						
			gameTimer = new Timer(1000);
			gameTimer.start();
			
			gameTimer.addEventListener(TimerEvent.TIMER, onTick1, false, 0, true);
			
			gameTiles.addEventListener(MouseEvent.MOUSE_DOWN, mouseEventDown);	
			
			
		}
		
		public function addCollection(chrt:Character):void
		{
			setTileMap(chrt);			
			
			chrtArray.push(chrt);				
		}
		
		public function addCharacter():void
		{			
			var len:int = chrtArray.length;
			for(var i:int=len-1; i>=0; i--)
			{
				chrtArray[i].name = (i).toString();
				gameTiles.addChild(chrtArray[i]);
			}
			
			var rndAnima:int = int(Math.random() * 100) % chrtArray.length;
			
			for (i = 1; i < chrtArray.length; i++ )
			{
				if (i != rndAnima)
					chrtArray[i].animationStop();
			}
			
			count = 0;
			
			this.addEventListener(Event.ENTER_FRAME, playRandomDog);
		}
		
		public function playRandomDog(event:Event):void
		{	
			if(isGameOver)
				this.removeEventListener(Event.ENTER_FRAME, playRandomDog);
			
			if(count % 25 == 0)
			{
				var rnd:int = int(Math.random() * 100) % chrtArray.length;
				
				if(rnd == 0 || playingChrt == rnd)
					rnd = (rnd + 1) % chrtArray.length;
				
				for(var i:int=1; i<chrtArray.length; i++)
				{
					if(i == rnd)
					{
						chrtArray[i].animationPlay();		
					}
					else
					{
						chrtArray[i].animationStop();
					}
				}
				
				playingChrt = rnd;
				
				count = 0;				
			}
			
			count++;			
		}
		
		public function onFormatTileMap():void
		{
			for(var i:int=0; i<tileMap.length; i++)
				tileMap[i] = base.UNSETMAP;	
		}
		
		public function setTileMap(chrt:Character):void
		{
			var pos:int = 0;
			
			for(var j:int=0; j<chrt.getLength(); j++)
			{
				if(chrt.getDirection() == base.HORIZONTAL)
					pos = (chrt.getPosX() + j) * 6 + chrt.getPosY();
				else
					pos = chrt.getPosX() * 6 + (chrt.getPosY() + j);
				
				tileMap[pos] = base.SETMAP;	
			}
		}
		public function updateFPS(event:Event):void
		{
			fpsCounter++;
		}
		
		private function onTick1(event:TimerEvent):void
		{	
			valueOfFPS.text = fpsCounter.toString();
			fpsCounter = 0;
			mTime++;
			messagetime--;
			sleepTime++;
			if(sleepTime==20){
				messagetime=6;
				sleepTime =0;
				catMessage.setMessage(base.MSG_SLEEP);
				addChild(catMessage);
				messagetalkFlag = true;				
			}
			if( (messagetime <= 0) && messagetalkFlag){
				removeChild(catMessage);
				messagetalkFlag = false;				
			}
			if(mTime >= 600)
			{
				if (gameTimer!=null)
				{
					gameTimer.stop();
					gameTimer.removeEventListener(TimerEvent.TIMER, onTick1);
					gameTimer = null;
				}
				mTime = 600;
				isGameOver = true;
				gameOver(base.FAILED);
			}
				updateTimeData();
				
		}
		
		/*----------------------*/
		private function successMoveCat() : void
		{
			var vars : TweenLiteVars = new TweenLiteVars();
			vars.prop("x",480);
			var effect : TweenLite = new TweenLite(chrtArray[0],3,vars);
			effect.play();
		}
		/*----------------------*/
		
		
		
		private function onTick2(event:TimerEvent):void
		{	
			eventFlag = false;
			chrtArray[0].x += 7;		
			
			if(chrtArray[0].x >= 72*6)
			{				
				gameOver(base.SUCCESS);
			}
		}
		
		private function func(event:Event):void
		{
			eventFlag = false;					
			
			if(chrtArray[0].x >= 72*6)
			{				
				chrtArray[0].removeEventListener(Event.ENTER_FRAME, func);
				gameOver(base.SUCCESS);				
			}	
		}
		
		private function mouseEventDown(event:MouseEvent):void
		{					
			if(!startFlag || isGameOver)
				return;
			
			eventTarget = event.target.parent.name;
			
			if(eventTarget.toString() == "gameTiles")
				return;
			
			eventFlag = true;
						
			sleepTime = 0;
			
			trace(isSoundFinished);
			
			if(eventTarget.toString() == "0")
			{			
				chrtArray[0].setKind(3);
				catMessage.setMessage(base.MSG_CATMOVE);
				addChild(catMessage);
				messagetalkFlag = true;				
				messagetime = 6;
				
				if(isCatOk())
				{
					if (GameSoundObject.BTN_FLG == true)
						GameSoundObject.CAT_WIN.playSound(1);
					
					isGameOver = true;
					
					gameTimer.stop();
					gameTimer.removeEventListener(TimerEvent.TIMER, onTick1);
					
					successMoveCat();
					
					chrtArray[0].addEventListener(Event.ENTER_FRAME, func);
					
					return;
				}
			}
			
			
			if (GameSoundObject.BTN_FLG && isSoundFinished)
			{
				switch (chrtArray[int(eventTarget)].getNameIdx())
				{
					case base.CAT:
						GameSoundObject.CAT_CRY.playSound(1);
						break;
					case base.DOG1:
						GameSoundObject.DOG_HORIZONTAL.playSound(1);
						break;
					case base.DOG2:
						GameSoundObject.DOG_HORIZONTAL.playSound(1);
						break;
					case base.DOG3:
						GameSoundObject.DOG_VERTICAL.playSound(1);
						break;
					case base.DOG4:
						GameSoundObject.DOG_VERTICAL.playSound(1);
						break;
				}
			}
			
			oldX = gameTiles.mouseX;
			oldY = gameTiles.mouseY;
			
			offsetX = gameTiles.mouseX - chrtArray[int(eventTarget)].x;
			offsetY = gameTiles.mouseY - chrtArray[int(eventTarget)].y;

			oldPosX = chrtArray[int(eventTarget)].getPosX();
			oldPosY = chrtArray[int(eventTarget)].getPosY();
			length = chrtArray[int(eventTarget)].getLength();
			direction = chrtArray[int(eventTarget)].getDirection();
			
			if(direction == base.HORIZONTAL)
			{
				minPos = minPosX(chrtArray[int(eventTarget)].getPosX(), chrtArray[int(eventTarget)].getPosY());
				maxPos = maxPosX(chrtArray[int(eventTarget)].getPosX(), chrtArray[int(eventTarget)].getPosY(), length);
			}
			else
			{
				minPos = minPosY(chrtArray[int(eventTarget)].getPosX(), chrtArray[int(eventTarget)].getPosY());
				maxPos = maxPosY(chrtArray[int(eventTarget)].getPosX(), chrtArray[int(eventTarget)].getPosY(), length);
			}		
			
			gameTiles.addEventListener(Event.ENTER_FRAME, mouseEventMove);

			gameTiles.addEventListener(MouseEvent.MOUSE_UP, mouseEventUp);
		}
		
		private function mouseEventMove(event:Event):void
		{			
			if(!startFlag || !eventFlag || isGameOver)
				return;
			
			sleepTime = 0;			
			
			if(processEventOut())
				return;
			
			processEventMove();		
			
//			event.updateAfterEvent();
		}
		
		private function mouseEventUp(event:MouseEvent):void
		{
			if(!startFlag || !eventFlag || isGameOver)
				return;
			
			sleepTime = 0;
			
			if(processEventOut())
				return;
			
			processEventUp();
		}
		
		private function processEventMove():void
		{
			if(direction == base.HORIZONTAL)
			{
				var px:Number = gameTiles.mouseX - offsetX;
				
				if(gameTiles.mouseX >= oldX)
					hDirection = base.RIGHT;
				else
					hDirection = base.LEFT;
				
				oldX = gameTiles.mouseX;
				
				if(px >= 0 && px <= 72*(6-length) && int(px/72) >= minPos && int(px/72) < maxPos)
				{
					chrtArray[int(eventTarget)].x = px;
				}
				else
				{
					//					offsetX = gameTiles.mouseX - chrtArray[int(eventTarget)].x;
					
					if(px < 0)				
						chrtArray[int(eventTarget)].x = 0;
					if(px > 72*(6-length))
						chrtArray[int(eventTarget)].x = 72*(6-length);		
					if(int(px/72) < minPos )
						chrtArray[int(eventTarget)].x = 72*minPos;
					if(int(px/72) >= maxPos )
						chrtArray[int(eventTarget)].x = 72*(maxPos);
				}
			}
			
			if(direction == base.VERTICAL)
			{
				var py:Number = gameTiles.mouseY - offsetY;
				
				if(gameTiles.mouseY >= oldY)
					vDirection = base.BOTTOM;
				else
					vDirection = base.TOP;
				
				oldY = gameTiles.mouseY;
				
				if(py >= 0 && py <= 72*(6-length) && int(py/72) >= minPos && int(py/72) < maxPos)	
				{
					chrtArray[int(eventTarget)].y = py;
				}
				else
				{
					//					offsetY = gameTiles.mouseY - chrtArray[int(eventTarget)].y;
					
					if(py < 0)				
						chrtArray[int(eventTarget)].y = 0;
					if(py > 72*(6-length))
						chrtArray[int(eventTarget)].y = 72*(6-length);	
					if(int(py/72) < minPos )
						chrtArray[int(eventTarget)].y = 72*minPos;
					if(int(py/72) >= maxPos )
						chrtArray[int(eventTarget)].y = 72*(maxPos);
				}
			}	
		}
		
		private function processEventOut():Boolean
		{
			if(direction == base.HORIZONTAL)
			{
				if(gameTiles.mouseX<0)
				{
					chrtArray[int(eventTarget)].x = minPos * 72;
					processEventUp();
					return true;
				}
				if(gameTiles.mouseX > 72*6)
				{
					chrtArray[int(eventTarget)].x = maxPos * 72;	
					processEventUp();
					return true;
				}
				if(gameTiles.mouseY<0 || gameTiles.mouseY>72*6)
				{
					processEventUp();
					return true;	
				}
			}
			else
			{
				if(gameTiles.mouseY<0)
				{
					chrtArray[int(eventTarget)].y = minPos * 72;
					processEventUp();
					return true;
				}
				if(gameTiles.mouseY > 72*6)
				{
					chrtArray[int(eventTarget)].y = maxPos * 72;	
					processEventUp();
					return true;
				}
				if(gameTiles.mouseX<0 || gameTiles.mouseX>72*6)
				{
					processEventUp();
					return true;	
				}
			}
			return false;
		}
		
		private function processEventUp():void
		{
			if(eventTarget.toString() == "0")
			{	
				chrtArray[0].setKind(1);
			}
			
			processEventMove();			
			
			eventFlag = false;			
			
			chrtArray[int(eventTarget)].moveCharacter(hDirection, vDirection);
			
			resetMap();		
			
			gameTiles.removeEventListener(Event.ENTER_FRAME, mouseEventMove);
		}
		
		private function resetMap():void
		{			
			var movePos:int = 0;
			
			var posX:int = chrtArray[int(eventTarget)].getPosX();
			var posY:int = chrtArray[int(eventTarget)].getPosY();
			
			if(direction == base.HORIZONTAL)
				movePos = posX - oldPosX;
			else
				movePos = posY - oldPosY;
			
			if(movePos == 0)
				return;
			
			for(var i:int=0; i<chrtArray[int(eventTarget)].getLength(); i++)
			{
				if(chrtArray[int(eventTarget)].getDirection() == base.HORIZONTAL)
					tileMap[(posX+i)*6+posY] = base.SETMAP;
				else
					tileMap[posX*6+posY+i] = base.SETMAP;
			}
			
			if(direction == base.HORIZONTAL)
			{	
				if(movePos != 0)
				{
					for(i=0; i<Math.abs(movePos); i++)
					{
						if(movePos > 0)
							tileMap[(oldPosX+i)*6+posY] = base.UNSETMAP;
						else
							tileMap[(posX+chrtArray[int(eventTarget)].getLength()+i)*6+posY] = base.UNSETMAP;							
					}					
				}
			}
			else
			{	
				if(movePos != 0)
				{
					for(i=0; i<Math.abs(movePos); i++)
					{
						if(movePos > 0)
							tileMap[posX*6+oldPosY+i] = base.UNSETMAP;
						else
							tileMap[posX*6+posY+chrtArray[int(eventTarget)].getLength()+i] = base.UNSETMAP;							
					}										
				}
			}
			
			movePos = 0;	
			
		}
		
		private function minPosX(posX:int, posY:int):int
		{
			var min:int = 0;
			
			if(posX == 0)
				return min;
			
			for(var i:int=posX-1; i>=0; i--) {
				min = i;
				
				if(tileMap[i*6+posY] == base.SETMAP )
				{
					min += 1;
					break;
				}									
			}
			
			return min;
		}
		
		private function maxPosX(posX:int, posY:int, length:int):int
		{
			var max:int = posX;
			
			if(posX+length == 6)
				return max;
			
			for(var i:int=posX; i<=6-length; i++) {
				max = i;
				
				if(tileMap[(i+length)*6+posY] == base.SETMAP)	
					break;				
			}
			
			return max;
		}
		
		private function minPosY(posX:int, posY:int):int
		{
			var min:int = 0;
			
			if(posY == 0)
				return min;
			
			for(var i:int=posY-1; i>=0; i--) {
				min = i;
				
				if(tileMap[posX*6+i] == base.SETMAP )	
				{
					min += 1;
					break;
				}
				
			}
			
			return min;
		}
		
		private function maxPosY(posX:int, posY:int, length:int):int
		{
			var max:int = posY;
			
			if(posY+length == 6)
				return max;
			
			for(var i:int=posY; i<=6-length; i++) {
				max = i;
				
				if(tileMap[posX*6+i+length] == base.SETMAP)	
					break;				
			}
			
			return max;
		}	
		
		private function isCatOk():Boolean
		{
			var posX:int = chrtArray[0].getPosX();
			var len:int = chrtArray[0].getLength();
			
			trace(posX);
			
			for(var i:int=posX+len; i<6; i++)
			{
				if(tileMap[i*6+2] == base.SETMAP)
					return false;
			}
			
			return true;
		}
		
		private function gameOver(gameState:int):void
		{		
			
			if(gameState == base.SUCCESS)
			{
				destroy();
				
				fialTime = mTime;
				fialCounter = mMoveCount;
				
				var gameLevelMode:GameLevelModel = new GameLevelModel(stageNumber, fialTime, fialCounter);
				
				var oldScore:int;
				var newScore:int;
				
				trace(GameValue.GAME_LEVEL.length);
				if (GameValue.GAME_LEVEL.length >= stageNumber)
				{
					oldScore = 1600-(GameValue.GAME_LEVEL[stageNumber-1].getStep())*4 -GameValue.GAME_LEVEL[stageNumber-1].getTime();
					newScore = 1600-fialCounter*4-fialTime;
					if(newScore>oldScore){
						GameValue.GAME_LEVEL[stageNumber-1] = gameLevelMode;
//						GameValue.GAME_LEVEL[stageNumber-1].saveScore();
						
						GameValue.getSumScore()
						
						DataManager.saveLevelData(GameValue.GAME_LEVEL);
						DataManager.saveScore(GameValue.GAME_SCORE);
					}
				}
				else
				{
					GameValue.GAME_LEVEL.push(gameLevelMode);
					GameValue.GAME_LEVEL[stageNumber-1].saveScore();
				}
				
				dispatchEvent( new CatEvent(CatEvent.SUCCESS ) );				
			}
			
			if(gameState == base.FAILED)
			{
				if (GameSoundObject.BTN_FLG ==true)
					GameSoundObject.TimeComplete.playSound(1);
				
				for(var i:int=0; i<chrtArray.length; i++)
				{
					chrtArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, mouseEventDown);
					chrtArray[i].removeEventListener(MouseEvent.MOUSE_UP, mouseEventUp);
					chrtArray[i].setKind(2);
				}
				
				gameTimer = new Timer(2500, 1);
				gameTimer.start();
				gameTimer.addEventListener(TimerEvent.TIMER_COMPLETE, timeUPEvent, false, 0, true);
			}
		}
		
		private function timeUPEvent(event:TimerEvent):void
		{
			dispatchEvent( new CatEvent(CatEvent.TIMEUP ) );
		}
	 
		private function destroy():void
		{
			if(startFlag){
				
				removeChild(stageNumSymbol_start);
				stageNumSymbol_start = null;
				startFlag = false;				
				
				if(gameTimer != null)
					gameTimer.removeEventListener(TimerEvent.TIMER, onTick1);
				if(startFlag){
					GameBase.clear();					
					gameTimer = null;
					beforStartWindow = null;
				}
				
				GameSound.main = null;
				
				for(var i:int=0; i<chrtArray.length; i++)
				{
					chrtArray[i].destroy();		
					chrtArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, mouseEventDown);
					chrtArray[i].removeEventListener(MouseEvent.MOUSE_UP, mouseEventUp);
				}
				chrtArray = null;
				tileMap = null;
				stageObj = null;
				message = null;
				catMessage = null;
				System.gc();						
				removeChild(catPicture);
				catPicture = null;
				removeChild(messageBoxPicture);
				messageBoxPicture = null;
				removeChild(timeSymbol);
				removeChild(counterNumSymbol);
				timeSymbol = null;
				counterNumSymbol = null;
				
			}
			
		}
		private function restartLevel():void
		{			
			if(gameTimer != null)
				gameTimer.removeEventListener(TimerEvent.TIMER, onTick1);
			if(startFlag){
				GameBase.clear();			
				gameTimer = null;
				beforStartWindow = null;
			}
			
			
			
			for(var i:int=0; i<chrtArray.length; i++)
			{
				chrtArray[i].destroy();		
				chrtArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, mouseEventDown);
				chrtArray[i].removeEventListener(MouseEvent.MOUSE_UP, mouseEventUp);
			}
			chrtArray = null;
			tileMap = null;
			stageObj = null;
//			message = null;
//			
//			catMessage = null;
//			removeChild(catPicture);
//			catPicture = null;
//			removeChild(messageBoxPicture);
//			messageBoxPicture = null;
//			removeChild(timeSymbol);
//			removeChild(counterNumSymbol);
//			timeSymbol = null;
//			counterNumSymbol = null;
//			System.gc();						

		}
		public function getFialTime():int{
			return fialTime;
		} 
		public function getFialCounter():int{
			return fialCounter;
		} 
	}
}