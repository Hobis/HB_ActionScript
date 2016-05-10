/**
@Name: Scrolling
@Author: HobisJung
@Date: 2015-10-04
@Comment:
{
}
==================================================================================================== */
package hbworks.whats
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import hbworks.uilogics.SliderFrameLogic;
	import hb.utils.ObjectUtil;
	
	


	public final class Scrolling
	{
		public function Scrolling(target:MovieClip)
		{
			_target = target;
			_slider = _target.slider_1;
			_sbt1 = _target.sbt_1;
			_sbt2 = _target.sbt_2;
			
			_slf = new SliderFrameLogic(_slider, SliderFrameLogic.TYPE_VERTICAL, 10);
			_slf.set_callBack(p_slf_callBack);
			
			_sbt1.addEventListener(MouseEvent.MOUSE_DOWN, p_sbts_mouseDown);
			_sbt2.addEventListener(MouseEvent.MOUSE_DOWN, p_sbts_mouseDown);			
		}
		
		public function clear():void
		{
		}		
		
		private var _target:MovieClip = null;
		public function get_target():MovieClip
		{
			return _target;
		}
		
		public static const EVENT_TYPE_MOUSE_UP:String = SliderFrameLogic.CT_MOUSE_UP;
		public static const EVENT_TYPE_MOUSE_DOWN:String = SliderFrameLogic.CT_MOUSE_DOWN;
		public static const EVENT_TYPE_UPDATE:String = SliderFrameLogic.CT_UPDATE;
		
		public static const EVENT_TYPE_SCROLL_UP:String = 'scrollUp';
		public static const EVENT_TYPE_SCROLL_DOWN:String = 'scrollDown';
		
		
		public var onCallBack:Function = null;		
		
		private var _slider:MovieClip = null;
		private var _sbt1:SimpleButton = null;
		private var _sbt2:SimpleButton = null;
		
		private var _isScrollDown:Boolean = false;
		public function get_isScrollDown():Boolean
		{
			return _isScrollDown;
		}
		
		private var _slf:SliderFrameLogic = null;
		public function get_ratio():Number
		{
			return _slf.get_ratio();
		}
		public function set_ratio(v:Number):void
		{
			_slf.set_ratio(v);
		}
		
		private function p_slf_callBack(eObj:Object):void
		{
			switch (eObj.type)
			{			
				case SliderFrameLogic.CT_MOUSE_UP:
				{
					_isScrollDown = false;
					break;
				}
				case SliderFrameLogic.CT_MOUSE_DOWN:
				{
					_isScrollDown = true;
					break;
				}				
				case SliderFrameLogic.CT_UPDATE:
				{
					break;
				}
			}
			
			ObjectUtil.dispatch_callBack(this, eObj);
		}
		
		private var _tempb:SimpleButton = null;
		private function p_sbts_mouseDown(event:MouseEvent):void
		{
			_isScrollDown = true;
			_tempb = SimpleButton(event.currentTarget);
			_tempb.stage.addEventListener(MouseEvent.MOUSE_UP, p_sbts_mouseUp);
			_downCount = 0;
			_tempb.addEventListener(Event.ENTER_FRAME, p_sbts_enterFrame);
			p_sbts_checkOut();
		}
		
		private function p_sbts_mouseUp(event:MouseEvent):void
		{
			_isScrollDown = false;
			_tempb.stage.removeEventListener(MouseEvent.MOUSE_UP, p_sbts_mouseUp);
			_tempb.removeEventListener(Event.ENTER_FRAME, p_sbts_enterFrame);
			_tempb = null;
		}
		
		private var _downCountEnd:uint = 10;
		private var _downCount:uint = 0;
		private function p_sbts_enterFrame(event:Event):void
		{
			if (_downCount < _downCountEnd) {
				_downCount++;
				return;
			}			
			p_sbts_checkOut();
		}
		
		private function p_sbts_checkOut():void
		{
			if (_tempb == _sbt1)
			{
				ObjectUtil.dispatch_callBack(this, {type: EVENT_TYPE_SCROLL_UP});
			}
			else
			if (_tempb == _sbt2)
			{
				ObjectUtil.dispatch_callBack(this, {type: EVENT_TYPE_SCROLL_DOWN});
			}
		}
	
	
	
		// ::
		public function get_enabled():Boolean
		{
			//return _target.mouseChildren;
			return _target.visible;
		}
		
		// ::
		public function set_enabled(b:Boolean):void
		{
			//_target.mouseChildren = b;
			_target.visible = b;
		}		
	}
}
