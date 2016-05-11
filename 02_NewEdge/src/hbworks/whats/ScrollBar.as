/**
@Name: ScrollBar
@Author: HobisJung
@Date: 2016-05-11
@Comment:
{
}
==================================================================================================== */
package hbworks.whats
{
	import flash.display.DisplayObjectContainer;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import hbworks.uilogics.SliderLogic;
	import hbworks.whats.events.ScrollBarEvent;

	public class ScrollBar extends SliderLogic
	{
		public static function create(container:DisplayObjectContainer, name:String = null,
										type:String = null,
										btn1:SimpleButton = null, btn2:SimpleButton = null):ScrollBar
		{
			return new ScrollBar(container, name, type, null, null, btn1, btn2);
		}
		
		
		public function ScrollBar(container:DisplayObjectContainer, name:String = null,
									type:String = null,
									thumbName:String = null,
									trackName:String = null,
									btn1:SimpleButton = null, btn2:SimpleButton = null)
		{
			super(container, name, type, thumbName, trackName);

			_btn1 = btn1;
			_btn2 = btn2;
			_btn1.addEventListener(MouseEvent.MOUSE_DOWN, p_mouseDown);
			_btn2.addEventListener(MouseEvent.MOUSE_DOWN, p_mouseDown);
		}
		
		private var _btn1:SimpleButton = null;
		private var _btn2:SimpleButton = null;
		private var _btnTemp:SimpleButton = null;
		
		
		private function p_checkOut():void
		{
			if (_btnTemp == _btn1)
			{
				this.dispatchEvent(new ScrollBarEvent(ScrollBarEvent.SCROLL_UP));
			}
			else
			if (_btnTemp == _btn2)
			{
				this.dispatchEvent(new ScrollBarEvent(ScrollBarEvent.SCROLL_DOWN));
			}
		}		
		
		private var _downCountEnd:uint = 10;
		private var _downCount:uint = 0;
		private function p_enterFrame(event:Event):void
		{
			if (_downCount < _downCountEnd)
			{
				_downCount++;
				return;
			}
			p_checkOut();
		}
		
		// ::
		private function p_mouseUp(event:MouseEvent):void
		{
			_btnTemp.stage.removeEventListener(MouseEvent.MOUSE_UP, p_mouseUp);
			_cont.removeEventListener(Event.ENTER_FRAME, p_enterFrame);
			_btnTemp = null;
		}
		
		// ::
		private function p_mouseDown(event:MouseEvent):void
		{
			_btnTemp = SimpleButton(event.currentTarget);
			_btnTemp.stage.addEventListener(MouseEvent.MOUSE_UP, p_mouseUp);
			_downCount = 0;			
			_cont.addEventListener(Event.ENTER_FRAME, p_enterFrame);
			p_checkOut();
		}
		
		
		// ::
		override public function dispose():void 
		{
			if (_btn1 == null) return;
			p_mouseUp(null);
			_btn1 = null;
			_btn2 = null;
			super.dispose();
		}		
		
	}
}
