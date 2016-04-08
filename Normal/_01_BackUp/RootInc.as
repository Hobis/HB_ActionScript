import flash.display.MovieClip;
import flash.display.SimpleButton;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filesystem.File;
import hb.utils.DebugUtil;
import hb.utils.StringUtil;



// ::
function p_imgs_printResult(imgs:Array):void
{
	for each (var t_img:String in imgs)
	{
		TxtTool.add('2', t_img);
	}
}

// ::
function p_nextLoad(b:Boolean):void
{
	if (b) _i = 0;
	else _i += 1;
	
	if (_i < _il)
	{
		DebugUtil.test((_i + 1) + '/' + _il + ' 시도');		
		var t_ls:String = _lss[_i];		
		if (StringUtil.getIsEmpty(t_ls)) {
			p_nextLoad(false);
			return;
		}
		else {
			UrlWorkTool.load(t_ls);			
		}		
	}
	else
	{
		DebugUtil.test('모두 완료');
		PopUpTool.close();
	}
}

// ::
function p_UrlWorkTool_callBack(eObj:Object):void
{
	var t_b:Boolean = false;
	switch (eObj.type)
	{
		case UrlWorkTool.CBT_COMPLETE:
		{
			var t_imgs:Array = UrlWorkTool.get_imgs();
			p_imgs_printResult(t_imgs);
			p_nextLoad(false);
			break;
		}
		case UrlWorkTool.CBT_ERROR:
		{
			p_nextLoad(false);
			break;
		}
	}
}

// ::
function p_initOnce():void
{
	try
	{		
		owner.stage.nativeWindow.title = '이미지-Url-검출기 Ver 1.0b';
		owner.stage.nativeWindow.x = 40;
		owner.stage.nativeWindow.y = 40;
	}
	catch (e:Error) {}
	
	PopUpTool.start(owner.popUp_1);	
	TxtTool.start(owner);
	//TxtTool.stop();
	TxtTool.clear('1');
	TxtTool.clear('2');
	//TxtTool.add('1', 'http://www.nextree.co.kr/p4327/');
	//TxtTool.add('1', 'http://www.nextree.co.kr/p4327/');
	//TxtTool.add('1', 'https://www.youtube.com/watch?v=Ig7VKb3cACQ');
	//TxtTool.add('1', 'http://www.naver.com');
	TxtTool.add('1', 'https://www.google.co.kr/');
	TxtTool.add('1', 'http://www.daum.net/');
	TxtTool.add('1', 'http://www.naver.com/');
	UrlWorkTool.start(p_UrlWorkTool_callBack);	
	
	_dlpf = new File(File.applicationDirectory.resolvePath('_Downs').nativePath);
	_dlpf.addEventListener(Event.SELECT,
		function(event:Event):void
		{
			trace('~~~~~~~~~~~~');
		}
	);	
	if (_dlpf.exists) {}
	else
	{
		_dlpf.createDirectory();
	}
	TxtTool.clear('3');
	TxtTool.set('3', _dlpf.nativePath);
	
	TxtTool.clear('4');
	
	SimpleButton(owner.bt_1).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			UrlWorkTool.clear();
			TxtTool.clear('1');
		}
	);
	SimpleButton(owner.bt_2).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			var t_txt:String = TxtTool.get('1');
			if (t_txt.length == 0) return;
			
			_lss = t_txt.split('\r');
			if (RootTool.arr_get_isEmpty(_lss)) return;
			
			_il = _lss.length;
			PopUpTool.open('#_1');
			p_nextLoad(true);
		}
	);
	SimpleButton(owner.bt_3).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			UrlWorkTool.clear();
			TxtTool.clear('2');
		}
	);
	SimpleButton(owner.bt_4).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			var t_txt:String = TxtTool.get('2');
			_lts = t_txt.split('\r');
			if (RootTool.arr_get_isEmpty(_lts)) return;
			
			var t_la:uint = _lts.length;
			for (var i:uint = 0; i < t_la; i++)
			{
				var t_lt:String = _lts[i];
				trace(t_lt);
				if (t_lt != null)
				{
					//PopUpTool.open('#_2');
					UrlDownTool.load(t_lt, _dlpf.nativePath);
				}
				break;
			}
		}
	);
	SimpleButton(owner.bt_5).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			_dlpf.browseForDirectory('파일을 다운로드 할 경로를 설정해 주세요.');
		}
	);
	SimpleButton(owner.bt_6).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			TxtTool.clear('4');
		}
	);
	
	
	DebugUtil.test('==============================================================');
	DebugUtil.test('# 초기화 성공');
	DebugUtil.test('==============================================================');
}

var owner:MovieClip = this;
var _do:Object = null;
var _lss:Array = null;
var _il:uint;
var _i:uint;
var _lts:Array = null;
var _jl:uint;
var _j:uint;

var _dlpf:File = null;

p_initOnce();
