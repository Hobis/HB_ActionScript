package 
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.ByteArray;
	/**
	 * ...
	 * @author Hobis
	 */
	public final class UrlDownTool 
	{		
		public function UrlDownTool() 
		{			
		}
		
		// ::
		public static function start(callBack:Function):void
		{
			_callBack = callBack;
		}
		
		//
		public static const CBT_COMPLETE:String = 'complete';
		public static const CBT_ERROR:String = 'error';
		
		private static var _callBack:Function = null;
		private static function p_call_callBack(eObj:Object):void
		{
			if (_callBack != null)
			{
				_callBack(eObj);
			}
		}

		// ::
		public static function stop():void
		{
			clear();
			_callBack = null;
		}		
		
		
		private static function p_date_get_nowStr():String
		{
			var t_date:Date = new Date();
			var t_rv:String = 
				t_date.getFullYear().toString() +
				(t_date.getMonth() + 1).toString() +
				t_date.getDate().toString() +
				t_date.getHours().toString() +
				t_date.getMinutes().toString() +
				t_date.getSeconds().toString() +
				t_date.getMilliseconds().toString();		
			return t_rv;
		}		
		
		// ::
		private static function p_url_get_fileName(url:String):String
		{
			var t_ms:Array = url.match(/[^\/]+$/i);
			if (RootTool.arr_get_isEmpty(t_ms))
			{
				return p_date_get_nowStr();
			}
			else
			{
				return t_ms[0];
			}
		}		
		
		
		private static var _url:String = null;		
		private static var _dlp:String = null;
		private static var _us:URLStream = null;
		
		// ::
		public static function clear():void
		{
			if (_us != null)
			{
				try
				{
					_us.close();
				}
				catch (e:Error) {}
				_us = null;
			}
		}
		
		// ::
		public static function load(url:String, dlp:String):void
		{
			clear();
			trace('~~~~~~~~: url: ' + url);
			_url = url;
			_dlp = dlp;
			_us = new URLStream();
			_us.addEventListener(Event.COMPLETE, p_load_complete);
			_us.addEventListener(IOErrorEvent.IO_ERROR, p_load_ioError);
			_us.load(new URLRequest(_url));
		}
		
		// ::
		private static function p_load_complete(event:Event):void
		{
			var t_dlf:File = new File(_dlp + File.separator + p_url_get_fileName(_url));
			/*
			if (!t_dlf.exists)
			{
			}*/
			trace('t_dlf: ' + t_dlf.nativePath);
			
			var t_buffSize:uint = 1024 * 10;
			var t_buff:ByteArray = new ByteArray();
			
			var t_fs:FileStream = new FileStream();
			t_fs.open(t_dlf, FileMode.WRITE);
			
			while (true)
			{
				var t_bav:uint = _us.bytesAvailable;
				if (t_bav > t_buffSize)
				{
					_us.readBytes(t_buff, 0, t_buffSize);
					t_fs.writeBytes(t_buff, 0, t_buffSize);
				}
				else
				{
					_us.readBytes(t_buff, 0, t_bav);
					t_fs.writeBytes(t_buff, 0, t_bav);
					break;
				}				
			}
			
			t_buff.clear();
			t_buff = null;
			t_fs.close();
			t_fs = null;
			_us.close();
			_us = null;
			
			p_call_callBack({
				type: CBT_COMPLETE
			});
		}
		
		// ::
		private static function p_load_ioError(IOErrorEvent:Event):void
		{
			p_call_callBack({
				type: CBT_ERROR
			});			
		}		
	}

}