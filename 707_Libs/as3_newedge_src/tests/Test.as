// 
//
// hb.controls.SmoothControl
//
import flash.display.MovieClip;
import flash.events.MouseEvent;
import hb.controls.SmoothControl;



var owner:MovieClip = this;
var _sc:SmoothControl = null;


_sc = new SmoothControl(owner.mc_1, 'x');
_sc.set_speed(0.2);
_sc.set_callBack(function(eObj:Object):void {
	switch (eObj.type)
	{
		case SmoothControl.CT_END:
			break;
			
		case SmoothControl.CT_UPDATE:
			break;
	}
	//
	trace('eObj.type: ' + eObj.type);
});

MovieClip(owner.mc_1).mouseChildren = false;
MovieClip(owner.mc_1).buttonMode = true;
MovieClip(owner.mc_1).stage.addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void {
		_sc.to(owner.mouseX);
	}
);



/*
// 
//
// hb.controls.FrameControl
//
import flash.display.MovieClip;
import flash.events.MouseEvent;
import hb.controls.FrameControl;



var owner:MovieClip = this;
var _fc:FrameControl = null;


_fc = new FrameControl(owner.mc_1);
_fc.set_valueGap(1);
_fc.set_callBack(function(eObj:Object):void {
	switch (eObj.type)
	{
		case FrameControl.CT_END:
			break;
			
		case FrameControl.CT_UPDATE:
			break;
	}
	//
	trace('eObj.type: ' + eObj.type);
});

MovieClip(owner.mc_1).mouseChildren = false;
MovieClip(owner.mc_1).buttonMode = true;
MovieClip(owner.mc_1).addEventListener(MouseEvent.ROLL_OUT,
	function(event:MouseEvent):void {
		_fc.to(1);
	}
);
MovieClip(owner.mc_1).addEventListener(MouseEvent.ROLL_OVER,
	function(event:MouseEvent):void {
		_fc.to(100);
	}
);
*/


/* 
// 
//
// hb.controls.ValueControl
//
import flash.display.MovieClip;
import flash.events.MouseEvent;
import hb.controls.ValueControl;



var owner:MovieClip = this;
var _vc:ValueControl = null;


_vc = new ValueControl(MovieClip(owner.mc_1), 'alpha', 0, 1);
_vc.set_valueGap(.1);
_vc.set_callBack(function(eObj:Object):void {
	switch (eObj.type)
	{
		case ValueControl.CT_END:
			break;
			
		case ValueControl.CT_UPDATE:
			break;
	}
	//
	trace('eObj.type: ' + eObj.type);
});

MovieClip(owner.mc_1).mouseChildren = false;
MovieClip(owner.mc_1).buttonMode = true;
MovieClip(owner.mc_1).addEventListener(MouseEvent.ROLL_OUT,
	function(event:MouseEvent):void {
		_vc.to(0.3);
	}
);
MovieClip(owner.mc_1).addEventListener(MouseEvent.ROLL_OVER,
	function(event:MouseEvent):void {
		_vc.to(1);
	}
);
*/
