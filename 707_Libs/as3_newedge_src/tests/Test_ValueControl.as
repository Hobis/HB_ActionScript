package tests 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import hb.controls.ValueControl;
	
	/**
	 * ...
	 * @author hb
	 */
	[SWF(frameRate="30", width="400", height="400")]
	public final class Test_ValueControl extends Sprite
	{		
		public function Test_ValueControl() 
		{
			_spr = new Sprite();
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
			//
			//_vc = new ValueControl(_spr, 'x', 0, 1000);
			_vc = new ValueControl(_spr, 'alpha', 0, 1);
			_vc.set_valueGap(.1);
			_vc.set_callBack(p_vc_callBack);
			//this.stage.addEventListener(MouseEvent.CLICK, p_stage_click);
			//
		}		
		private var _spr:Sprite = null;
		private var _vc:ValueControl = null;
		
		// ::
		//private function p_stage_click(event:MouseEvent):void
		//{
			//_vc.to(200);
		//}
		// ::
		private function p_spr_roo(event:MouseEvent):void
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
		private function p_vc_callBack(eObj:Object):void
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
	}
}
