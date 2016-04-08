package workers
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.ByteArray;
	import hb.core.ICallBack;
	import hb.core.IDisposer;
	import hb.utils.DebugUtil;
	import hb.utils.StringUtil;

	/**
	 * ...
	 * @author Hobis
	 */
	public final class DownloadWork implements ICallBack, IDisposer
	{
		// --------------------------------------------------------------------------------
		// # 초기화
		// --------------------------------------------------------------------------------
		// :: 생성자
		public function DownloadWork(urls:Array, fdp:File, callBack:Function)
		{
			_urls = urls;
			_fdp = fdp;
			_callBack = callBack;
			_lcl = _urls.length;
			_lc = 0;
		}

		// -
		private var _urls:Array = null;
		public function get_urls():Array
		{
			return _urls;
		}
		
		// -
		private var _fdp:File = null;
		public function get_fdp():File
		{
			return _fdp;
		}

		//
		public static const CBT_COMPLETE:String = 'complete';
		public static const CBT_ERROR:String = 'error';
		public static const CBT_COMPLETE_ALL:String = 'completeAll';

		// -
		private var _callBack:Function = null;
		public function dispatch_callBack(eObj:Object):void
		{
			if (_callBack != null)
			{
				_callBack(eObj);
			}
		}

		// - LoadCountLength
		private var _lcl:uint;
		// - LoadCount
		private var _lc:uint;


		// :: 객체소멸
		public function dispose():void
		{
			if (_urls == null) return;
			_urls = null;
			_fdp = null;
			_callBack = null;
			_lcl = 0;
			_lc = 0;
			p_loadClear();
		}
		
		
		// ::
		public function checkNext(bFirst:Boolean = true):void
		{
			if (bFirst) _lc = 0;
			else _lc++;
			
			if (_lc < _lcl)
			{
				DebugUtil.test((_lc + 1) + '/' + _lcl);
				
				var t_url:String = _urls[_lc];
				if (StringUtil.getIsEmpty(t_url))
				{
					checkNext(false);
					return;
				}
				else
				{
					p_load(t_url);
				}
			}
			else
			{
				dispatch_callBack({
					type: CBT_COMPLETE_ALL
				});
			}
		}
		// --------------------------------------------------------------------------------
		
		
		
		// --------------------------------------------------------------------------------
		// # 
		// --------------------------------------------------------------------------------
		// -
		private var _url:String = null;
		public function get_url():String
		{
			return _url;
		}
		
		// -
		private var _us:URLStream = null;		
		
		// ::
		public function p_loadClear():void
		{
			if (_url == null) return;
			_url = null;
			try
			{
				_us.close();
			}
			catch (e:Error) {
			}
			_us = null;
		}
		
		// ::
		public function p_load(url:String):void
		{
			p_loadClear();
			try
			{
				_url = url;
				_us = new URLStream();
				_us.addEventListener(Event.COMPLETE, p_loadComplete);
				_us.addEventListener(IOErrorEvent.IO_ERROR, p_loadIoError);
				var t_ur:URLRequest = new URLRequest(url);
				_us.load(t_ur);
			}
			catch (e:Error)
			{
				DebugUtil.test(e.toString());
			}
		}
		
		// ::
		private function p_loadComplete(event:Event):void
		{
			var t_fn:String = UrlWorkHelper.get_fileName(_url);
			//DebugUtil.test('>>>>>>>>>>>>>>>>' + t_fn);
			if (t_fn == null)
				t_fn = UrlWorkHelper.get_dateTimeStr();
			var t_f:File = _fdp.resolvePath(t_fn);			
			var t_buffSize:uint = 1024 * 10;
			var t_buff:ByteArray = new ByteArray();			
			var t_fs:FileStream = new FileStream();			
			try
			{
				t_fs.open(t_f, FileMode.WRITE);
				
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
			}
			catch (e:Error)
			{
				DebugUtil.test('>>>>>>>>>>>>>>>>' + e.toString());
			}
			

			t_buff.clear();
			t_buff = null;
			t_fs.close();
			t_fs = null;
			_us.close();
			_us = null;
			
			
			dispatch_callBack({
				type: CBT_COMPLETE
			});
		}
		
		// ::
		private function p_loadIoError(IOErrorEvent:Event):void
		{
			dispatch_callBack({
				type: CBT_ERROR
			});
		}
		// --------------------------------------------------------------------------------

	}

}