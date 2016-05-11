import flash.display.MovieClip;
import flash.events.MouseEvent;
import hbworks.whats.ScrollBar;
import hbworks.whats.events.ScrollBarEvent;
import hb.tools.TxtTool;




function p_sbh_mouseMove(event:MouseEvent):void
{
	//trace(event.type);
	_value = _valueMin + (_valueSize * _sbh.get_ratio());
	TxtTool.set('1', _value.toString());
}

function p_sbh_scrollDown(event:ScrollBarEvent):void
{
	//trace(event.type);
	if (_value > _valueMin)
	{
		_value -= _vec;
		if (_value < _valueMin)
			_value = _valueMin;
		//trace('_value: ' + _value);
		TxtTool.set('1', _value.toString());
		
		var t_r:Number = (_value - _valueMin) / _valueSize;
		//trace('t_r: ' + t_r);
		_sbh.set_ratio(t_r);
	}	
}

function p_sbh_scrollUp(event:ScrollBarEvent):void
{
	//trace(event.type);
	if (_value < _valueMax)
	{
		_value += _vec;			
		if (_value > _valueMax)
			_value = _valueMax;
		//trace('_value: ' + _value);
		TxtTool.set('1', _value.toString());
		
		var t_r:Number = (_value - _valueMin) / _valueSize;
		//trace('t_r: ' + t_r);
		_sbh.set_ratio(t_r);			
	}
}



var owner:MovieClip = this;
//var _sbh:ScrollBar = new ScrollBar(owner.slc_1, null, null, null, null, owner.abt_1, owner.abt_2);

TxtTool.start(owner, 'tf_');

var _valueMin:Number = 71;
var _valueMax:Number = 263;
var _valueSize:Number = _valueMax - _valueMin;
var _value:Number = _valueMin + 10;
var _vec:Number = 10;

var _sbh:ScrollBar = ScrollBar.create(owner.slc_1, null, null, owner.abt_1, owner.abt_2);
_sbh.addEventListener(MouseEvent.MOUSE_MOVE, p_sbh_mouseMove);
_sbh.addEventListener(ScrollBarEvent.SCROLL_DOWN, p_sbh_scrollDown);
_sbh.addEventListener(ScrollBarEvent.SCROLL_UP, p_sbh_scrollUp);


p_sbh_scrollDown(null);

//var _sbv:ScrollBar = new ScrollBar(owner.slc_1, null, null, null, null, owner.abt_1, owner.abt_2);

