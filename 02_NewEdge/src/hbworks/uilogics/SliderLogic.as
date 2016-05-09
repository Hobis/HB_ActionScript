/**
	@Name: SliderLogic
	@Author: HobisJung(jhb0b@naver.com)
	@Date: 2016-05-09
	@Using:
	{
	
	}
*/
package hbworks.uilogics
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import hbworks.uilogics.core.ISliderLogic;
	import hbworks.uilogics.core.LogicCore;
	import hbworks.uilogics.subClasses.RectArea;
	
	
	public class SliderLogic extends LogicCore implements ISliderLogic
	{
		public static const TYPE_HORIZONTAL:String = 'horizontal';
		public static const TYPE_VERTICAL:String = 'vertical';
				
		// ::
		public function SliderLogic(container:DisplayObjectContainer,
										type:String = null,
										name:String = null,
										thumbName:String = null,
										trackName:String = null)
		{
			super(container);
			
			_cont.mouseChildren = false;
			Sprite(_cont).buttonMode = true;
			
			if (type == null)
				_type = TYPE_HORIZONTAL;
			else
				_type = type;
				
			_name = name;
			
			if (thumbName == null)
				thumbName = 'thumb_mc';			
			_thumb = _cont[thumbName];
			if (_thumb == null)
			{
				throw new Error('thumb is null.');
			}
			
			if (trackName == null)
				trackName = 'track_mc';			
			_track = _cont[trackName];
			if (_track == null)
			{
				throw new Error('track is null.');
			}
			
			p_rectAreaUpdate();
			
			
			_cont.addEventListener(MouseEvent.MOUSE_DOWN, p_mouseDown);
		}
		
		// -
		private var _type:String = null;
		public function get_type():String
		{
			return _type;
		}
		
		// -
		private var _thumb:DisplayObject = null;
		public function get_thumb():DisplayObject
		{
			return _thumb;
		}	
		
		// -
		private var _track:DisplayObject = null;
		public function get_track():DisplayObject
		{
			return _track;
		}
		
		// -
		private var _rectArea:RectArea = null;
		private function p_rectAreaUpdate():void
		{
			if (_rectArea == null)
			{
				_rectArea = new RectArea();
				_rectArea.thumbFirstX = _thumb.x;
				_rectArea.thumbFirstY = _thumb.y;
				_rectArea.thumbX = _rectArea.thumbFirstX;
				_rectArea.thumbY = _rectArea.thumbFirstY;
			}
			_rectArea.thumbWidth = _thumb.width;
			_rectArea.thumbHeight = _thumb.height;
			_rectArea.trackWidth = _track.width;
			_rectArea.trackHeight = _track.height;			
			_rectArea.left = _rectArea.thumbX;
			_rectArea.width = _rectArea.trackWidth -
				(_rectArea.left + _rectArea.thumbWidth + _rectArea.left);
			_rectArea.right = _rectArea.left + _rectArea.width;
			_rectArea.top = _rectArea.thumbY;
			_rectArea.height = _rectArea.trackHeight -
				(_rectArea.top + _rectArea.thumbHeight + _rectArea.top);
			_rectArea.bottom = _rectArea.top + _rectArea.height;
		}
		
		// :: 포지션 보정하기
		private function p_rectAreaCorrection():void
		{
			if (_type == TYPE_HORIZONTAL)
			{
				if (_rectArea.thumbX < _rectArea.left)
					_rectArea.thumbX = _rectArea.left;
				else
				if (_rectArea.thumbX > _rectArea.right)
					_rectArea.thumbX = _rectArea.right;
			}
			else
			if (_type == TYPE_VERTICAL)
			{
				if (_rectArea.thumbY < _rectArea.top)
					_rectArea.thumbY = _rectArea.top;
				else
				if (_rectArea.thumbY > _rectArea.bottom)
					_rectArea.thumbY = _rectArea.bottom;
			}
		}

		// :: 포지션 업데이트
		private function p_thumbPositionUpdate():void
		{
			if (_type == TYPE_HORIZONTAL)
			{
				_thumb.x = _rectArea.thumbX;
			}
			else
			if (_type == TYPE_VERTICAL)
			{
				_thumb.y = _rectArea.thumbY;
			}
		}
	
		// ::
		private function p_mouseUp(event:MouseEvent):void
		{
			_stage.removeEventListener(MouseEvent.MOUSE_UP, p_mouseUp);
			_stage.removeEventListener(MouseEvent.MOUSE_MOVE, p_mouseMove);			
			
			var t_me:MouseEvent = new MouseEvent(MouseEvent.MOUSE_UP);
			this.dispatchEvent(t_me);
		}		
		
		// ::
		private function p_mouseDown(event:MouseEvent):void
		{
			_stage.addEventListener(MouseEvent.MOUSE_UP, p_mouseUp);
			_stage.addEventListener(MouseEvent.MOUSE_MOVE, p_mouseMove);
			
			var t_me:MouseEvent = new MouseEvent(MouseEvent.MOUSE_DOWN);
			this.dispatchEvent(t_me);
			
			p_mouseMove(null);
		}
		
		// ::
		private function p_mouseMove(event:MouseEvent):void
		{
			if (_type == TYPE_HORIZONTAL)
			{
				_rectArea.thumbX = _cont.mouseX - Math.round(_rectArea.thumbWidth / 2);
			}
			else
			if (_type == TYPE_VERTICAL)
			{
				_rectArea.thumbY = _cont.mouseY - Math.round(_rectArea.thumbHeight / 2);
			}			
			p_rectAreaCorrection();
			p_thumbPositionUpdate();			
			
			var t_me:MouseEvent = new MouseEvent(MouseEvent.MOUSE_MOVE);
			this.dispatchEvent(t_me);
			
			if (event != null)
				event.updateAfterEvent();			
		}
		
		
		
		
		
		// ::
		public function get_ratio():Number
		{
			var t_rv:Number;

			if (_type == TYPE_HORIZONTAL)
				t_rv = (_rectArea.thumbX - _rectArea.left) / _rectArea.width;
			else
			if (_type == TYPE_VERTICAL)
				t_rv = (_rectArea.thumbY - _rectArea.top) / _rectArea.height;

			return t_rv;
		}
		public function set_ratio(v:Number):void
		{
			if (v < 0)
				v = 0;
			else
			if (v > 1)
				v = 1;
				
			var t_pos:Number;
			if (_type == TYPE_HORIZONTAL)
			{
				t_pos = Math.round(_rectArea.left + (v * _rectArea.width));
				_rectArea.thumbX = t_pos;
			}
			else
			if (_type == TYPE_VERTICAL)
			{
				t_pos = Math.round(_rectArea.top + (v * _rectArea.height));
				_rectArea.thumbY = t_pos;
			}
			
			p_thumbPositionUpdate();
		}

		// ::
		public function rectAreaUpdate():void
		{
			p_rectAreaUpdate();
		}
		
		
		
		override public function dispose():void 
		{
			if (_type == null) return;
			_type = null;
			_thumb = null;
			_track = null;
			_rectArea = null;			
			super.dispose();
		}
		
	}
}
