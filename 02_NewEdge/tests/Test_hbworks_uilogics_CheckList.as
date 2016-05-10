import flash.display.MovieClip;
import flash.events.Event;
import hbworks.uilogics.CheckListLogic;
import hb.tools.TxtTool;



var owner:MovieClip = this;
var _ckl1:CheckListLogic = new CheckListLogic([owner.bl_1_1, owner.bl_1_2, owner.bl_1_3], 0);
_ckl1.addEventListener(Event.CHANGE,
	function(event:Event):void
	{
		TxtTool.set('1', _ckl1.get_selectedIndex().toString());
	}
);
var _ckl2:CheckListLogic = new CheckListLogic([owner.bl_2_1, owner.bl_2_2], 0);
_ckl2.addEventListener(Event.CHANGE,
	function(event:Event):void
	{
		TxtTool.set('2', _ckl2.get_selectedIndex().toString());
	}
);
TxtTool.start(owner, 'tf_');
//TxtTool.set('1', '');
