/**
	@Name: Debug Trace Tool
	@Author: HobisJung(jhb0b@naver.com)
	@Date: 2016-01-22
	@Comment:
	{
	}
*/
package hb.tools
{
	import flash.system.Capabilities;

	// #
	public final class DebugTool
	{
		public function DebugTool()
		{
		}		

		public static var isDebug:Boolean = true;
		public static var fontMsg:String = '# [hb] ';
		

		public static function test(str:String):void
		{
			if (Capabilities.isDebugger)
			{
				if (isDebug)
				{
					trace(fontMsg + str);
				}
			}
		}
		
	}
}
