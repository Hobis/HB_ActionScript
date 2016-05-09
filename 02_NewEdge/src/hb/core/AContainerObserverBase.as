package hb.core
{
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Hobis
	 * @name Abstract Base Class
	 * 
	 */
	public class AContainerObserverBase implements IContainerObserver, ICallBack
	{
		// ::
		public function AContainerObserverBase(cont:DisplayObjectContainer) 
		{
			this._cont = cont;			
		}
		
		// - 컨테이너
		private var _cont:DisplayObjectContainer = null;
		public function get_container():DisplayObjectContainer
		{
			return this._cont;
		}
		
		// - 콜백 기본
		private var _callBack:Function = null;
		public function dispatch_callBack(eObj:Object):void
		{
			if (_callBack == null) return;
			_callBack(eObj);
		}
		public function set_callBack(f:Function):void
		{
			_callBack = f;
		}
	}
}
