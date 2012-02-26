package com.shared
{
	import flash.net.SharedObject;

	public class MySave
	{
		public static var shareobj:SharedObject;
		
		public function MySave()
		{
		}
		
		//초기화 
		static public function init(savename:String):void
		{
			shareobj = SharedObject.getLocal(savename);
		}
		//변수존재여부 Get
		static public function exist(varname:String):Boolean
		{
			return Boolean(shareobj && shareobj.data[varname]);
		}
		//SharedObj에 등록된 자료 삭제
		static public function clear():void
		{
			if (shareobj)
			{
				shareobj.clear();
			}
		}
		//변수이름에 해당한 자료기록
		static public function setdata(varname:String,vardata:Array):void
		{
			shareobj.data[varname] = vardata;
		}
		
		//SharedObj기록
		static public function save():void
		{
			shareobj.flush();
		}
		
		//변수삭제
		static public function cleardata(varname:String):void
		{
			shareobj.data[varname] = null;
			delete shareobj.data[varname];
		}
		
		//해당 등록된 변수에 해당한 값 Get
		static public function getdata(varname:String):Array
		{
			return shareobj.data[varname];
		} 
	}
}