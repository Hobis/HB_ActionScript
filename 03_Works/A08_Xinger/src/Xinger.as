package
{	
	import flash.display.NativeWindow;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.SecurityErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.net.URLStream;		
	import flash.text.TextField;
	import hb.utils.StringUtil;
	import hb.tools.FlaTracer;
	
	

	public final class Xinger extends Sprite
	{
		private var _nw:NativeWindow = null;
		
		private var _tf1:TextField = null;
		private var _tf2:TextField = null;
		private var _tf3:TextField = null;
		private var _tf4:TextField = null;
		
		
		private var _us:URLStream = null;
		
		private var _f:File = null;
		private var _fs:FileStream = null;
		
		private var _urls:Array = null;
		private var _lcl:uint = 0;
		private var _lc:uint = 0;		
		
		
		public function Xinger()
		{
			_nw = this.stage.nativeWindow;
			_nw.title = 'Xinger~~~~~~~~~~~~~~~~~~~~~';
			_nw.x = 80;
			_nw.y = 80;
			
			_tf1 = this.tf_1;
			_tf1.text = '';
			_tf2 = this.tf_2;
			_tf2.text = '';
			_tf3 = this.tf_3;
			_tf3.text = '';
			_tf4 = this.tf_4;
			_tf4.text = '';
			
			
			_us = new URLStream();
			_us.addEventListener(SecurityErrorEvent.SECURITY_ERROR, p_f_securityError);
			_us.addEventListener(IOErrorEvent.IO_ERROR, p_us_ioError);
			_us.addEventListener(Event.COMPLETE, p_us_complete);
			
			_f = new File(File.applicationDirectory.resolvePath('Data').nativePath).resolvePath('default.txt');
			_f.addEventListener(SecurityErrorEvent.SECURITY_ERROR, p_f_securityError);
			_f.addEventListener(Event.SELECT, p_f_select);
			
			_fs = new FileStream();
			_fs.addEventListener(IOErrorEvent.IO_ERROR, p_fs_ioError);
			_fs.addEventListener(Event.CLOSE, p_fs_close);
			_fs.addEventListener(Event.COMPLETE, p_fs_complete);
			
			
			var t_bt:SimpleButton = null;
			t_bt = this.bt_1;
			t_bt.addEventListener(MouseEvent.CLICK, p_bt1_click);
			t_bt = this.bt_2;
			t_bt.addEventListener(MouseEvent.CLICK, p_bt2_click);
			t_bt = this.bt_3;
			t_bt.addEventListener(MouseEvent.CLICK, p_bt3_click);
			t_bt = this.bt_4;
			t_bt.addEventListener(MouseEvent.CLICK, p_bt4_click);
			t_bt = this.bt_5;
			t_bt.addEventListener(MouseEvent.CLICK, p_bt5_click);
			
			//
			FlaTracer.start('__FlaTracer__');
		}
		
		// ::
		private function p_us_ioError(event:IOErrorEvent):void
		{
			p_load_yes();
		}

		// ::
		private function p_us_complete(event:Event):void
		{
			p_load_no();
		}
		
		
		// ::
		private function p_f_securityError(event:SecurityErrorEvent):void
		{
		}
		
		// ::
		private function p_f_select(event:Event):void
		{
		}
		
		// ::
		private function p_fs_ioError(event:IOErrorEvent):void
		{
		}
		
		// ::
		private function p_fs_close(event:Event):void
		{
		}
		
		// ::
		private function p_fs_complete(event:Event):void
		{
		}


		// :: Start Click
		private function p_bt1_click(event:MouseEvent):void
		{
			if (_urls == null)
			{
				var t_v:String = _tf2.text;
				if (!StringUtil.is_empty(t_v))
				{
					_urls = t_v.split('\r');
					_lcl = _urls.length;
					_lc = 0;
					p_load_checkNext();
					//FlaTracer.log('_lcl: ' + _lcl);
					//FlaTracer.log('_lc: ' + _lc);
				}
			}
		}
		
		// :: Stop Click
		private function p_bt2_click(event:MouseEvent):void
		{
		}
		
		// :: Clear Click
		private function p_bt3_click(event:MouseEvent):void
		{
		}
		
		// :: Load Click
		private function p_bt4_click(event:MouseEvent):void
		{
		}
		
		// :: Save Click
		private function p_bt5_click(event:MouseEvent):void
		{
		}
		
		
		
		// ::
		private function p_load_checkNext():void
		{
			if (_lc < _lcl)
			{
				_lc++;
				p_load_start();
				if (_lc >= _lcl)
				{
					//trace('완료');
				}
			}
		}
		
		// ::
		private function p_load_start():void
		{
			var t_url:String = _lcl[_lc];
			if (t_url != null)
			{
				var t_ur:URLRequest = new URLRequest(t_url);
				_us.load(t_ur);
			}
		}
		
		// ::
		private function p_load_yes():void
		{
		}
		
		// ::
		private function p_load_no():void
		{
		}		
		
	}
}




