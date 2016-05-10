import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;
import hb.controls.ValueControl;




// ::
function p_spr_roo(event:MouseEvent):void
{
	switch (event.type)
	{
		case MouseEvent.ROLL_OUT:
			_vc.to(1);
			break;
			
		case MouseEvent.ROLL_OVER:
			_vc.to(0);
			break;
	}
}

// ::
function p_vc_callBack(eObj:Object):void
{
	switch (eObj.type)
	{
		case ValueControl.CT_END:
			break;
			
		case ValueControl.CT_UPDATE:
			break;
	}
	//
	trace('eObj.type: ' + eObj.type);
}

var onwer:MovieClip = this;
var _spr:Sprite = new Sprite();
this.addChild(_spr);
_spr.graphics.beginFill(0xff0000, 1);
_spr.graphics.drawCircle(0, 0, 30);
_spr.graphics.endFill();
_spr.x = 100;
_spr.y = 100;
_spr.mouseChildren = false;
_spr.buttonMode = true;
_spr.addEventListener(MouseEvent.ROLL_OUT, p_spr_roo);
_spr.addEventListener(MouseEvent.ROLL_OVER, p_spr_roo);

var _vc:ValueControl = new ValueControl(_spr, 'alpha', 0, 1);
_vc.set_valueGap(.1);
_vc.set_callBack(p_vc_callBack);

