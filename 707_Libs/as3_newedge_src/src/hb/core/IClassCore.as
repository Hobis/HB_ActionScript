/**
	@Name: IClassCore
	@Author: HobisJung(jhb0b@naver.com)
	@Date: 2013-04-17
	@Comment:
	{
	}
*/
package hb.core
{
	public interface IClassCore
	{
		function dispatch_callBack(eObj:Object):void;
		function set_callBack(f:Function):void;
		
		function dispose():void;
	}
}
