import flash.display.MovieClip;
import flash.events.Event;
import hb.tools.TxtTool;
import hbworks.whats.ScrollBar;


function p_sbh_scroll(event:Event):void
{
	TxtTool.set('h', 
		_sbh.get_value().toString() + '/' +
		_sbh.get_valueMax().toString());
}

function p_sbv_scroll(event:Event):void
{
	TxtTool.set('v', 
		_sbv.get_value().toString() + '/' +
		_sbv.get_valueMax().toString());
}

var owner:MovieClip = this;

TxtTool.start(owner, 'tf_');


var _sbh:ScrollBar = ScrollBar.create(owner.slh_1, null, ScrollBar.TYPE_HORIZONTAL,
									  owner.bth_1, owner.bth_2, 70, 360, 10);
_sbh.addEventListener(Event.SCROLL, p_sbh_scroll);
p_sbh_scroll(null);
var _sbv:ScrollBar = ScrollBar.create(owner.slv_1, null, ScrollBar.TYPE_VERTICAL,
									  owner.btv_1, owner.btv_2, 630, 1800, 10);
_sbv.addEventListener(Event.SCROLL, p_sbv_scroll);
p_sbv_scroll(null);



