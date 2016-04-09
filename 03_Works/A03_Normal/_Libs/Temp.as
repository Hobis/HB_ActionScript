import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLStream;
import flash.display.MovieClip;



// ::
function p_fakeImgDownload_complete(event:Event):void
{
	var t_us:URLStream = URLStream(event.currentTarget);
	//trace(t_us.bytesAvailable);
	//t_us.position = 0;
	//trace(t_us);
	//trace(t_us.readUTFBytes(t_us.bytesAvailable));
	//trace(t_us.);
}

// ::
function p_fakeImgDownload(url:String):void
{
	_us = new URLStream();
	_us.addEventListener(Event.COMPLETE, p_fakeImgDownload_complete);
	_us.load(new URLRequest(url));
	if (_uss == null) {
		_uss = [];
	}
	_uss.push(_us);
}
var _uss:Array = null;
var _us:URLStream = null;

// ::
function p_fakeImgUrlCheck(val:String):String
{
	if (val.match(/.(gif)$|(jpg)$|(png)$/gi).length < 1)
	{
		return null;
	}

	var t_mats:Array = val.match(_REG_URL_HEAD);
	if ((t_mats != null) &&
		(t_mats.length > 0))
	{
		return val;
	}
	else
	{
		return _baseUrl + val;
	}
	return null;
}

// ::
function p_fakeImg(img:String):void
{
	var t_srcs:Array = img.match(_REG_IMG_SRC);
	if ((t_srcs != null) &&
		(t_srcs.length > 0))
	{
		var t_src:String = t_srcs[0];
		var t_val:String = t_src.split(_REG_SRC_HEAD)[1];
		t_val = t_val.replace(/["']?/g, '')
		var t_url:String = p_fakeImgUrlCheck(t_val);
		if (t_url != null) {
			trace(t_url);
			//p_fakeImgDownload(t_url);
		}
	}
}

// ::
function p_fakeDouble(txt:String):void
{
	_lss = txt.split('\n');
	for each (_ls in _lss)
	{
		var t_imgs:Array = _ls.match(_REG_IMG);
		if ((t_imgs != null) &&
			(t_imgs.length > 0))
		{
			var t_img:String = t_imgs[0];
			p_fakeImg(t_img);
		}
	}
}

// ::
function p_load(url:String):void
{
	_baseUrl = url.match(_REG_BASE_URL)[0];
	trace(_baseUrl);
	_ul = new URLLoader();
	_ul.addEventListener(Event.COMPLETE,
		function(event:Event):void
		{
			var t_txt:String = String(_ul.data);
			p_fakeDouble(t_txt);
			//trace(t_txt);
			_ul = null;
		}
	);
	_ul.addEventListener(IOErrorEvent.IO_ERROR,
		function(event:IOErrorEvent):void
		{
			_ul = null;
		}
	);
	_ul.load(new URLRequest(url));
}

const _REG_BASE_URL:RegExp = /^(https?\:\/\/)[^\/]*/gi;
const _REG_IMG:RegExp = /<img[^>]*>/gi;
const _REG_IMG_SRC:RegExp = /\ssrc\s*=\s*(((["\'][^"\']+["\']))|(([^>\s]+)))/gi;
const _REG_SRC_HEAD:RegExp = / src=["']?/gi;
const _REG_URL_HEAD:RegExp = /^(https?\:\/\/)/gi;
var owner:MovieClip = this;
var _baseUrl:String = null;
var _ul:URLLoader = null;
var _lss:Array = null;
var _ls:String = null;
var _il:uint;
var _i:uint;

//p_load('https://www.youtube.com/watch?v=SEFy0SE5lgA&list=PLUqTUbiX62Ro_ma5HdJ338tXZ_O_tYpq2');
//p_load('http://k.kbs.co.kr/#');
p_load('https://www.torrentmoa.com/JAV/117551');
