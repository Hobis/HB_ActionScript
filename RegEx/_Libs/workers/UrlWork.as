package workers
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import hb.core.ICallBack;
	import hb.core.IDisposer;
	import hb.utils.DebugUtil;
	import hb.utils.StringUtil;
	import utils.ComUtil;
	
	
	/**
	 * ...
	 * @author Hobis
	 */
	public final class UrlWork implements ICallBack, IDisposer
	{
		// --------------------------------------------------------------------------------
		// # 초기화
		// --------------------------------------------------------------------------------
		// :: 생성자
		public function UrlWork(urls:Array, callBack:Function) 
		{
			_urls = urls;
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
		private var _domain:String = null;
		public function get_domain():String
		{
			return _domain;
		}
		
		// -
		private var _pathName:String = null;
		public function get_pathName():String
		{
			return _pathName;
		}
		
		// -
		private var _fileName:String = null;
		public function get_fileName():String
		{
			return _fileName;
		}
		
		// -
		private var _ul:URLLoader = null;
		
		// -
		private var _imgs:Array = null;
		public function get_imgs():Array
		{
			return _imgs;
		}
		
		// ::
		public function p_loadClear():void
		{
			if (_domain == null) return;
			_domain = null;
			_pathName = null;
			_fileName = null;
			try
			{
				_ul.close();
			}
			catch (e:Error) {
			}
			_ul = null;
			_imgs = null;
		}
		
		// ::
		public function p_load(url:String):void
		{
			p_loadClear();
			
			_domain = UrlWorkHelper.get_domain(url);
			if (_domain == null)
			{
				dispatch_callBack({
					type: CBT_ERROR
				});
				return;
			}
			_pathName = UrlWorkHelper.get_pathName(url);
			_fileName = UrlWorkHelper.get_fileName(url);
			DebugUtil.test('_domain: ' + _domain);
			DebugUtil.test('_pathName: ' + _pathName);
			DebugUtil.test('_fileName: ' + _fileName);
			
			_ul = new URLLoader();
			_ul.addEventListener(Event.COMPLETE, p_loadComplete);
			_ul.addEventListener(IOErrorEvent.IO_ERROR, p_loadIoError);
			_ul.load(new URLRequest(url));
		}
		
		// ::
		private function p_loadComplete(event:Event):void
		{
			var t_txt:String = String(_ul.data);
			//_imgs = t_txt.match(/<img[^>]*>/gi);
			//_imgs = t_txt.match(/<img[^\\>]*>/gi);
			_imgs = t_txt.match(/<img\s[^\\<>]+>/gi);
			if (ComUtil.arr_get_isEmpty(_imgs)) return;
			
			var t_la:uint = _imgs.length;
			for (var i:uint = 0; i < t_la; i++)
			{
				var t_img:String = _imgs[i];
				_imgs[i] = UrlWorkHelper.get_imgUrl(_domain, t_img);
			}
			
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