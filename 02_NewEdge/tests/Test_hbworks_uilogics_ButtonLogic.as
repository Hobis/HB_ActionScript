import flash.display.MovieClip;
import hbworks.uilogics.ButtonLogic;


var owner:MovieClip = this;
var _bl1:ButtonLogic = new ButtonLogic(owner.bl_1_1, true);
_bl1.addEventListener(MouseEvent.CLICK,
	function(event:Event):void
	{
	}
);

var _bl2:ButtonLogic = new ButtonLogic(owner.bl_1_2, false);
_bl2.addEventListener(MouseEvent.CLICK,
	function(event:Event):void
	{
	}
);

var _bl3:ButtonLogic = new ButtonLogic(owner.bl_1_2, false);
_bl3.addEventListener(MouseEvent.CLICK,
	function(event:Event):void
	{
	}
);
