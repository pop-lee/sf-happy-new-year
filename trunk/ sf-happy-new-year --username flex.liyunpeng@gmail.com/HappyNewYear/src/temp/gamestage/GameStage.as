package gamestage
{
	import element.Cat;
	import element.Character;
	import element.Dog1;
	import element.Dog2;
	import element.Dog3;
	import element.Dog4;
	
	import util.GameBase;

	public class GameStage
	{
		private var collectCharacter:Array;		
		private var main:PlayScreen = null;
		
		public function GameStage(numStage:int, main:PlayScreen)
		{			
			this.collectCharacter = new Array();			
			this.main = main;
			
			switch(numStage)
			{
				case 1:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(2, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(0, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 2:
				{			
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(3, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 1, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(4, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);	
					break;
				}
				case 3:
				{			
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					break;
				}
				case 4:
				{		
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);			
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 5:
				{		
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);			
					addCollectable(2, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 6:
				{		
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(3, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);			
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);						
					addCollectable(5, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 7:
				{			
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);			
					addCollectable(3, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);						
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);			
					addCollectable(0, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(3, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 8:
				{			
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);			
					addCollectable(0, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);	
					break;
				}
				case 9:
				{			
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);	
					break;
				}
				case 10:
				{				
					addCollectable(3, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);			
					addCollectable(0, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);	
					break;
				}		
				case 11:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);			
					addCollectable(2, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(3, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(4, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 12:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);						
					addCollectable(1, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 13:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 14:
				{
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);			
					addCollectable(0, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(1, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(4, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 15:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);						
					addCollectable(0, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					break;
				}
				case 16:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);			
					addCollectable(3, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);	
					break;
				}
				case 17:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);								
					addCollectable(0, 1, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					break;
				}
				case 18:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);								
					addCollectable(0, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(3, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);	
					break;
				}
				case 19:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);													
					addCollectable(2, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(1, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 20:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);										
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 21:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);										
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 22:
				{
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(3, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);										
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(1, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 23:
				{
					addCollectable(3, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);													
					addCollectable(1, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 24:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 25:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);					
					break;
				}
				case 26:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(3, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(2, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(4, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);	
					break;
				}
				case 27:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					break;
				}
				case 28:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(3, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(1, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);	
					break;
				}
				case 29:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);	
					break;
				}
				case 30:
				{
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);										
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);	
					break;
				}
				case 31:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(0, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 32:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 33:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(0, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 34:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(2, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 35:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 1, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);	
					break;
				}
				case 36:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(3, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);	
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);	
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 37:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);		
					break;
				}
				case 38:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(3, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 39:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(0, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 40:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					break;
				}
				case 41:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(1, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 42:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(3, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(3, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(0, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 43:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					break;
				}
				case 44:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);					
					break;
				}
				case 45:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(1, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 46:
				{
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(3, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(0, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(1, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(2, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 47:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);					
					break;
				}
				case 48:
				{
					addCollectable(3, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(3, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 49:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(0, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(3, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 50:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 1, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(4, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 51:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(3, 1, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);					
					break;
				}
				case 52:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);	
					addCollectable(1, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);	
					break;
				}
				case 53:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);					
					break;
				}
				case 54:
				{
					addCollectable(3, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(2, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 55:
				{
					addCollectable(3, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(0, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);					
					break;
				}
				case 56:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 57:
				{
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(2, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 58:
				{
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);										
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(3, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 59:
				{
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);										
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 60:
				{
					addCollectable(3, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(3, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(2, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 61:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(1, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);					
					break;
				}
				case 62:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);										
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(4, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 63:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(3, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 64:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);					
					addCollectable(0, 1, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(4, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(0, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 65:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);										
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(2, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(3, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 66:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(4, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 67:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(3, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);					
					break;
				}
				case 68:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(3, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 69:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(0, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 70:
				{
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 71:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 72:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 73:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 74:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 75:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(3, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(4, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);					
					addCollectable(3, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 76:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 77:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 78:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 79:
				{
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 80:
				{
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);					
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 81:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					break;
				}
				case 82:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					break;
				}
				case 83:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					break;
				}
				case 84:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 85:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(3, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 86:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 87:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(3, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 88:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					break;
				}
				case 89:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					
					break;
				}
				case 90:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					
					break;
				}
				case 91:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(3, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 92:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(2, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 93:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(4, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					break;
				}
				case 94:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					break;
				}
				case 95:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 1, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					break;
				}
				case 96:
				{
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 0, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 2, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(4, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 97:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 98:
				{
					addCollectable(2, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(1, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(4, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 99:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(4, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 100:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 101:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 102:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					break;
				}
				case 103:
				{
					addCollectable(1, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 104:
				{
					addCollectable(3, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 1, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(3, 3, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 105:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(1, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(4, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 5, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 1, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 106:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(1, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 0, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(0, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					break;
				}
				case 107:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(2, 4, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(0, 3, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(1, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 0, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(3, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					addCollectable(5, 1, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
				case 108:
				{
					addCollectable(0, 2, 2, this.main.base.HORIZONTAL, this.main.base.CAT);
					addCollectable(0, 5, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(2, 3, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 1, 2, this.main.base.HORIZONTAL, this.main.base.DOG1);
					addCollectable(3, 4, 3, this.main.base.HORIZONTAL, this.main.base.DOG2);
					addCollectable(0, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(1, 3, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 1, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(2, 4, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(4, 2, 2, this.main.base.VERTICAL, this.main.base.DOG3);
					addCollectable(5, 0, 3, this.main.base.VERTICAL, this.main.base.DOG4);
					break;
				}
			}
		}
		
		public function addCollectable(px:int, py:int, l:int, d:int, c:int):void
		{			
			switch(c)
			{
				case this.main.base.CAT:
				{
					main.addCollection(Character(new Cat(this.main, px, py, l, d, 1, this.main.base.CAT)));
					break;
				}
				case this.main.base.DOG1:
				{
					main.addCollection(Character(new Dog1(this.main, px, py, l, d, 1, this.main.base.DOG1)));
					break;
				}
				case this.main.base.DOG2:
				{
					main.addCollection(Character(new Dog2(this.main, px, py, l, d, 1, this.main.base.DOG2)));
					break;
				}
				case this.main.base.DOG3:
				{
					main.addCollection(Character(new Dog3(this.main, px, py, l, d, 1, this.main.base.DOG3)));
					break;
				}
				case this.main.base.DOG4:
				{
					main.addCollection(Character(new Dog4(this.main, px, py, l, d, 1, this.main.base.DOG4)));
					break;
				}
			}
		}		
	}
}