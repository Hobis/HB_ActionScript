import flash.display.MovieClip;
import hb.useful.PopUpWrap;
import flash.display.SimpleButton;
import flash.events.MouseEvent;


var owner:MovieClip = this;
var _puw:PopUpWrap = new PopUpWrap(owner.popUp_1);
_puw.set_callBack(
	function(eObj:Object):void{
		trace(eObj.type);
	});

SimpleButton(owner.bt_1).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		_puw.close();
	}
);
SimpleButton(owner.bt_2).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		_puw.open('#01');
	}
);
SimpleButton(owner.bt_3).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		_puw.open('#02');
	}
);
SimpleButton(owner.bt_4).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		_puw.open('#03');
	}
);