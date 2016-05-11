import flash.display.MovieClip;
import flash.events.Event;
import hbworks.whats.ScrollBar;
import hb.tools.TxtTool;


function p_sbh_scroll(event:Event):void
{
	TxtTool.set('1', 
		_sbh.get_value().toString() + '/' +
		_sbh.get_valueMax().toString());
}


var owner:MovieClip = this;

TxtTool.start(owner, 'tf_');


var _sbh:ScrollBar = ScrollBar.create(owner.slc_1, null, null, owner.abt_1, owner.abt_2, 70, 360, 10);
_sbh.addEventListener(Event.SCROLL, p_sbh_scroll);




