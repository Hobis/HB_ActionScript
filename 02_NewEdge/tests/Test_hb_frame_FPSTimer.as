import flash.display.SimpleButton;
import flash.events.MouseEvent;
import flash.text.TextField;
import hb.frame.FPSTimer;


//
// ::
function p_trace(v:String):void
{
	var t_tf:TextField = this.tf_1;
	if (v == null)
		t_tf.text = '';
	else
		t_tf.appendText(v + '\n');
	t_tf.scrollV = t_tf.maxScrollV;
}

//
// ::
function p_timer_onCallBack(eObj:Object):void
{
	p_trace('p_timer_onCallBack');
	p_trace('eObj.type: ' + eObj.type);
	//
	switch (eObj.type)
	{
		case FPSTimer.CT_UPDATE:
		{
			p_trace('_timer.get_currentCount(): ' + _timer.get_currentCount());

			break;
		}

		case FPSTimer.CT_UPDATE_END:
		{
			//p_trace('_timer.get_currentCount(): ' + _timer.get_currentCount());

			break;
		}
	}
}
//var _timer:FPSTimer = new FPSTimer(30, 7);
var _timer:FPSTimer = new FPSTimer(15, 7);
_timer.set_callBack(p_timer_onCallBack);
//_timer.start();


SimpleButton(this.bt_1).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		_timer.start();
	}
);
SimpleButton(this.bt_2).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{		
		_timer.reset();
		p_trace(null);
	}
);

