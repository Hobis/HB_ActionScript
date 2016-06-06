import flash.display.MovieClip;
import flash.display.NativeWindow;
import flash.display.SimpleButton;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.system.System;
import hb.utils.StringUtil;
import hb.utils.TimeUtil;



/*var t_d:Date = new Date();
var t_ds:String	=
	t_d.fullYear.toString() + '/' +
	(t_d.month + 1).toString() + '/' +
	t_d.date.toString();
trace(t_ds);*/
/*
function get_dateTimeStamp(d:Date = null, tok:String = ':'):String
{
	var t_d:Date = (d == null) ? new Date() : d;
	var t_yy:String = t_d.getFullYear().toString();
	var t_mm:String = (t_d.getMonth() + 1).toString();
	var t_dd:String = t_d.getDate().toString();
	var t_tt:String = t_d.getHours().toString();
	var t_mi:String = t_d.getMinutes().toString();

	var t_ds:String	=
		StringUtil.add_token(t_yy, 4) + tok +
		StringUtil.add_token(t_mm, 2) + tok +
		StringUtil.add_token(t_dd, 2) + tok +
		StringUtil.add_token(t_tt, 2) + tok +
		StringUtil.add_token(t_mi, 2);
	return t_ds;
}*/

// ::
function p_dateTimeStamp(d:Date = null):String
{
	var t_d:Date = (d == null) ? new Date() : d;

	var t_yy:Number = t_d.fullYear;
	var t_mm:Number = t_d.month + 1;
	var t_dd:Number = t_d.date;
	var t_tt:Number = t_d.hours;
	var t_mi:Number = t_d.minutes;
	var t_ss:Number = t_d.seconds;
	var t_ms:Number = t_d.milliseconds;

	var t_ds:String	=
		StringUtil.add_token(t_yy.toString(), 4) + '-' +
		StringUtil.add_token(t_mm.toString(), 2) + '-' +
		StringUtil.add_token(t_dd.toString(), 2) + ':' +
		StringUtil.add_token(t_tt.toString(), 2) + '-' +
		StringUtil.add_token(t_mi.toString(), 2) + ':' +
		StringUtil.add_token(t_ss.toString(), 2) + '-' +
		StringUtil.add_token(t_ms.toString(), 3);
	return t_ds;
}

// ::
function p_ef(event:Event):void
{
	_tf0.text = p_dateTimeStamp();
}

var owner:MovieClip = this;
var _nw:NativeWindow = owner.stage.nativeWindow;
_nw.title = 'TimeStamp  Ver 1.07';
_nw.x = Math.round(Capabilities.screenResolutionX - _nw.width) - 40;
_nw.y = Math.round(Capabilities.screenResolutionY - _nw.height) - 40;
var _tf0:TextField = owner.tf_0;
var _tf1:TextField = owner.tf_1;
var _b:Boolean = false;
_tf0.doubleClickEnabled = true;
_tf0.addEventListener(MouseEvent.DOUBLE_CLICK,
	function(event:MouseEvent):void
	{
		if (_b)
		{
			owner.removeEventListener(Event.ENTER_FRAME, p_ef);
			_b = false;
		}
		else
		{
			owner.addEventListener(Event.ENTER_FRAME, p_ef);
			_b = true;
		}
	}
);
_tf0.dispatchEvent(new MouseEvent(MouseEvent.DOUBLE_CLICK));

SimpleButton(owner.bt_2).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		System.setClipboard(_tf1.text);
	}
);
SimpleButton(owner.bt_1).addEventListener(MouseEvent.CLICK,
	function(event:MouseEvent):void
	{
		_tf1.text = p_dateTimeStamp();
	}
);































//trace(get_dateTimeStamp(null, '-'));
//trace(new Date().time);



/*
import flash.globalization.DateTimeFormatter;
import hb.utils.TimeUtil;
import flash.globalization.LocaleID;
import flash.globalization.DateTimeStyle;


var t_dif:DateTimeFormatter = new DateTimeFormatter(LocaleID.DEFAULT);
t_dif.setDateTimeStyles(DateTimeStyle.LONG, DateTimeStyle.LONG);
trace(t_dif.format(new Date()));

//TimeUtil.formatCode(

//var t_date:Date = new Date('yy-mm-dd');
//trace(t_date.toString());*/