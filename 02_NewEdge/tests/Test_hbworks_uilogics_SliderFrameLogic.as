import flash.display.MovieClip;
import flash.display.SimpleButton;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.ui.Keyboard;
import hbworks.uilogics.SliderFrameLogic;
import hb.tools.TxtTool;



var owner:MovieClip = this;
var _slf1:SliderFrameLogic = 
	new SliderFrameLogic(owner.slf_1, SliderFrameLogic.TYPE_HORIZONTAL, 17);
_slf1.set_callBack(function(eObj:Object):void {
	trace(eObj.type);
	trace('_slf1.get_ratio(): ' + _slf1.get_ratio());
	
	TxtTool.set('1', _slf1.get_ratio().toString());
});

var _slf2:SliderFrameLogic = 
	new SliderFrameLogic(owner.slf_2, SliderFrameLogic.TYPE_VERTICAL, 17);
_slf2.set_callBack(function(eObj:Object):void {
	TxtTool.set('2', _slf2.get_ratio().toString());
});

var _slf3:SliderFrameLogic = 
	new SliderFrameLogic(owner.slf_3, SliderFrameLogic.TYPE_VERTICAL, 17);
_slf3.set_callBack(function(eObj:Object):void {
	TxtTool.set('3', _slf3.get_ratio().toString());
});



TxtTool.start(owner, 'tf_');
TextField(owner.tf_1).restrict = '0-9.';
TextField(owner.tf_1).maxChars = 3;
TextField(owner.tf_1).addEventListener(KeyboardEvent.KEY_DOWN,
	function(event:KeyboardEvent):void
	{
		if (event.keyCode == Keyboard.ENTER)
		{
			SimpleButton(owner.bt_1).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}
	}
);									   
TextField(owner.tf_2).restrict = '0-9.';
TextField(owner.tf_2).maxChars = 3;
TextField(owner.tf_2).addEventListener(KeyboardEvent.KEY_DOWN,
	function(event:KeyboardEvent):void
	{
		if (event.keyCode == Keyboard.ENTER)
		{
			SimpleButton(owner.bt_2).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}
	}
);
TextField(owner.tf_3).restrict = '0-9.';
TextField(owner.tf_3).maxChars = 3;
TextField(owner.tf_3).addEventListener(KeyboardEvent.KEY_DOWN,
	function(event:KeyboardEvent):void
	{
		if (event.keyCode == Keyboard.ENTER)
		{
			SimpleButton(owner.bt_3).dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}
	}
);


SimpleButton(owner.bt_1).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		var t_v:Number = Number(TxtTool.get('1'));
		_slf1.set_ratio(t_v);
	}
);
SimpleButton(owner.bt_2).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		var t_v:Number = Number(TxtTool.get('2'));
		_slf2.set_ratio(t_v);
	}
);
SimpleButton(owner.bt_3).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		var t_v:Number = Number(TxtTool.get('3'));
		_slf3.set_ratio(t_v);
	}
);

