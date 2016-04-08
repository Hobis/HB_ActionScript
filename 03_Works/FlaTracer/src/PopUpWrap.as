/**
@Name: PopUpWrap
@Author: HobisJung
@Date: 2015-10-04
@Comment:
{
}
==================================================================================================== */
package
{
	import flash.display.MovieClip;

	public final class PopUpWrap
	{
		public function PopUpWrap(target:MovieClip)
		{
			_target = target;
			this.close();
		}
		
		private var _target:MovieClip = null;
		public function get_target():MovieClip
		{
			return _target;
		}


		public function close():void
		{
			_target.gotoAndStop('#_0');
		}
		
		public function open(fl:String):void
		{
			_target.gotoAndStop(fl);
			p_callBack_call({type: CBT_OPEN, target: _target});
		}
		
		
		public static const CBT_OPEN:String = 'open';
		
		private var _callBack:Function = null;
		private function p_callBack_call(eObj:Object):void
		{
			if (_callBack != null)
			{
				_callBack(eObj);
			}
		}		
		
		public function get_callBack():Function
		{
			return _callBack;
		}

		public function set_callBack(f:Function):void
		{
			_callBack = f;
		}
	}
}
