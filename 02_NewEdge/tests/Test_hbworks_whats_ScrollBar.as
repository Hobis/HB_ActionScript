import flash.display.MovieClip;
import flash.events.MouseEvent;
import hbworks.whats.ScrollBar;
import hbworks.whats.events.ScrollBarEvent;
import hb.tools.TxtTool;


var owner:MovieClip = this;
//var _sbh:ScrollBar = new ScrollBar(owner.slc_1, null, null, null, null, owner.abt_1, owner.abt_2);

TxtTool.start(owner, 'tf_');


var _valueMin:Number = 71;
var _valueMax:Number = 263;
var _value:Number = _valueMin + 10;
var _vec:Number = 10;

var _sbh:ScrollBar = ScrollBar.create(owner.slc_1, null, null, owner.abt_1, owner.abt_2);
_sbh.addEventListener(MouseEvent.MOUSE_MOVE,
	function(event:MouseEvent):void
	{
		trace(event.type);
		_value = _valueMin + (_sbh.get_ratio() * (_valueMax - _valueMin));
		TxtTool.set('1', _value.toString());
	}
);
_sbh.addEventListener(ScrollBarEvent.SCROLL_DOWN,
	function(event:ScrollBarEvent):void
	{
		trace(event.type);
		if (_value > _valueMin)
		{
			_value -= _vec;
			trace('_value: ' + _value);
		}
		trace('_value: ' + _value);
	}
);
_sbh.addEventListener(ScrollBarEvent.SCROLL_DOWN,
	function(event:ScrollBarEvent):void
	{
		trace(event.type);
		if (_value < _valueMax)
		{
			_value += _vec;
			trace('_value: ' + _value);
		}
	}
);
//var _sbv:ScrollBar = new ScrollBar(owner.slc_1, null, null, null, null, owner.abt_1, owner.abt_2);