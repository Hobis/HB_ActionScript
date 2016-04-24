package
{
	import flash.display.NativeWindow;
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.net.URLStream;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import hb.tools.FlaTracer;
	import tools.CTool;
	import flash.filesystem.FileMode;
	import flash.system.System;
	import flash.desktop.Clipboard;
	import flash.desktop.ClipboardFormats;
	import flash.display.MovieClip;
	

	public final class Xinger extends Sprite
	{
		private var _nw:NativeWindow = null;
		
		private var _us:URLStream = null;
		
		private var _f:File = null;
		private var _fs:FileStream = null;
		
		private var _tf1:TextField = null;
		private var _tf2:TextField = null;
		
		
		public function Xinger()
		{
			_nw = this.stage.nativeWindow;
			_nw.title = 'Xinger~~~~~~~~~~~~~Ver 1.02';
			_nw.x = 80;
			_nw.y = 80;
			
			_us = new URLStream();
			_us.addEventListener(IOErrorEvent.IO_ERROR, p_us_ioError);
			_us.addEventListener(Event.COMPLETE, p_us_complete);
			
			//_f = new File(File.desktopDirectory.nativePath).resolvePath('default.txt');
			_f = new File(File.applicationDirectory.resolvePath('Data').nativePath).resolvePath('default.txt');
			_f.addEventListener(Event.SELECT, p_f_select);
			_fs = new FileStream();
			_fs.addEventListener(IOErrorEvent.IO_ERROR, p_fs_ioError);
			_fs.addEventListener(Event.CLOSE, p_fs_close);
			_fs.addEventListener(Event.COMPLETE, p_fs_complete);
			
			
			_tf1 = this.tf_1;
			_tf2 = this.tf_2;
			
			FlaTracer.start('__FlaTracer__');
			
			
			var t_bt:SimpleButton = null;
			
			t_bt = this.bt_1;
			t_bt.addEventListener(MouseEvent.CLICK, p_bt1_click);
			t_bt = this.bt_2;
			t_bt.addEventListener(MouseEvent.CLICK, p_bt2_click);
			t_bt = this.bt_3;
			t_bt.addEventListener(MouseEvent.CLICK, p_bt3_click);
			t_bt = this.bt_e1;
			t_bt.addEventListener(MouseEvent.CLICK, p_bte1_click);
			t_bt = this.bt_e2;
			t_bt.addEventListener(MouseEvent.CLICK, p_bte2_click);
			t_bt = this.bt_e3;
			t_bt.addEventListener(MouseEvent.CLICK, p_bte3_click);
			
			
			_c1 = this.mc_c1;
			_c1.mouseChildren = false;
			_c1.mouseEnabled = false;
		}
		
		private function p_us_ioError(evt:IOErrorEvent):void
		{
			try
			{
				_us.close();
			}
			catch (e:Error) {}
		}
		
		private function p_us_complete(evt:Event):void
		{
			var t_v:String = _us.readUTFBytes(_us.bytesAvailable);
			_tf1.text = t_v;
			try
			{
				_us.close();
			}
			catch (e:Error) {}
			
			if (_b)
			{
				_f = new File(File.applicationDirectory.resolvePath('Data').nativePath).resolvePath('default' + (_count++) + '.txt');
				_f.addEventListener(Event.SELECT, p_f_select);				
				p_bt2_click(null);
			}
		}
		
		
		private function p_f_select(evt:Event):void
		{			
			//FlaTracer.log('_f.nativePath: ' + _f.nativePath);
			//FlaTracer.log('CTool.get_ext(_f.nativePath): ' + CTool.get_ext(_f.nativePath));			
			
			if (CTool.get_ext(_f.nativePath) == 'txt')
			{
				var t_v:String = _tf1.text;				
				_fs.open(_f, FileMode.WRITE);
				_fs.writeUTFBytes(t_v);
				_fs.close();
			}
		}			
		
		
		private function p_fs_ioError(evt:IOErrorEvent):void
		{
		}
		
		private function p_fs_close(evt:Event):void
		{
		}
		
		private function p_fs_complete(evt:Event):void
		{
		}

		
		// :: Load
		private function p_bt3_click(evt:MouseEvent):void
		{
			if (_us.connected) return;
			var t_url:String = _tf2.text;
			var t_ur:URLRequest = new URLRequest(t_url);
			_us.load(t_ur);
		}		
		
		// :: Save
		private function p_bt2_click(evt:MouseEvent):void
		{
			p_f_select(null);
			/*
			if (_f.exists)
				p_f_select(null);
			else
				_f.browseForSave('결과를 저장합니다.');*/
		}
		
		// : Clear
		private function p_bt1_click(evt:MouseEvent):void
		{
			_tf1.text = '';
		}
		
		
		
		private function p_bte1_click(evt:MouseEvent):void
		{
			var t_v:String = String(Clipboard.generalClipboard.getData(ClipboardFormats.TEXT_FORMAT));
			_tf2.text = t_v
		}




		private function p_ef(evt:Event):void
		{
			p_bt3_click(null);
		}

		private var _c1:MovieClip;
		private var _b:Boolean = false;
		private var _count:uint = 0;
		/*
		178
		235*/
		private function p_bte2_click(evt:MouseEvent):void
		{
			if (_b)
			{
				this.removeEventListener(Event.ENTER_FRAME, p_ef);
				_c1.x = 178;
				_b = false;				
			}
		}
		
		private function p_bte3_click(evt:MouseEvent):void
		{
			if (!_b)
			{
				this.addEventListener(Event.ENTER_FRAME, p_ef);
				_c1.x = 235;
				_b = true;
			}
		}
		
	}
}




