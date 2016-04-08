import flash.display.MovieClip;
import flash.display.SimpleButton;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filesystem.File;
import hb.utils.DebugUtil;
import tools.PopUpTool;
import tools.TxtTool;
import utils.ComUtil;
import workers.UrlWork;
import workers.DownloadWork;


// ::
function p_resultPrint(ln:String, imgs:Array):void
{
	for each (var t_img:String in imgs)
	{
		if (t_img != null)
		{
			TxtTool.add(ln, t_img);
		}
	}
}

// ::
function p_urlWork_callBack(eObj:Object):void
{
	DebugUtil.test('eObj.type: ' + eObj.type);
	
	switch (eObj.type)
	{
		case UrlWork.CBT_COMPLETE:
		{
			p_resultPrint('2', _urlWork.get_imgs());
			_urlWork.checkNext(false);
			break;
		}
		case UrlWork.CBT_ERROR:
		{
			_urlWork.checkNext(false);
			break;
		}
		case UrlWork.CBT_COMPLETE_ALL:
		{
			ComUtil.dispose(_urlWork);
			_urlWork = null;
			PopUpTool.close();
			break;
		}
	}
}

// ::
function p_downloadWork_callBack(eObj:Object):void
{
	DebugUtil.test('eObj.type: ' + eObj.type);
	
	switch (eObj.type)
	{
		case DownloadWork.CBT_COMPLETE:
		{
			TxtTool.add('4', _downloadWork.get_url());
			_downloadWork.checkNext(false);
			break;
		}
		case DownloadWork.CBT_ERROR:
		{
			_downloadWork.checkNext(false);
			break;
		}
		case DownloadWork.CBT_COMPLETE_ALL:
		{
			ComUtil.dispose(_downloadWork);
			_downloadWork = null;
			PopUpTool.close();
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
	
	_fdp = new File(File.applicationDirectory.resolvePath('_Downs').nativePath);
	_fdp.addEventListener(Event.SELECT,
		function(event:Event):void
		{
			TxtTool.set('3', _fdp.nativePath);
		}
	);	
	if (_fdp.exists) {}
	else
	{
		_fdp.createDirectory();
	}
	TxtTool.clear('3');
	TxtTool.set('3', _fdp.nativePath);
	
	TxtTool.clear('4');
	
	
	SimpleButton(owner.bt_1).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			ComUtil.dispose(_urlWork);
			_urlWork = null;
			TxtTool.clear('1');
		}
	);
	SimpleButton(owner.bt_2).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			var t_txt:String = TxtTool.get('1');
			if (t_txt.length == 0) return;
			
			var t_lss:Array = t_txt.split('\r');
			if (ComUtil.arr_get_isEmpty(t_lss)) return;
			
			PopUpTool.open('#_1');
			_urlWork = new UrlWork(t_lss, p_urlWork_callBack);
			_urlWork.checkNext();
		}
	);
	SimpleButton(owner.bt_3).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			ComUtil.dispose(_downloadWork);
			_downloadWork = null;
			TxtTool.clear('2');
		}
	);
	SimpleButton(owner.bt_4).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			var t_txt:String = TxtTool.get('2');
			if (t_txt.length == 0) return;
			
			var t_lss:Array = t_txt.split('\r');
			if (ComUtil.arr_get_isEmpty(t_lss)) return;
			
			PopUpTool.open('#_2');
			_downloadWork = new DownloadWork(t_lss, _fdp, p_downloadWork_callBack);
			_downloadWork.checkNext();
			TxtTool.clear('4');
		}
	);
	SimpleButton(owner.bt_5).addEventListener(MouseEvent.CLICK,
		function(event:MouseEvent):void
		{
			_fdp.browseForDirectory('파일을 다운로드 할 경로를 설정해 주세요.');
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

// -
var owner:MovieClip = this;
// - FileDownloadPath
var _fdp:File = null;
// -
var _urlWork:UrlWork = null;
// -
var _downloadWork:DownloadWork = null;


p_initOnce();
