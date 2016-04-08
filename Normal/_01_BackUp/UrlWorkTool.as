package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import hb.utils.DebugUtil;
	

	public final class UrlWorkTool {

		public function UrlWorkTool() {
			// constructor code
		}
		
	
		// ::
		public static function start(callBack:Function):void
		{
			_callBack = callBack;
		}
		
		//
		public static const CBT_URL_LOAD_COMPLETE:String = 'urlLoadComplete';
		public static const CBT_URL_LOAD_IO_ERROR:String = 'urlLoadIoError';
		
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


		//
		//
		//		
		// :: 도메인 추출
		private static function p_url_get_baseRootUrl(url:String):String
		{
			var t_ms:Array = url.match(/^(https?\:\/\/)[^\/]*\//g);
			if (t_ms != null)
			{
				var t_m = t_ms[0];
				if (t_m != null)
				{
					return t_m;
				}
			}
			return null;
		}
		
		// :: (도메인 + 마지막 경로) 추출
		private static function p_url_get_baseLastUrl(url:String):String {
			var t_ms:Array = url.match(/([^\/]*$)/g);
			if (t_ms != null) {
				var t_m = t_ms[0];
				if (t_m != null) {
					return url.replace(t_m, '');
				}
			}
			return null;
		}		
		
		private static var _baseRootUrl:String = null;
		private static var _baseLastUrl:String = null;;
		private static var _ul:URLLoader = null;
		private static var _imgs:Array = null;
		// ::
		public static function get_imgs():Array
		{
			return _imgs;
		}		
				
		private static var _il:uint;
		private static var _i:uint;

		
		// ::
		public static function clear():void
		{
			try
			{
				_ul.close();
			}
			catch (e:Error) {}
			
			_baseRootUrl = null;
			_ul = null;
			_imgs = null;
		}
		
		// ::
		public static function load(url:String):void
		{
			clear();
			
			_baseRootUrl = p_url_get_baseRootUrl(url);
			if (_baseRootUrl == null) return;
			_baseLastUrl = p_url_get_baseLastUrl(url);			
			DebugUtil.test('_baseRootUrl: ' + _baseRootUrl);
			DebugUtil.test('_baseLastUrl: ' + _baseLastUrl);
			
			_ul = new URLLoader();
			_ul.addEventListener(Event.COMPLETE, p_load_complete);
			_ul.addEventListener(IOErrorEvent.IO_ERROR, p_load_ioError);
			_ul.load(new URLRequest(url));			
		}
		
		// ::
		private static function p_load_complete(event:Event):void
		{
			var t_txt:String = String(_ul.data);
			p_fakeDouble(t_txt);
			p_call_callBack({
				type: CBT_URL_LOAD_COMPLETE
			});
		}
		
		// ::
		private static function p_load_ioError(IOErrorEvent:Event):void
		{
			p_call_callBack({
				type: CBT_URL_LOAD_IO_ERROR
			});			
		}
		
	
		// ::
		private static function p_fakeDouble(txt:String):void
		{
			var t_lss:Array = txt.split('\n');
			if (t_lss == null) return;
			if (t_lss.length < 1) return;
			
			for
			(
				var
					t_la:uint = t_lss.length,
					i:uint = 0;
					i < t_la;
					i++
			)
			{
				var t_ls:String = t_lss[i];
				var t_ms:Array = t_ls.match(/<img[^>]*>/gi);
				if (t_ms == null) continue;
				if (t_ms.length < 1) continue;
				
				var t_m:String = t_ms[0];
				t_m = p_fakeImg(t_m);
				if (_imgs == null)
					_imgs = [];
				_imgs.push(t_m);
			}
		}
		
		// ::
		private static function p_fakeImg(m:String):String
		{
			var t_srcs:Array = m.match(/\ssrc\s*=\s*(((["\'][^"\']+["\']))|(([^>\s]+)))/gi);
			if ((t_srcs != null) &&
				(t_srcs.length > 0))
			{
				var t_src:String = t_srcs[0];
				var t_val:String = t_src.split(/ src=["']?/gi)[1];
				t_val = t_val.replace(/["']?/g, '')
				var t_url:String = p_fakeImgUrlCheck(t_val);
				if (t_url != null) {
					return t_url;
				}
			}			
			return null;
		}
		
		// ::
		private static function p_fakeImgUrlCheck(val:String):String
		{/*
			if (val.match(/.(gif)$|(jpg)$|(png)$/gi).length < 1)
			{
				return null;
			}*/

			var t_mats:Array = val.match(/^(https?\:\/\/)/gi);
			if ((t_mats != null) &&
				(t_mats.length > 0))
			{
				return val;
			}
			else
			{
				return _baseRootUrl + val;
			}
			return null;
		}
	}

}
