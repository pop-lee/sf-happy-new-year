package element
{
	import flash.display.MovieClip;
	
	import util.GameBase;
	
	public class Character extends MovieClip
	{
		private var posX:int;
		private var posY:int;
		private var length:int;
		private var direction:int;
		private var kind:int;
		private var main:PlayScreen;
		private var base:GameBase = GameBase.getInstance();
		private var nameIdx:int;
		public function Character(main:PlayScreen, posX:int, posY:int, length:int, direction:int, kind:int, nameIdx:int)
		{
			this.main = main;
			this.posX = posX;
			this.posY = posY;
			this.length = length;
			this.direction = direction;
			this.kind = kind;
			this.nameIdx = nameIdx;
			this.gotoAndStop(this.kind);	
			setPosition();
		}
		
		public function setCharacter(posX:int, posY:int, length:int, direction:int, kind:int, nameIdx:int):void
		{
			this.posX = posX;
			this.posY = posY;
			this.length = length;
			this.direction = direction;
			this.kind = kind;
			this.nameIdx = nameIdx;
			this.gotoAndStop(this.kind);	
			setPosition();
		}
		
		public function moveCharacter(hDirection:int, vDirection:int):void
		{
			var mod:int = 0;
			
			var oldPosX:int = this.posX;
			var oldPosY:int = this.posY;
			
			if(this.direction == base.HORIZONTAL)
			{
				this.posX = int(this.x / 72);
				mod = int(this.x % 72);
				
				if(hDirection == base.RIGHT)
				{					
					if(mod > 18)
						this.posX += 1;
				} 
				else
				{
					if(mod > 54)
						this.posX += 1;
				}
				
				if(oldPosX != this.posX)
					this.main.mMoveCount++;
				this.main.updateCounterData();
			}
			
			if(this.direction == base.VERTICAL)
			{
				this.posY = int(this.y / 72);
				mod = int(this.y % 72);
				
				if(vDirection == base.BOTTOM)
				{					
					if(mod > 18)
						this.posY += 1;	
				}
				else
				{
					if(mod > 54)
						this.posY += 1;
				}				
				
				if(oldPosY != this.posY)
					this.main.mMoveCount++;
				this.main.updateCounterData();
			}
			
			setPosition();
		}
		
		public function getPosX():int
		{
			return this.posX;
		}
		
		public function setPosX(posX:int):void
		{
			this.posX = posX; 
		}
		
		public function getPosY():int
		{
			return this.posY;
		}
		
		public function setPosY(posY:int):void
		{
			this.posY = posY;
		}
		
		public function getLength():int
		{
			return this.length;
		}
		
		public function getDirection():int
		{
			return this.direction;
		}
		
		public function getKind():int
		{
			return this.kind;
		}
		
		public function setKind(kind:int):void
		{
			this.kind = kind;
			this.gotoAndStop(this.kind);
		}
		
		public function setPosition():void
		{			
			this.x = this.posX * 72;
			this.y = this.posY * 72;
		}
		
		public function destroy():void
		{
			if (this.parent)
			{
				this.parent.removeChild(this);
			}
		}
		
		public function getNameIdx():int
		{
			return this.nameIdx;
		}
		
		public function animationPlay():void
		{
			
		}
		
		public function animationStop():void
		{
			
		}
	}
}