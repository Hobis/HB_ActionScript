import flash.display.MovieClip;
import flash.display.SimpleButton;
import flash.events.MouseEvent;
import hbworks.uilogics.SliderLogic;
import hb.tools.DebugTool;


// ::
function p_mouse_udm(event:MouseEvent):void
{
	var t_sl:SliderLogic = SliderLogic(event.currentTarget);
	
	DebugTool.test('event.type: ' + event.type);
	DebugTool.test('t_sl.get_name(): ' + t_sl.get_name());
	DebugTool.test('t_sl.get_type(): ' + t_sl.get_type());
	DebugTool.test('t_sl.get_ratio(): ' + t_sl.get_ratio());
	
	switch (event.type)
	{
		case MouseEvent.MOUSE_UP:
			break;
			
		case MouseEvent.MOUSE_DOWN:
			break;
			
		case MouseEvent.MOUSE_MOVE:
			break;			
	}
}

var owner:MovieClip = this;
var _sl1:SliderLogic = new SliderLogic(owner.slc_1, SliderLogic.TYPE_HORIZONTAL, 'SliderLogic-1');
_sl1.addEventListener(MouseEvent.MOUSE_UP, p_mouse_udm);
_sl1.addEventListener(MouseEvent.MOUSE_DOWN, p_mouse_udm);
_sl1.addEventListener(MouseEvent.MOUSE_MOVE, p_mouse_udm);
var _sl2:SliderLogic = new SliderLogic(owner.slc_2, SliderLogic.TYPE_VERTICAL, 'SliderLogic-2');
_sl2.addEventListener(MouseEvent.MOUSE_UP, p_mouse_udm);
_sl2.addEventListener(MouseEvent.MOUSE_DOWN, p_mouse_udm);
_sl2.addEventListener(MouseEvent.MOUSE_MOVE, p_mouse_udm);


SimpleButton(owner.bt_4).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		_sl1.set_ratio(0.1);
		_sl1.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_MOVE));
	}
);
SimpleButton(owner.bt_3).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		_sl1.set_ratio(0.3);
		_sl1.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_MOVE));
	}
);
SimpleButton(owner.bt_2).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		_sl1.set_ratio(0.5);
		_sl1.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_MOVE));
	}
);
SimpleButton(owner.bt_1).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		_sl1.set_ratio(1);
		_sl1.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_MOVE));
	}
);
