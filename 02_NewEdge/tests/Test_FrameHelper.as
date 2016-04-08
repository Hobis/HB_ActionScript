import flash.display.MovieClip;
import flash.events.MouseEvent;
import hb.frame.FrameHelper;
import hb.utils.TextFieldUtil;
import hb.utils.MovieClipUtil;


// ::
function p_init():void 
{
	_frameHelper = new FrameHelper(owner.mc_1);
	_frameHelper.set_callBack(
		function(eObj:Object):void {
			trace('eObj.type: ' + eObj.type);
			switch (eObj.type) {
				case FrameHelper.CT_END_FRAME:
					break;
					
				case FrameHelper.CT_ENTER_FRAME:
					var t_v:String = 
						'BeginFrameLabel: ' + _frameHelper.get_beginFrameLabel() + '\n' +
						'EndFrameLabel: ' + _frameHelper.get_endFrameLabel() + '\n' +
						'CurrentFrame: ' + _frameHelper.get_currentFrame().toString() + '\n' +
						'CurrentFrameLabel: ' + _frameHelper.get_currentFrameLabel();
					TextFieldUtil.set_text(owner.mc_1, 'tf_1', t_v);
					break;
			}
		}
	);
	//_frameHelper.
	
	SimpleButton(owner.bt_1).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			_frameHelper.gotoPlayLabel('#_1', '#_7', true);
		}
	);
	SimpleButton(owner.bt_2).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{		
			_frameHelper.gotoPlayLabel('#_6', '#_10', true, 1, -2);
		}
	);
	SimpleButton(owner.bt_3).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{		
			_frameHelper.stop();
		}
	);
	SimpleButton(owner.bt_4).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{		
			_frameHelper.dispose();
		}
	);
}

var owner:MovieClip = this;
var _frameHelper:FrameHelper = null;


p_init();