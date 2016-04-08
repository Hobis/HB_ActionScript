import flash.display.MovieClip;
import flash.display.SimpleButton;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.MouseEvent;
import flash.net.URLLoader;
import tools.TxtTool;
import utils.ComUtil;


// ::
function p_ul_complete(event:Event):void
{
	var t_txt:String = String(_ul.data);
	t_txt = t_txt.replace(/\n/g, '');
	TxtTool.set('1', t_txt);
	TxtTool.set('2', '');
	TxtTool.set('3', '([A-Z])\w+');
}

// ::
function p_ul_error(event:IOErrorEvent):void
{
}

// ::
function p_initOnce():void
{
	TxtTool.start(owner);
	TxtTool.clear('1');
	TxtTool.clear('2');
	TxtTool.clear('3');
	
	
	SimpleButton(owner.bt_1).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			TxtTool.clear('2');
		}
	);
	SimpleButton(owner.bt_2).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			//trace(TxtTool.get('3'));
			var t_regStr:String = TxtTool.get('3');
			//t_regStr = t_regStr.replace(/\\/, '\\\\');
			trace(t_regStr);
			var t_reg:RegExp = new RegExp(t_regStr, 'gs');
			//var t_reg:RegExp = /([A-Z])\w+/g;
			//t_reg.global = true;
			//t_reg.ignoreCase = true;
			//t_reg.multiline = true;
			
			var t_ms:Array = TxtTool.get('1').match(t_reg);
			//trace(TxtTool.get('1'));
			if (ComUtil.arr_get_isEmpty(t_ms)) return;
			
			for each (var t_m:String in t_ms)
			{
				TxtTool.add('2', t_m);
				//trace(t_m);
			}
		}
	);
	
	_ul = new URLLoader();
	_ul.addEventListener(Event.COMPLETE, p_ul_complete);
	_ul.addEventListener(IOErrorEvent.IO_ERROR, p_ul_error);
	_ul.load(new URLRequest('./InitData.txt'));
}

var owner:MovieClip = this;
var _ul:URLLoader = null;


p_initOnce();

