import flash.display.MovieClip;
import flash.events.MouseEvent;
import hb.utils.TextFieldUtil;
import hb.useful.PanelLayer;


// ::
function p_init():void 
{
	_panelLayer = new PanelLayer(owner, 'mc_',
		function(eObj:Object):void {
			trace('eObj.type: ' + eObj.type);
			trace('eObj.now: ' + eObj.now);
			
			var t_mc:MovieClip = eObj.now;
			
			switch (eObj.type) {
				case PanelLayer.CT_INIT:
					TextFieldUtil.set_text(t_mc, 'tf_1', t_mc.name);
					t_mc.visible = false;
					break;
					
				case PanelLayer.CT_CLOSE:
					t_mc.visible = false;
					break;
					
				case PanelLayer.CT_OPEN:					
					t_mc.visible = true;
					break;
			}
		}
	);
	//_panelLayer.select(1);
	
	SimpleButton(owner.bt_1).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			_panelLayer.unselect();
		}
	);
	SimpleButton(owner.bt_2).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			_panelLayer.select(3);
		}
	);
	SimpleButton(owner.bt_3).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			_panelLayer.select(2);
		}
	);
	SimpleButton(owner.bt_4).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			_panelLayer.select(1);
		}
	);
	
	SimpleButton(owner.bt_5).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			_panelLayer.next();
		}
	);
	SimpleButton(owner.bt_6).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			_panelLayer.prev();
		}
	);	
}

var owner:MovieClip = this;
var _panelLayer:PanelLayer = null;


p_init();